#This works for a single dataset. 
#Pending:
#1) Verify the case of 0.0 --> currently ignores 0.0
#ok lo que tengo que hacer es en la grafica agregar el raw rmse solo para 0. para todo lo demas muestro el log. 
#hmmm not comparable at all. maybe i just do label rmse for 0-case.and add it as a side plot?
#so run these for 26 values, then add a single plot for 0 label based. 
#2) Add multiple datasets
#3) tweak plot aesthetics


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
    rel_RMSE         = mean(abs(estimated_value - true_value) / true_value, na.rm = TRUE),
    label_RMSE       = sqrt(mean((estimated_label - true_label)^2, na.rm = TRUE)),
    prop_factor_2    = mean(estimated_value / true_value >= 0.5 & estimated_value / true_value <= 2, na.rm = TRUE),
    prop_factor_10   = mean(estimated_value / true_value >= 0.1 & estimated_value / true_value <= 10, na.rm = TRUE),
    n                = n(),
    
    .groups = "drop"
  ) %>%
  mutate(true_label_f = factor(true_label, levels = 1:27))

# ────────────────────────────────────────────────────────────────
# Plot: log-RMSE vs true label / true value
# ────────────────────────────────────────────────────────────────

p_logrmse <- ggplot(log_rmse_df, aes(x = true_label_f, y = log_RMSE)) +
  geom_line(color = "darkorchid", linewidth = 1.1, group = 1) +          # connects the points with a line
  geom_point(size = 1.5, color = "darkorchid", shape = 21, fill = "darkorchid", stroke = 1.5) +

  #geom_hline(yintercept = 0.3, linetype = "dashed", color = "grey50", linewidth = 0.9) +
  #geom_hline(yintercept = 1.0, linetype = "dotted", color = "grey60", linewidth = 0.8) +
  #annotate("text", x = Inf, y = 0.35, label = "≈ factor 2", hjust = 1.1, size = 3.4, color = "grey30") +
  #annotate("text", x = Inf, y = 1.05, label = "≈ factor 10", hjust = 1.1, size = 3.4, color = "grey30") +
  
  labs(
    x     = expression("labeled values of" ~gamma), 
    y     = expression("log"[10] ~ "RMSE" ~ ("parameter scale")),
    title = expression("log-RMSE across" ~ gamma ~ "values")
  ) +

  theme_minimal(base_size = 13) +
  theme(
    axis.text.x      = element_text(angle = 90, hjust = 1, vjust = 0.5, size = 9),
    panel.grid.major.x = element_blank(),
    panel.grid.minor   = element_blank()
  )

###Add single label-RMSE barplot for 0
zero_df <- log_rmse_df %>%
  filter(true_label == 1)   # or true_label_f == "1", or true_value == 0

p_zero <- ggplot(zero_df, aes(x = true_label_f, y = label_RMSE)) +
  geom_point(size = 1.5, color = "darkorchid", shape = 21, fill = "darkorchid", stroke = 1.5) +

  labs(
  x        = expression(gamma),
  y        = "label-RMSE",
  title    = expression(gamma == 0),
  ) +
  
  theme_minimal(base_size = 13) +
  theme(
    axis.text.x = element_text(size = 12, face = "bold"),
    panel.grid.major.x = element_blank(),
    panel.grid.minor   = element_blank()
  )


# Show both views
p_logrmse | p_logrmse_logx

# Quick numerical summary – sorted by log-RMSE
log_rmse_df %>%
  arrange(log_RMSE) %>%
  select(true_label, true_value, log_RMSE, mean_log_error, rel_RMSE, prop_factor_2, prop_factor_10, n) %>%
  print(n = 10)