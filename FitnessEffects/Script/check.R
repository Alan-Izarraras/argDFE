#check.R

prob_matrix_list <- list()
for (i in 1:27)  {
  prob_matrix_list[[i]] <- read.csv(paste0("../../Data/trees/MatrixInputs/ConstantSize/set2/matrices/new_pseudocount/200x8_prob_kimDFE_Sel", i, ".csv"))
  matriz <- prob_matrix_list[[i]]
  prob <- sum(matriz[-201,1])
  
}

print(matriz)