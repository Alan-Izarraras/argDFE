#Codigo para la Figura sumplementaria 1. Mostrar todos los valores de seleccion. con 7 valores impresos 
#De las matrices construidas con 10k theta 8 vs 1 tiempo.
#Genera un plot con dos paneles. Panel A muestra inferencia en matriz panel B muestra inferencia en SFS.
#Al final guarda todo en un PDF.  
#maybe I can add vertial + horizontal dotted lines to delimit selection intuition.
#a esto agregarle tiempos 40 y 100

library(tibble)
library(ggplot2)
library(dplyr)
library(tidyr)
library(patchwork)

###plot 100 tiempos
results <- read.csv("../inference/ConstantSize/discrete_inference_200x100_mil.csv")
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
    geom_count(alpha = 0.5, color = "#440154FF") +
    scale_size_area(max_size = 7) +
    labs(size = "Simulation \n replicates", x = expression("Real value of" ~ gamma), y = expression("Estimated value of" ~ gamma), title = expression("A)" * " K = 100 time points")) +
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
        plot.margin = margin(3, 5, 3, 5)  # top, right, bottom, left (in mm)
      )

###plot 40 tiempos
results <- read.csv("../inference/ConstantSize/discrete_inference_200x40_mil.csv")
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

p2 <- ggplot(matriz_maximos, aes(x = true_value, y = estimated_value)) +
    geom_count(alpha = 0.5, color = "#414487FF") +
    scale_size_area(max_size = 7) +
    labs(size = "Simulation \n replicates", x = expression("Real value of" ~ gamma), y = expression("Estimated value of" ~ gamma), title = expression("B)" * " K = 40 time points")) +
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
        plot.margin = margin(3, 5, 3, 5)  # top, right, bottom, left (in mm)
      )


results <- read.csv("../inference/ConstantSize/discrete_inference_200x8_mil.csv")
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

p3 <- ggplot(matriz_maximos, aes(x = true_value, y = estimated_value)) +
    geom_count(alpha = 0.5, color = "#22A884FF") +
    scale_size_area(max_size = 7) +
    labs(size = "Simulation \n replicates", x = expression("Real value of" ~ gamma), y = expression("Estimated value of" ~ gamma), title = expression("C)" * " K = 8 time points")) +
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
        plot.margin = margin(3, 5, 3, 5)  # top, right, bottom, left (in mm)
      )

###Plot2
results <- read.csv("../inference/ConstantSize/discrete_inference_200x8_mil_SFS.csv")
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

p4 <- ggplot(matriz_maximos, aes(x = true_value, y = estimated_value)) +
    geom_count(alpha = 0.5, color = "#FDE725FF") +
    scale_size_area(max_size = 7) +
    labs(size = "Simulation \n replicates", x = expression("Real value of" ~ gamma), y = expression("Estimated value of" ~ gamma), title = expression("D)" * " K = 1 time points")) +
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
        plot.margin = margin(3, 5, 3, 5)  # top, right, bottom, left (in mm)
      )

combined <- (p1 | p2) / (p3 | p4) +
  plot_annotation(
    title = expression(theta == 1000),
    theme = theme(plot.title = element_text(size = 22, 
                                            face = "bold", 
                                            hjust = 0.5)))


library(tidyverse)

###Read in data.
experiment_files <- tribble(
  ~experiment,           ~path,
  "100",  "discrete_inference_200x100_mil.csv",
  "40",          "discrete_inference_200x40_mil.csv",
  "8",          "discrete_inference_200x8_mil.csv",
  "1",      "discrete_inference_200x8_mil_SFS.csv"
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

p5 <- ggplot(log_rmse_df, aes(x = factor(true_label), y = log_raw_rmse, group = experiment)) +
  geom_line(aes(color = experiment), linewidth = 1.5, alpha = 0.8) +
  geom_point(aes(color = experiment), pch = 20, size = 3.0, alpha = 0.8) +
  scale_color_viridis_d(name = "K") +  
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
    title = expression("E) log"[10] ~ "(RMSE) across" ~ gamma ~ "values (" ~ theta ~ "= 1000)")
  ) +
  
  theme(
    #plot.title = element_text(size = 22),
    axis.text.x = element_text(angle = 45, hjust = 1, size = 12),
    axis.text.y = element_text(size = 16),
    axis.title = element_text(size = 20),
    legend.title = element_text(size = 16),
    legend.text = element_text(size = 16),
    panel.grid.major.x = element_blank(),
    panel.grid.minor = element_blank(),
    plot.title = element_text(size = 22),
    plot.margin = margin(1, 1, 1, 1)
  )

ggsave("Supplementary_figure_5.pdf", 
       plot = combined, 
       width = 12, height = 10,   # Wider for 2x2
       dpi = 300)

ggsave("Supplementary_figure_5_B.pdf", 
       plot = p5, 
       width = 12, height = 6,   # Wider for 2x2
       dpi = 300)

