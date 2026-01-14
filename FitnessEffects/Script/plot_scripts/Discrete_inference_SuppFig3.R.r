#Codigo para la Figura sumplementaria ?. Mostrar todos los valores de seleccion. con todos los valores impresos 
#De las matrices construidas con 10k theta pero ahora cambiando tiempos.
#3 paneles.
#maybe I can add vertial + horizontal dotted lines to delimit selection intuition.

library(tibble)
library(ggplot2)
library(dplyr)
library(tidyr)
library(patchwork)

results <- read.csv("discrete_inference_200x100_diezmil.csv")
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

#F^35 (6x8)
p1 <- ggplot(matriz_maximos, aes(x = true_value, y = estimated_value)) +
    geom_count(alpha = 0.5, color = 12) +
    scale_size_area(max_size = 6) + #expression("R"^2 ~ " = 0.95"))
    labs(size = "Simulation \n replicates", x = expression("Real value of" ~ gamma), y = expression("Estimated value of" ~ gamma), title = expression("A)" ~ F^1 * ", K = 100 time points")) +
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

###Plot number 2 (K^10 aka 20x8)
results <- read.csv("discrete_inference_200x40_diezmil.csv")
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
    geom_count(alpha = 0.5, color = 14) +
    scale_size_area(max_size = 6) +
    labs(size = "Simulation \n replicates", x = expression("Real value of" ~ gamma), y = expression("Estimated value of" ~ gamma), title = expression("B)" ~ F^1 * ", K = 40 time points")) +
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
        legend.title = element_text(size = 16),   # Legend TITLE
        legend.text = element_text(size = 16),
        plot.margin = margin(1, 1, 1, 1)
      )

###Plot number 3 (K^1 aka 20x8)
results <- read.csv("discrete_inference_200x8_diezmil.csv")
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
    geom_count(alpha = 0.5, color = 10) +
    scale_size_area(max_size = 6) +
    labs(size = "Simulation \n replicates", x = expression("Real value of" ~ gamma), y = expression("Estimated value of" ~ gamma), title = expression("C)" ~ F^1 * ", K = 8 time points")) +
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
        legend.title = element_text(size = 16),   # Legend TITLE
        legend.text = element_text(size = 16),
        plot.margin = margin(1, 1, 1, 1)
      )

combined<-(p1 | p2 | p3)

# Save
ggsave("Supplementary_figure_3.pdf", 
       plot = combined, 
       width = 19, height = 6,   # Wider for 2x2
       dpi = 300)



