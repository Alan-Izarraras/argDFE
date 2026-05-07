#takes mini count matrices (from set2 simulations)
#and makes them into consensus matrix 
#sometimes there is no matrix, creates this matrix 
#then add a speudocount of 1 and finally transform to probability. 

task_id <- Sys.getenv("SLURM_ARRAY_TASK_ID")
task_id <- as.numeric(task_id) #taskid controls matrix dimension
l <- 19379845

matrix_dim <- c("200x100", "20x100", "6x100", "200x40", "20x40", "6x40", "200x8", "20x8", "6x8")
file_in <- "../Data/trees/MatrixInputs/ConstantSize/set2/matrices/new_pseudocount/mini_matrices/"
file_out <- "../Data/trees/MatrixInputs/ConstantSize/set2/matrices/new_pseudocount/cien/"

mini_matrix_list <- list()

for (s in 1:27)  {
    known_nrow <- NULL
    known_ncol <- NULL
    k <- 1
  for (i in 201:202) { #cambiar para distinto valor de teta
    filename <- paste0(file_in, matrix_dim[task_id], "_count_",s,formatC(i, width = 3, flag = "0"), "_sel", s, ".csv")
    #print(filename)
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
      print("creating empty matrix")
      l <- 193798.45
      empty_matrix <- matrix(0, nrow = known_nrow, ncol = known_ncol) #adds 0s to same dim
      empty_matrix[known_nrow, ] <- l    
      mini_matrix_list[[k]] <- empty_matrix
      k <- k + 1
    }
  } 
  result_matrix <- Reduce(`+`, mini_matrix_list)
  result_matrix <- result_matrix + 0.001 #pseudocount #no se hace bien, sobrepasa 1. 
  #esto se hace bien.
  #### Me quede aqui.
  sites <- result_matrix[-known_nrow, known_ncol]
  sites <- sum(sites)
  prob_matrix <- result_matrix[-known_nrow, ] / sites #test. #cambiar por variables
  probs <- sum(prob_matrix[,1])
  print(probs)
  prob_matrix <- rbind(prob_matrix, result_matrix[known_nrow,])
  #print(prob_matrix)
  write.csv(result_matrix, paste0(file_out, matrix_dim[task_id], "_count_cien_kimDFE_Sel", s, ".csv"), row.names = FALSE)
  write.csv(prob_matrix, paste0(file_out, matrix_dim[task_id], "_prob_cien_kimDFE_Sel", s, ".csv"), row.names = FALSE)

} 


