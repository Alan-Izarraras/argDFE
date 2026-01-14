#Codigo para la Figura sumplementaria 1. Mostrar todos los valores de seleccion. con 7 valores impresos 
#Genera un plot con dos paneles. Panel A muestra inferencia en matriz panel B muestra inferencia en SFS.
#maybe I can add vertial + horizontal dotted lines to delimit selection intuition.
#Requiere trabajo porque aqui solo hay hasta el 26

library(tibble)
library(ggplot2)
library(dplyr)
library(tidyr)
library(patchwork)

results <- read.csv("discrete_inference_200x8_cien.csv")
results <- results[,-1]
colnames(results) <- c(1:26)

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
breaks <- c(1:26)

p1 <- ggplot(matriz_maximos, aes(x = true_value, y = estimated_value)) +
    geom_count(alpha = 0.5, color = 2) +
    scale_size_area(max_size = 8) +
    labs(size = "Simulation \n replicates", x = expression("Real value of" ~ gamma), y = expression("Estimated value of" ~ gamma), title = expression(F^1 * ", K = 8 time points")) +
    #plot.title = element_text(hjust = 0.5) +
    #expression()
    # Force identical breaks **and** limits on both axes
    scale_x_continuous(breaks = breaks, 
                       labels = c(0,"","","",0.01,"","","",0.1,"","","",1,"","","",10,"","","",100,"","","",1000,""),
                       limits = c(min(breaks), max(breaks))) +
    scale_y_continuous(breaks = breaks,
                       labels = c(0,"","","",0.01,"","","",0.1,"","","",1,"","","",10,"","","",100,"","","",1000,""),
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
results <- read.csv("discrete_inference_200x8_SFS_cien.csv")
results <- results[,-1]
colnames(results) <- c(1:26)

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
breaks <- c(1:26)

p2 <- ggplot(matriz_maximos, aes(x = true_value, y = estimated_value)) +
    geom_count(alpha = 0.5, color = 3) +
    scale_size_area(max_size = 8) +
    labs(size = "Simulation \n replicates", x = expression("Real value of" ~ gamma), y = expression("Estimated value of" ~ gamma), title = expression(F^1 * ", K = 1 time points")) +
    #plot.title = element_text(hjust = 0.5) +
    #expression()
    # Force identical breaks **and** limits on both axes
    scale_x_continuous(breaks = breaks, 
                       labels = c(0,"","","",0.01,"","","",0.1,"","","",1,"","","",10,"","","",100,"","","",1000,""),
                       limits = c(min(breaks), max(breaks))) +
    scale_y_continuous(breaks = breaks,
                       labels = c(0,"","","",0.01,"","","",0.1,"","","",1,"","","",10,"","","",100,"","","",1000,""),
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

combined <- (p1 | p2) + 
  plot_annotation(
    title = expression(theta == 100),
    theme = theme(plot.title = element_text(size = 22, 
                                            face = "bold", 
                                            hjust = 0.5)))

ggsave("Supplementary_figure_6.pdf", 
       plot = combined, 
       width = 19, height = 9,   # Wider for 2x2
       dpi = 300)




