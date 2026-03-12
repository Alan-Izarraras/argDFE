#check.R

prob_matrix_list <- list()
for (i in 1:27)  {
  prob_matrix_list[[i]] <- read.csv(paste0("../../Data/trees/MatrixInputs/ConstantSize/set2/matrices/new_pseudocount/200x8_count_kimDFE_Sel", i, ".csv"))
  matriz <- prob_matrix_list[[i]]
  matriz <- matriz[-200,]
  sites <- sum(matriz[,9])
  
}
matriz_prob <- matriz / sites
print(matriz)
print(sites)
print(matriz_prob)
sum(matriz_prob[,1])