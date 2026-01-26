#multi experiment rmse 

###Read in data.
experiment_files <- tribble(
  ~experiment,           ~path,
  "ConstantSize_200x8",  "../inference/ConstantSize/discrete_inference_200x8_diezmil.csv",
  "Bottleneck",          "../inference/Bottleneck/discrete_bottleneck_200x8.csv",
  "TwoPop_50gen",        "../inference/TwoPop/discrete_twopop_50gen.csv",
  # add more rows as needed
)

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

###Compute summaries by experiment 

log_rmse_df <- all_data |>
  filter(true_value > 0) |>
  group_by(experiment, true_label, true_value) |>
  summarise(
    log_RMSE        = sqrt(mean((log10(estimated_value) - log10(true_value))^2, na.rm = TRUE)),
    mean_log_bias   = mean(log10(estimated_value) - log10(true_value), na.rm = TRUE),
    rel_RMSE        = mean(abs(estimated_value - true_value) / true_value, na.rm = TRUE),
    prop_factor_2   = mean(estimated_value / true_value >= 0.5 & estimated_value / true_value <= 2, na.rm = TRUE),
    n               = n(),
    .groups         = "drop"
  )

###plot 
# Facet version – very clean when you have 3–8 experiments
ggplot(log_rmse_df, aes(x = true_label, y = log_RMSE, group = experiment)) +
  geom_line(aes(color = experiment), linewidth = 1.1) +
  geom_point(aes(color = experiment), size = 2.5) +
  scale_color_brewer(palette = "Dark2") +
  facet_wrap(~ experiment, ncol = 2, scales = "free_y") +   # or remove free_y if comparable
  labs(
    x = "True label",
    y = "log₁₀ RMSE",
    title = "log-RMSE across experiments"
  ) +
  theme_minimal() +
  theme(
    axis.text.x = element_text(angle = 90, hjust = 1, size = 8),
    legend.position = "bottom"
  )

# Alternative: one plot with dodged points/lines
ggplot(log_rmse_df, aes(x = true_label, y = log_RMSE)) +
  geom_line(aes(color = experiment), position = position_dodge(width = 0.6), linewidth = 1) +
  geom_point(aes(color = experiment), position = position_dodge(width = 0.6), size = 2.8) +
  scale_x_continuous(breaks = seq(1, 27, by = 4)) +
  labs(
    x = "True label (1 = 0.0 | 2–27 = log-spaced)",
    y = "log₁₀ RMSE",
    color = "Experiment"
  ) +
  theme_minimal()

  