#PLots segsites for set1 matrices. makes boxplot

###theta=1000
input_dir <- "../../Data/trees/MatrixInputs/new_likelihood_experiment/second_run/set1/matrices/diezmil/type2/"
segregating_matrix <- matrix(nrow=27, ncol=50)

for (i in 24:27)  {
  for (a in 1:50)  {
    matriz <- read.csv(paste(input_dir, "observed_diezmil_type2_200x8_count_matrix_Sel", i, "_rep", a, ".csv", sep=""))
    segregating_matrix[i,a] <- matriz[198,8] 
  }
}

diezmil <- write.csv(segregating_matrix, "diezmil_observed_200x8_sites_v1_test.csv")

###theta=100
#input_dir <- "../../Data/trees/MatrixInputs/new_likelihood_experiment/second_run/set1/matrices/cien/type2/"
#segregating_matrix <- matrix(nrow=26, ncol=50)

#for (i in 1:26)  {
#  for (a in 1:50)  {
#    matriz <- read.csv(paste(input_dir, "observed_cien_type2_200x8_count_matrix_Sel", i, "_rep", a, ".csv", sep=""))
#    segregating_matrix[i,a] <- matriz[198,8] 
#  }
#}

#cien <- write.csv(segregating_matrix, "cien_observed_200x8_sites.csv")

###Plot.

#observed_sites <- read.csv("segregating_sites_diezmil.cvs")
#observed_sites <- observed_sites[,-1]

#library(tidyverse)
#selection_values <- rownames(observed_sites)

#data_long <- observed_sites %>%
#  as.data.frame() %>%
#  rownames_to_column(var = "selection") %>%      # makes selection a column
#  pivot_longer(cols = -selection, 
#               names_to = "repetition", 
#               values_to = "n_mutations") %>%
#  mutate(selection = as.numeric(selection))   # or as.factor if discrete
  # if selection_values is a separate vector, use:
  # mutate(selection = rep(selection_values, times = ncol(observed_sites)))

# 2. Basic violin plot
#ggplot(data_long, aes(x = factor(selection), y = n_mutations)) +
#  geom_violin(fill = "skyblue", color = "black", alpha = 0.7) +
#  theme_minimal() +
#  labs(x = "Selection coefficient", 
#       y = "Number of observed mutations",
#       title = "Distribution of observed mutations across repetitions")