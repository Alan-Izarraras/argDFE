#Rscript that draws random numbers from 1 to 200 and stores the file in a list. after 100 random draws
#(100) matrices read to list, then sum all the elements to collapse to a single list and save it. 
#Do this 50 times. 

task_id <- Sys.getenv("SLURM_ARRAY_TASK_ID")
task_id <- as.numeric(task_id) #taskid controls matrix dimension

matrix_dim <- c("200x100", "20x100", "6x100", "200x40", "20x40", "6x40", "200x8", "20x8", "6x8")
file_in <- "../Data/trees/MatrixInputs/ConstantSize/set1/matrices/"
file_out <- "../Data/trees/MatrixInputs/ConstantSize/set1/rep_matrices/"

theta <- c("diezmil", "mil", "cien")
n <- c(100, 10, 1)
for (j in seq_along(theta))  {
  num <- n[j]
  for (s in 1:27)  {
    known_nrow <- NULL
    known_ncol <- NULL
    for (f in 1:50)  { #me faltó el zero padding. 
      rand_num_vector <- sample(1:200, size = num, replace = TRUE) #sampels with replacement.
      rand_num_vector <- sprintf("%03d", rand_num_vector) #adds zero-padding
      rand_matrix_list <- vector("list", num)
      
      for (k in seq_along(rand_num_vector)) {
        i <- rand_num_vector[k]
        filename <- paste0(file_in, matrix_dim[task_id], "_count_",s, i, "_sel", s, ".csv")
        if (file.exists(filename)) { #checks file existence (extreme sel trees have no seg sites sometimes)
          matriz <- read.csv(paste0(file_in, matrix_dim[task_id], "_count_",s, i, "_sel", s, ".csv"))
          matriz <- as.matrix(matriz)
          print(matriz)
          rand_matrix_list[[k]] <- matriz
          if (is.null(known_nrow)) {  #Records dimensions from any succesfully read matrix
            known_nrow <<- nrow(matriz)
            known_ncol <<- ncol(matriz)
          }
        } else { 
          l <- 193798
          matriz <- rand_matrix_list[[1]]
          empty_matrix <- matrix(0, nrow = known_nrow, ncol = known_ncol) #adds 0s to same dim
          empty_matrix[known_nrow, ] <- l  
          matriz <- empty_matrix  
          rand_matrix_list[[k]] <- matriz
        }
      }
      result_matrix <- Reduce(`+`, rand_matrix_list)
      write.csv(result_matrix, paste0(file_out, theta[j], "_", matrix_dim[task_id], "_count_kimDFE", s, "_rep", f, ".csv"), row.names = FALSE)
      print("rep matrix written")
    }
  }
}

#add option to track files used for each rep. 

