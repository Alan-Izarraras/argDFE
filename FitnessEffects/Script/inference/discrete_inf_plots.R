library(dplyr)    # loads %>% and mutate
library(tidyr)    # for pivot_longer
library(tibble)
library(ggplot2)

results <- read.csv("discrete_inferences_6x100_SFS.cvs")
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
    rep        = factor(rep, levels = paste0("rep", 1:50))
  )

xmin <- min(matriz_maximos$true_value, matriz_maximos$estimated_value, na.rm = TRUE)
xmax <- max(matriz_maximos$true_value, matriz_maximos$estimated_value, na.rm = TRUE)

by_step <- 1
breaks <- seq(from = floor(xmin), to = ceiling(xmax), by = by_step)

ggplot(matriz_maximos, aes(x = true_value, y = estimated_value)) +
  geom_count(alpha = 0.5, color = 7) +

  # Force identical breaks **and** limits on both axes
  scale_x_continuous(breaks = breaks,
                     limits = c(min(breaks), max(breaks))) +
  scale_y_continuous(breaks = breaks,
                     limits = c(min(breaks), max(breaks))) +

  labs(title= "6x100 SFS", x= "True Value", y= "Estimated Value")

  # Optional: make the plot square so 1 unit = 1 unit
  coord_equal() +

  # Nice theme (optional)
  theme_minimal()






  