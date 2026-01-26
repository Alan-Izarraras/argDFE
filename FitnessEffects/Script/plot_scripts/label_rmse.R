#rmse on labels (equidistance)

library(tibble)
library(ggplot2)
library(dplyr)
library(tidyr)
library(patchwork)

# Read and prepare data
results <- read.csv("discrete_inference_200x8_diezmil.csv")
results <- results[, -1]           # drop first column (likely row index)
colnames(results) <- 1:27          # columns named "1" to "27"

# Reshape to long format
matriz_maximos <- results %>%
  as.data.frame() %>%
  rownames_to_column("rep") %>%          # rep1, rep2, ...
  mutate(rep = paste0("rep", rep)) %>%
  pivot_longer(
    cols      = -rep,
    names_to  = "true_label",
    values_to = "estimated_label"
  ) %>%
  mutate(
    true_label      = as.numeric(true_label),      # 1 .. 27
    estimated_label = as.numeric(estimated_label), # also 1 .. 27
    rep             = factor(rep, levels = paste0("rep", 1:200))
  )

# Compute RMSE (and related) per true label — treating labels as equidistant numbers
rmse_df <- matriz_maximos %>%
  group_by(true_label) %>%
  summarise(
    # RMSE on raw label difference (labels treated as equally spaced)
    RMSE_labels     = sqrt(mean((estimated_label - true_label)^2, na.rm = TRUE)),
    
    # More interpretable companion metrics
    MAE_labels      = mean(abs(estimated_label - true_label), na.rm = TRUE),
    Median_error    = median(estimated_label - true_label, na.rm = TRUE),
    Prop_correct    = mean(estimated_label == true_label, na.rm = TRUE),
    Prop_within_1   = mean(abs(estimated_label - true_label) <= 1, na.rm = TRUE),
    Prop_within_2   = mean(abs(estimated_label - true_label) <= 2, na.rm = TRUE),
    n_replicates    = n(),
    
    # For reference: mean of the estimated labels
    mean_estimated_label = mean(estimated_label, na.rm = TRUE),
    
    .groups = "drop"
  ) %>%
  mutate(
    true_label_factor = factor(true_label, levels = 1:27)
  )

# ────────────────────────────────────────────────────────────────
# Plot: RMSE on label scale (equidistant bins)
# ────────────────────────────────────────────────────────────────

p_rmse <- ggplot(rmse_df, aes(x = true_label_factor, y = RMSE_labels)) +
  geom_col(fill = "steelblue", color = "black", alpha = 0.85, width = 0.75) +
  geom_point(aes(y = MAE_labels), color = "tomato", size = 2.8, shape = 18) +
  
  geom_hline(yintercept = 1, linetype = "dashed", color = "grey50", linewidth = 0.8) +
  geom_hline(yintercept = 2, linetype = "dotted", color = "grey60", linewidth = 0.7) +
  
  annotate("text", x = 27, y = 1.1, label = "±1 bin", hjust = 1, size = 3.2, color = "grey30") +
  annotate("text", x = 27, y = 2.1, label = "±2 bins", hjust = 1, size = 3.2, color = "grey30") +
  
  labs(
    x     = expression("labeled values" ~ gamma)
    y     = "RMSE on label scale\n(treating bins as equidistant)",
    title = "Label RMSE across the discrete grid",
    subtitle = "Lower values = better bin recovery • MAE shown as red diamonds"
  ) +
  theme_minimal(base_size = 13) +
  theme(
    axis.text.x      = element_text(angle = 90, hjust = 1, vjust = 0.5, size = 9),
    panel.grid.major.x = element_blank(),
    panel.grid.minor   = element_blank()
  )

# Optional second view: proportion correctly recovered or close
p_prop <- ggplot(rmse_df, aes(x = true_label_factor)) +
  geom_col(aes(y = Prop_within_2, fill = "Within ±2 bins"), alpha = 0.7, width = 0.75) +
  geom_col(aes(y = Prop_within_1,  fill = "Within ±1 bin"),  alpha = 0.9, width = 0.75) +
  geom_col(aes(y = Prop_correct,   fill = "Exact match"),    alpha = 1.0, width = 0.75) +
  
  scale_fill_manual(
    values = c("Exact match" = "#1f77b4", "Within ±1 bin" = "#aec7e8", "Within ±2 bins" = "#d9d9d9"),
    name = NULL
  ) +
  
  labs(
    x     = "True label",
    y     = "Proportion",
    title = "Recovery performance on label scale"
  ) +
  theme_minimal(base_size = 13) +
  theme(
    axis.text.x      = element_text(angle = 90, hjust = 1, vjust = 0.5, size = 9),
    legend.position  = "bottom",
    panel.grid.major.x = element_blank()
  )

# Show both plots
p_rmse / p_prop

# Or just the RMSE one:
# print(p_rmse)

# Quick numerical summary (sorted by RMSE)
rmse_df %>%
  arrange(RMSE_labels) %>%
  select(true_label, RMSE_labels, MAE_labels, Prop_correct, Prop_within_1, Prop_within_2, n_replicates) %>%
  print(n = 12)