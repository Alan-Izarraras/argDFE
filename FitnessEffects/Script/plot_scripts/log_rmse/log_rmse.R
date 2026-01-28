#This works for a single dataset. 
#Pending:
#1) Solo mostrar 3 digitos en los ticks del eje x.
#2) Hacer una version de esto para los multiples experimentos. 
#
library(tibble)
library(ggplot2)
library(dplyr)
library(tidyr)
library(patchwork)

# Read data
results <- read.csv("discrete_inference_200x8_diezmil.csv")
results <- results[, -1]
colnames(results) <- 1:27

# Create the lookup vector once (length 27)
param_values = c(0.0, 10 ^ seq(from = -2.75, to = 3.5, length.out = 26))

# Reshape + map labels → real parameter values
matriz_maximos <- results %>%
  as.data.frame() %>%
  rownames_to_column("rep") %>%
  mutate(rep = paste0("rep", rep)) %>%
  pivot_longer(
    cols       = -rep,
    names_to   = "true_label",
    values_to  = "estimated_label"
  ) %>%
  mutate(
    true_label      = as.numeric(true_label),
    estimated_label = as.numeric(estimated_label),
    
    # Then just index it
    true_value      = param_values[true_label],
    estimated_value = param_values[estimated_label],
    
    rep             = factor(rep, levels = paste0("rep", 1:200))
  ) %>%
  # Small offset for log — common when 0 is included
  mutate(
    true_log10      = ifelse(true_value > 0, log10(true_value), NA_real_),
    estimated_log10 = ifelse(estimated_value > 0, log10(estimated_value), NA_real_)
  )

# ────────────────────────────────────────────────────────────────
# Compute log-RMSE per true bin (only for true_value > 0)
# ────────────────────────────────────────────────────────────────

log_rmse_df <- matriz_maximos %>%
  #filter(true_value > 0) %>%   # exclude true = 0 (log undefined)
  group_by(true_label, true_value) %>%
  summarise(
    # log10 RMSE — the main quantity
    log_RMSE = sqrt(mean((estimated_log10 - true_log10)^2, na.rm = TRUE)),
    
    # Companion metrics (very useful to report together)
    mean_log_error   = mean(estimated_log10 - true_log10, na.rm = TRUE),  # bias on log scale
    median_log_error = median(estimated_log10 - true_log10, na.rm = TRUE),
    rmse_raw         = sqrt(mean((estimated_value - true_value)^2, na.rm = TRUE)),  # for comparison
    log_raw_rmse     = log10(rmse_raw),
    rel_RMSE         = mean(abs(estimated_value - true_value) / true_value, na.rm = TRUE),
    label_RMSE       = sqrt(mean((estimated_label - true_label)^2, na.rm = TRUE)),
    prop_factor_2    = mean(estimated_value / true_value >= 0.5 & estimated_value / true_value <= 2, na.rm = TRUE),
    prop_factor_10   = mean(estimated_value / true_value >= 0.1 & estimated_value / true_value <= 10, na.rm = TRUE),
    n                = n(),
    
    .groups = "drop"
  ) %>%
  mutate(true_label_f = factor(true_label, levels = 1:27))

#makes -inf into -3, this category corresponds to no error. 
log_rmse_df$log_raw_rmse[is.infinite(log_rmse_df$log_raw_rmse)] <- -3

# ────────────────────────────────────────────────────────────────
# Plot: log-RMSE vs true label / true value
# ────────────────────────────────────────────────────────────────
new_labels <- log_rmse_df$true_value
new_labels <- as.numeric(sprintf("%.3g", new_labels))
new_labels <- format(round(new_labels, digits = 3), scientific = FALSE)

p_logrmse <- ggplot(log_rmse_df, aes(x = true_label_f, y = log_raw_rmse)) +
  geom_line(color = "darkorchid", linewidth = 1.1, group = 1) +          # connects the points with a line
  geom_point(size = 1.5, color = "darkorchid", shape = 21, fill = "darkorchid", stroke = 1.5) +
  geom_hline(yintercept = -2.1, linetype = "dashed", color = "grey50", linewidth = 0.9) +
  #esto pasarlo a un tick del eje Y
  #annotate("text", x = Inf, y = -1.8, label = "RMSE=0", hjust = 4, size = 3.4, color = "grey30") +

  scale_x_discrete(labels = new_labels) + 

  scale_y_continuous(
    limits = c(-3.1, 3.1),           # exact range
    expand = c(0, 0),            # remove the small padding ggplot adds by default
    breaks = seq(-3, 3, by = 1),  # optional: force nice breaks
    labels = c("RMSE=0", "-2", "-1", "0", "1", "2", "3")
  ) +

  labs(
    x     = expression(gamma ~ "values"), 
    y     = expression("log"[10] ~ "(RMSE)"),
    title = expression("log"[10] ~ "(RMSE) across" ~ gamma ~ "values")
  ) +

  theme_grey(base_size = 13) +
  theme(
    axis.text.x      = element_text(angle = 45, hjust = 1, size = 9),
    panel.grid.major.x = element_blank(),
    panel.grid.minor   = element_blank()
  )

  ggsave("figure_S1_rmse.pdf", plot = p_logrmse, width = 9, height = 5, dpi = 300)

