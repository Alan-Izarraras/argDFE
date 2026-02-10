#Codigo para Figura 2. main text. Mostrar solamente 7 valores de seleccion. 
#De las matrices construidas con 10k theta 8 vs 1 tiempo.
#Genera un plot con dos paneles. Panel A muestra inferencia en matriz panel B muestra inferencia en SFS.
#Al final guarda todo en un PDF.  

library(tibble)
library(ggplot2)
library(dplyr)
library(tidyr)
library(patchwork)

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

matriz_subset <- matriz_maximos[matriz_maximos[[2]] %in% 5:27, ]
#a partir del 5 al 27. 
xmin <- min(matriz_subset$true_value, matriz_subset$estimated_value, na.rm = TRUE)
xmax <- max(matriz_subset$true_value, matriz_subset$estimated_value, na.rm = TRUE)

breaks <- 9:27
breaks_y <- 1:27

p1 <- ggplot(matriz_subset, aes(x = true_value, y = estimated_value)) +
    geom_count(alpha = 0.5, color = 1) +
    scale_size_area(max_size = 8) +
    labs(size = "Simulation \n replicates", x = expression("Real value of" ~ gamma), y = expression("Estimated value of" ~ gamma), title = "A) K = 8 different time points") +
    #expression()
    # Force identical breaks **and** limits on both axes
    scale_x_continuous(breaks = breaks, 
                       labels = c(0.1,"","","",1,"","","",10,"","","",100,"","","",1000,"",""),
                       limits = c(min(breaks), max(breaks))) +
    
    scale_y_continuous(breaks = breaks_y,
                       labels = c(0.0, "", "", "", 0.01, "", "", "", 0.1,"","","",1,"","","",10,"","","",100,"","","",1000,"",""),
                       limits = c(min(breaks_y), max(breaks_y))) +
    
    #labs(title = "A) R = 35, K = 8 different time points") +
    # Optional: make the plot square so 1 unit = 1 unit
    coord_equal() +
    # Nice theme (optional)
    theme(
        plot.title = element_text(size = 22),
        axis.text = element_text(size = 16),
        axis.title = element_text(size = 20),
        legend.title = element_text(size = 16),  
        legend.text = element_text(size = 16),
        plot.margin = margin(3, 5, 3, 5)  # top, right, bottom, left (in mm)
      )

###Second plot
results <- read.csv("discrete_inference_200x8_diezmil_SFS.csv")
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

matriz_subset <- matriz_maximos[matriz_maximos[[2]] %in% 5:27, ]
xmin <- min(matriz_subset$true_value, matriz_subset$estimated_value, na.rm = TRUE)
xmax <- max(matriz_subset$true_value, matriz_subset$estimated_value, na.rm = TRUE)

#by_step <- 1
#breaks <- seq(from = floor(xmin), to = ceiling(xmax), by = by_step)
breaks <- 9:27
breaks_y <- 1:27

p2 <- ggplot(matriz_subset, aes(x = true_value, y = estimated_value)) +
    geom_count(alpha = 0.5, color = 1) +
    scale_size_area(max_size = 8) +
    labs(size = "Simulation \n replicates", x = expression("Real value of" ~ gamma), y = expression("Estimated value of" ~ gamma), title = "B) K = 1 different time points") +
    # Force identical breaks **and** limits on both axes
    scale_x_continuous(breaks = breaks, 
                       labels = c(0.1,"","","",1,"","","",10,"","","",100,"","","",1000,"",""),
                       limits = c(min(breaks), max(breaks))) +
    scale_y_continuous(breaks = breaks_y,
                       labels = c(0.0, "", "", "", 0.01, "", "", "", 0.1,"","","",1,"","","",10,"","","",100,"","","",1000,"",""),
                       limits = c(min(breaks_y), max(breaks_y))) +
    
    coord_equal() +
    # Nice theme (optional)
    theme(
        plot.title = element_text(size = 22),
        axis.text = element_text(size = 16),
        axis.title = element_text(size = 20),
        legend.title = element_text(size = 16),   # Legend TITLE
        legend.text = element_text(size = 16),
        plot.margin = margin(1, 1, 1, 1)
      )


combined<-(p1 | p2)

# Save
ggsave("figure_2_main.pdf", 
       plot = combined, 
       width = 12, height = 6,   # Wider for 2x2
       dpi = 300)



