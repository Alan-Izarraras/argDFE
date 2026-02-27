#takes mini count matrices (from set2 simulations)
#and makes them into consensus matrix 
#sometimes there is no matrix, creates this matrix 
#then add a speudocount of 1 and finally transform to probability. 

task_id <- Sys.getenv("SLURM_ARRAY_TASK_ID")
task_id <- as.numeric(task_id) #taskid controls matrix dimension
l <- 19379845
matrix_dim <- c("200x100", "20x100", "6x100", "200x40", "20x40", "6x40", "200x8", "20x8", "6x8")
file_in <- "../Data/trees/MatrixInputs/ConstantSize/set2/matrices/new_pseudocount/mini_matrices/"
file_out <- "../Data/trees/MatrixInputs/ConstantSize/set2/matrices/new_pseudocount"

mini_matrix_list <- liat()

for (s in 1:27)  {
    known_nrow <- NULL
    known_ncol <- NULL
    k <- 1
  for (i in 201:300) {
    filename <- paste0(file_in, matrix_dim[task_id], "_count_",s,formatC(i, width = 3, flag = "0"), "_sel", s, ".csv")
    if (file.exists(filename)) { #checks file existence (extreme sel trees have no seg sites sometimes)
      matriz <- read.csv(paste0(file_in, matrix_dim[task_id], "_count_",s, formatC(i, width = 3, flag = "0"), "_sel", s, ".csv"))
      matriz <- as.matrix(matriz)
      mini_matrix_list[[k]] <- matriz
      k <- k + 1
      if (is.null(known_nrow)) {  #Records dimensions from any succesfully read matrix
        known_nrow <<- nrow(matriz)
        known_ncol <<- ncol(matriz)
      }
    } else { #generates empty matrix
      l <- 193798
      matriz <- rand_matrix_list[[1]]
      empty_matrix <- matrix(0, nrow = known_nrow, ncol = known_ncol) #adds 0s to same dim
      empty_matrix[known_nrow, ] <- l  
      matriz <- empty_matrix  
      mini_matrix_list[[k]] <- matriz
    }
  }
  result_matrix <- Reduce(`+`, mini_matrix_list)
  result_matrix <- result_matrix + 1 #pseudocount
  max_effective_sites <- sum(matriz_conteo[,1])
  print(max_effective_sites)
  write.csv(result_matrix, paste0(file_out, theta[j], "_", matrix_dim[task_id], "_count_kimDFE", s, "_rep", f, ".csv"), row.names = FALSE)

} 

#a ver. para generar la amtriz de prob estoy dividiendo entre el total de mutaciones.
#luego a parte agrego la fila ultima que es l -  total de mutaciones! 
#ah entonces estoy computando mal en la integración. jaja. 
#entoncessssss 
#podria leer cada matriz sin l, al final agregarles esa fila. oh genero la matriz resultado, quito l y la reemplazo. 
#por lo pronto deberia probar que hasta aqui funciona luego incorporo todo lo demas. 
