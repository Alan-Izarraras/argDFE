#Codigo para la Figura sumplementaria 1. Mostrar todos los valores de seleccion. con 7 valores impresos 
#De las matrices construidas con 10k theta 8 vs 1 tiempo.
#Genera un plot con dos paneles. Panel A muestra inferencia en matriz panel B muestra inferencia en SFS.
#Al final guarda todo en un PDF.  
#maybe I can add vertial + horizontal dotted lines to delimit selection intuition.

library(tibble)
library(ggplot2)
library(dplyr)
library(tidyr)
library(patchwork)

results <- read.csv("../inference/ConstantSize/discrete_inference_200x8_diezmil.csv")
results <- results[,-1]
colnames(results) <- c(1:27)

matriz_maximos <- results %>%
    `rownames<-`(paste0("rep", 1:nrow(results))) %>% 
    as.data.frame() %>%                     # matrix → data.frame
    tibble::rownames_to_column("rep") %>%   # row names → column "rep"
    pivot_longer(
        cols = -rep,                        # all columns except "rep"
        names_to = "true_value",            # column names → true value
        values_to = "estimated_value"       # cell values → estimated value
    ) %>%                                   # ← FIXED: `]` removed
    mutate(
        true_value = as.numeric(true_value), # make sure it is numeric
        rep = factor(rep, levels = paste0("rep", 1:10))
    )

xmin <- min(matriz_maximos$true_value, matriz_maximos$estimated_value, na.rm = TRUE)
xmax <- max(matriz_maximos$true_value, matriz_maximos$estimated_value, na.rm = TRUE)
breaks <- c(1:27)

p1 <- ggplot(matriz_maximos, aes(x = true_value, y = estimated_value)) +
    geom_count(alpha = 0.5, color = 1) +
    scale_size_area(max_size = 6) +
    labs(size = "Simulation \n replicates", x = expression("Real value of" ~ gamma), y = expression("Estimated value of" ~ gamma), title = "A) K = 8 different time points") +
    #plot.title = element_text(hjust = 0.5) +
    #expression()
    # Force identical breaks **and** limits on both axes
    scale_x_continuous(breaks = breaks, 
                       labels = c(0,"","","",0.01,"","","",0.1,"","","",1,"","","",10,"","","",100,"","","",1000,"", ""),
                       limits = c(min(breaks), max(breaks))) +
    scale_y_continuous(breaks = breaks,
                       labels = c(0,"","","",0.01,"","","",0.1,"","","",1,"","","",10,"","","",100,"","","",1000,"", ""),
                       limits = c(min(breaks), max(breaks))) +

    coord_equal() +

    theme(
        plot.title = element_text(size = 22),
        axis.text = element_text(size = 16),
        axis.title = element_text(size = 20),
        legend.title = element_text(size = 16),  
        legend.text = element_text(size = 16),
        plot.margin = margin(1,1,1,1) #(3, 5, 3, 5)  # top, right, bottom, left (in mm)
      )

###Plot number 2

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
options(scipen = 0)

p2 <- ggplot(log_rmse_df, aes(x = true_label_f, y = log_raw_rmse)) +
  geom_line(color = 1, linewidth = 1.1, group = 1) +          # connects the points with a line
  geom_point(size = 1.5, color = 1, shape = 21, fill = 1, stroke = 1.5) +
  #geom_hline(yintercept = -2.1, linetype = "dashed", color = "grey50", linewidth = 0.9) +
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
    title = expression("B) log"[10] ~ "(RMSE) across" ~ gamma ~ "values")
  ) +

  #theme_grey(base_size = 13) +
  theme(
    #plot.title = element_text(size = 22),
    axis.text.x = element_text(angle = 45, hjust = 1, size = 12),
    axis.text.y = element_text(size = 16),
    axis.title = element_text(size = 20),
    panel.grid.major.x = element_blank(),
    panel.grid.minor = element_blank(),
    plot.title = element_text(size = 22),
    plot.margin = margin(1, 1, 1, 1)
  )

combined<-(p1 | p2)

# Save
ggsave("Supplementary_figure_1B.png", 
       plot = combined, 
       width = 15, height = 6,   # Wider for 2x2
       dpi = 300)





