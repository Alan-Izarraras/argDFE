#multi experiment rmse para figura S4 (T = 100, 40, 8; theta = 1,000)
#Hacer para... S6, S5, S4, S3, S1 

library(tidyverse)

###Read in data.
experiment_files <- tribble(
  ~experiment,           ~path,
  "100_times",  "discrete_inference_200x100_diezmil.csv",
  "40_times",          "discrete_inference_200x40_diezmil.csv",
  "8_times",          "discrete_inference_200x8_diezmil.csv",
  "1_times",    "discrete_inference_200x8_diezmil_SFS.csv"
  # add more rows as needed
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

###Compute summaries by experiment 

log_rmse_df <- all_data |>
  #filter(true_value > 0) |>
  group_by(experiment, true_label, true_value) |>
  summarise(
    log_RMSE        = sqrt(mean((log10(estimated_value) - log10(true_value))^2, na.rm = TRUE)),
    mean_log_bias   = mean(log10(estimated_value) - log10(true_value), na.rm = TRUE),
    rel_RMSE        = mean(abs(estimated_value - true_value) / true_value, na.rm = TRUE),
    label_RMSE       = sqrt(mean((estimated_label - true_label)^2, na.rm = TRUE)),
    prop_factor_2   = mean(estimated_value / true_value >= 0.5 & estimated_value / true_value <= 2, na.rm = TRUE),
    n               = n(),
    .groups         = "drop"
  )

###plot 
# Facet version – very clean when you have 3–8 experiments
p1 <- ggplot(log_rmse_df, aes(x = factor(true_label), y = label_RMSE, group = experiment)) +
  geom_line(aes(color = experiment), linewidth = 1.1) +
  geom_point(aes(color = experiment), size = 2.5) +
  scale_color_brewer(palette = "Dark2") +
  
  # This ensures every integer label appears
  scale_x_discrete(name = "True label", breaks = 1:27, labels = 1:27) +
  
  labs(y = "label-RMSE", title = expression("label-RMSE on different times" ~ (theta == 1000))) +
  theme_grey(base_size = 13) +
  theme(
    axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5, size = 8.5),
    panel.grid.major.x = element_blank(),
    panel.grid.minor = element_blank()
  )

  ggsave("figure_S4_rmse.pdf", 
       plot = p1, 
       width = 9, height = 5,   # Wider for 2x2
       dpi = 300)
