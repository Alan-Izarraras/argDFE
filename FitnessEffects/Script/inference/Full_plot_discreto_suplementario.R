library(tibble)
library(ggplot2)
library(dplyr)
library(tidyr)

results <- read.csv("discrete_inferences_type2_200x8_diezmil.cvs")
results <- results[,-1]
colnames(results) <- c(1:27)

###Converts my results matrix to an easy to plot dataframe. 
matriz_maximos <- results %>%
  `rownames<-`(paste0("rep", 1:nrow(results))) %>% 
  as.data.frame() %>%                     # matrix → data.frame
  tibble::rownames_to_column("rep") %>%   # row names → column "rep"
  pivot_longer(
    cols = -rep,                          # all columns except "rep"
    names_to = "true_value",              # column names → true value
    values_to = "estimated_value"         # cell values → estimated value
  ) %>%
  mutate(
    true_value = as.numeric(true_value),   # make sure it is numeric
    rep        = factor(rep, levels = paste0("rep", 1:10))
  )


xmin <- min(matriz_maximos$true_value, matriz_maximos$estimated_value, na.rm = TRUE)
xmax <- max(matriz_maximos$true_value, matriz_maximos$estimated_value, na.rm = TRUE)

by_step <- 4
breaks <- seq(from = floor(xmin), to = ceiling(xmax), by = by_step)
#Solo muestra hasta el valor 25, como hago que muestre 26 y 27? 

#Full plot
p1 <- ggplot(matriz_maximos, aes(x = true_value, y = estimated_value)) +
  geom_count(alpha = 0.5, color = 6) +
  labs(size = "Simulation \n replicates", x = "Real value of γ", y = "Estimated value of γ") +
    
  # Force identical breaks **and** limits on both axes
  scale_x_continuous(breaks = breaks, 
                       labels = c(0, 0.01, 0.1, 1, 10, 100, 1000),
                       limits = c(min(breaks), max(breaks))) +
                       
  scale_y_continuous(breaks = breaks,
                       labels = c(0, 0.01, 0.1, 1, 10, 100, 1000),
                       limits = c(min(breaks), max(breaks))) +
    
  labs(title = "A) K = 8 different time points") +
  # Optional: make the plot square so 1 unit = 1 unit
  coord_equal() +
  # Nice theme (optional)
  theme_minimal()