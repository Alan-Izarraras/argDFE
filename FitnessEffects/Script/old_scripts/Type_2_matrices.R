#Rscript. This script combines singletons with ancestral coalescence row. So that performance is boosted
#for extremely high selection coefficients. Done for both prob and count matrices. 
#this is executed AFTER having generated all matrices. 

#cambiar directorios para nuevas sims. 
input_diezmil <- "../Data/trees/MatrixInputs/ConstantSize/set1/matrices/diezmil/"
input_mil <- "../Data/trees/MatrixInputs/ConstantSize/set1/matrices/mil/"
input_cien <- "../Data/trees/MatrixInputs/ConstantSize/set1/matrices/cien/"
#ok necesito tener las de prob tambien? Si. 
set1_output <- "../Data/trees/MatrixInputs/ConstantSize/set1/matrices/"
set2_output <- "../Data/trees/MatrixInputs/ConstantSize/set2/type2/"
set2_input <- "../Data/trees/MatrixInputs/ConstantSize/set2/"

for (a in 1:27)  {
  prob_matrix <- read.csv(paste(set2_input, "set2_200x8_prob_matrix_Sel", a, ".csv", sep=""))

  #Fila a cambiar (y la siguiente)
  i <- nrow(prob_matrix) -2    # fila de singletones
  #reemplazo
  new_prob_matrix <- prob_matrix                                   
  new_prob_matrix[i, ] <- prob_matrix[i, ] + prob_matrix[i+1, ]              
  new_prob_matrix <- new_prob_matrix[- (i+1), ]

  write.csv(new_prob_matrix, paste(set2_output, "set2_type2_200x8_prob_matrix_Sel", a, ".csv", sep=""), row.names = FALSE)

  for (z in 1:50)  {
    count_matrix_diezmil <- read.csv(paste(input_diezmil, "observed_200x8_count_matrix_Sel", a, "_rep", z, ".csv", sep=""))
    count_matrix_mil <- read.csv(paste(input_mil, "observed_200x8_count_matrix_Sel", a, "_rep", z, ".csv", sep=""))
    #count_matrix_cien <- read.csv(paste(input_cien, "observed_200x8_count_matrix_Sel", a, "_rep", z, ".csv", sep=""))

    for (f in c("diezmil", "mil"))  {
      #Fila a cambiar (y la siguiente)
      i <- nrow(prob_matrix) -2    # fila de singletones
      #reemplazo
      count_matrix <- get(paste("count_matrix_", f, sep=""))
      new_count_matrix <- count_matrix                                  
      new_count_matrix[i, ] <- count_matrix[i, ] + count_matrix[i+1, ]              
      new_count_matrix <- new_count_matrix[- (i+1), ]

      write.csv(new_count_matrix, paste(set1_output, f, "/type2/observed_", f, "_type2_200x8_count_matrix_Sel", a, "_rep", z, ".csv", sep=""), row.names = FALSE)
    }
  }
}
#I think this works. 
print("done!")


