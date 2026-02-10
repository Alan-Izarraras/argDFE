#figure log rmse s7
library(tidyverse)

###Read in data.
experiment_files <- tribble(
  ~experiment,           ~path,
  "t = 100",  "discrete_inference_200x100_cien.csv",
  "t = 40",          "discrete_inference_200x40_cien.csv",
  "t = 8",          "discrete_inference_200x8_cien.csv",
  "t = 1",      "discrete_inference_200x8_cien_SFS.csv"
)

param_values = c(0.0, 10 ^ seq(from = -2.75, to = 3.5, length.out = 26))

all_data <- experiment_files |>
  mutate(data = map(path, ~ {
    read_csv(.x, show_col_types = FALSE) |>
      select(-1) |>
      set_names(1:27) |>
      mutate(rep = row_number()) |>
      pivot_longer(-rep, names_to = "true_label", values_to = "estimated_label") |>
      mutate(
        true_label      = as.numeric(true_label),
        estimated_label = as.numeric(estimated_label),
        true_value      = param_values[true_label],
        estimated_value = param_values[estimated_label]
      )
  })) |>
  unnest(data) |>
  select(-path) |>
  mutate(experiment = factor(experiment, levels = experiment_files$experiment))

log_rmse_df <- all_data |>
  #filter(true_value > 0) |>
  group_by(experiment, true_label, true_value) |>
  summarise(
    log_RMSE        = sqrt(mean((log10(estimated_value) - log10(true_value))^2, na.rm = TRUE)),
    mean_log_bias   = mean(log10(estimated_value) - log10(true_value), na.rm = TRUE),
    rel_RMSE        = mean(abs(estimated_value - true_value) / true_value, na.rm = TRUE),
    rmse_raw         = sqrt(mean((estimated_value - true_value)^2, na.rm = TRUE)),  # for comparison
    log_raw_rmse     = log10(rmse_raw),
    label_RMSE       = sqrt(mean((estimated_label - true_label)^2, na.rm = TRUE)),
    prop_factor_2   = mean(estimated_value / true_value >= 0.5 & estimated_value / true_value <= 2, na.rm = TRUE),
    n               = n(),
    .groups         = "drop"
  )
barra <- min(log_rmse_df$log_raw_rmse[is.finite(log_rmse_df$log_raw_rmse)])
log_rmse_df$log_raw_rmse[is.infinite(log_rmse_df$log_raw_rmse)] <- -3

new_labels <- log_rmse_df$true_value
new_labels <- as.numeric(sprintf("%.3g", new_labels))
options(scipen = 0)

p1 <- ggplot(log_rmse_df, aes(x = factor(true_label), y = log_raw_rmse, group = experiment)) +
  geom_line(aes(color = experiment), linewidth = 1.1,  alpha = 0.7) +
  geom_point(aes(color = experiment), pch = 15, size = 2.5, alpha = 0.7) +
  geom_hline(yintercept = barra, linetype = "dashed", color = "grey50", linewidth = 0.9) +
  scale_color_brewer(palette = "Dark2") +  
  # This ensures every integer label appears
  scale_x_discrete(labels = new_labels) +

  scale_y_continuous(
    limits = c(-3.1, 3.5),           # exact range
    expand = c(0, 0),            # remove the small padding ggplot adds by default
    breaks = seq(-3, 3, by = 1),  # optional: force nice breaks
    labels = c("RMSE=0", "-2", "-1", "0", "1", "2", "3")
  ) +
  
  labs(
    x     = expression(gamma ~ "values"), 
    y     = expression("log"[10] ~ "(RMSE)"),
    title = expression("log"[10] ~ "(RMSE) for different discrete times" ~ theta ~ "= 100")
  ) +
  
  theme_grey(base_size = 13) +
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1, size = 8.5),
    panel.grid.major.x = element_blank(),
    panel.grid.minor = element_blank()
  )

  ggsave("figure_S7_rmse.pdf", 
       plot = p1, 
       width = 9, height = 5,   # Wider for 2x2
       dpi = 300)