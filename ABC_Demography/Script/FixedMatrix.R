#Generate_Final_Observed.R 
#This script sums observed sub matrices generated with Fixed Paramter scripts. 
#It then sums all sub matrices and formats the final observed matrix. 
#Before running this ensure all independent sub matrices have been generated. 

# Set the directory containing your matrix files
matrix_files <- list.files(path = "../Data/Parameters/Output/matrices/observed_matrices/sub_matrices", pattern = "\\.csv$", full.names = TRUE)

mat_list <- lapply(matrix_files, function(file) {
  # Read CSV, explicitly excluding row names and column names
  df <- read.csv(file, header = FALSE, row.names = NULL, stringsAsFactors = FALSE, na.strings = c("", "NA"))
  
  df <- df[-1, ]

  # Convert to matrix
  mat <- as.matrix(df)
  
  # Convert to numeric (double)
  matrix(as.numeric(mat), nrow = nrow(mat), ncol = ncol(mat))
})

#print(mat_list[[1]])

# Sum all matrices into a single matrix
final_matrix <- Reduce("+", mat_list)

#Laplace smoothing to ssign small probability to each coalescent scenario.
pseudocuenta <- 0.05
final_matrix <- final_matrix + pseudocuenta

write.csv(final_matrix, "../Data/Parameters/Output/matrices/observed_matrices/observed_count_matrix.csv", row.names=FALSE)
prob_matrix <- final_matrix / sum(final_matrix[,1])
write.csv(prob_matrix, "../Data/Parameters/Output/matrices/observed_matrices/observed_prob_matrix.csv", row.names=FALSE)

print(final_matrix)





