#R code. 
#works! now make copies by sampling with replacement.50 copies.  
set1_input <- "../../Data/trees/MatrixInputs/ConstantSize/set1/matrices/mil/"
#set1_input <- "../../Data/trees/MatrixInputs/new_likelihood_experiment/set1/source_trees/reps/"
set2_input <- "../../Data/trees/MatrixInputs/ConstantSize/set2/matrices/"

task_id <- Sys.getenv("SLURM_ARRAY_TASK_ID")
task_id <- as.numeric(task_id) #taskid controls matrix dimension

matrix_selection <- c("200x100", "20x100", "6x100", "200x40", "20x40", "6x40", "200x8", "20x8", "6x8")
prob_matrix_name <- paste(set2_input, "set2_", matrix_selection[task_id], "_prob_matrix_Sel", sep="")
count_matrix_name <- paste(set1_input, "observed_", matrix_selection[task_id], "_count_matrix_Sel", sep="")

print(matrix_selection[task_id])

matrix_list <- list()
 
total_sites <- 19379845

for (z in 1:50)  { #z handles repetition number
  inference_matrix <- matrix(nrow=1, ncol=27)
  for (a in (1:27))  { #Reads in every prob matrix (set2) #set2_200x100_prob_matrix_Sel1.csv
    prob_matrix <- read.csv(paste(prob_matrix_name, a, ".csv", sep=""))
    set2_fixed_sites <- prob_matrix[nrow(prob_matrix), 1] #recovers number of fixed mutations which are place on last row.
    set2_fixed_sites <- set2_fixed_sites / 10 #para mil entre 10 para cien entre 100
    #print(set2_fixed_sites)
    set2_mutated_sites <- total_sites - set2_fixed_sites #recovers number of mutated sites
    #print(set2_mutated_sites)
    #set2_prob_mutated_sites <- (set2_mutated_sites / total_sites)
    set2_prob_fixed_sites <- (set2_fixed_sites / total_sites) #recovers the probability of fixed sites
    #I might need this in probability.
    classic_inference_vector <- vector()
    inference_vector <- vector() #where each position is a selection coefficient. We initialize this at every new prob matrix read.
    prob_matrix <- prob_matrix[-nrow(prob_matrix), ] #Erase last row becuase it contains the total number of sites and not a probability.
    for (b in (1:27)) {  #Reads in every count matrix (set1) 
      likelihoods <- vector() #initizalize likelihood values. 
      count_matrix <- read.csv(paste(count_matrix_name, b, "_rep", z, ".csv", sep=""))
      #print(count_matrix)
      set1_fixed_sites <- count_matrix[nrow(count_matrix), 1] #grabs number of fixed sites. from first element of the last row.
      #print(set1_fixed_sites)
      #print(1000000 - set1_fixed_sites)
      count_matrix <- count_matrix[-nrow(count_matrix), ] #Erase last row becuase it contains the total number of sites. 
      i <- 1 #initializes counter to use as vector subset 
      for (r in 1:nrow(count_matrix))  {  #Starts likelihood calc of this particular combination of matrices
        for (c in 1:ncol(count_matrix))  {
          if (count_matrix[r, c] != 0)  {
          likelihoods[i] <- count_matrix[r,c] * log(prob_matrix[r, c]) #Necesito que este archivo no cambie
          i <- i +1
          }
        }
      }
    #Calculates number of sites likelihood for each count matrix operation to add to previous likelihood.
      fixed_sites_likelihood <- set1_fixed_sites * log(set2_prob_fixed_sites) #For fixed sites. Number of fixed sites observed times log of the prob of these fixed sites? 
      print(paste("probabilidad de sitios fijos en set2", set2_prob_fixed_sites))
      mutated_sites_likelihood <- (total_sites - set1_fixed_sites) * log((1-set2_prob_fixed_sites)) #for mutated sites. total sites - fixed gives you mutated sites and 1 - fixed sites prob gives you mutated sites prob
      variation_likelihood <- fixed_sites_likelihood + mutated_sites_likelihood ##add these two likelihoods
      loglikelihood_estimate <- sum(likelihoods) + variation_likelihood #Add both coalescent likelihood + sites likelihood 
      print(paste("versomilitud de coalescencias", sum(likelihoods), sep=""))
      print(paste("verosimilitud de la proporcion de sitios", variation_likelihood, sep=""))
      inference_vector[b] <- loglikelihood_estimate #store value. This corresponds to one prob matrix and one count amtrix pairing.
      print(paste("verosimilitud mixta",inference_vector[b], sep=""))
      classic_inference_vector[b] <- sum(likelihoods) 
    }
  #After this for loop is done we have the likelihood of one prob matrix against all count matrices.
    inference_matrix <- rbind(inference_matrix, inference_vector)
    #classic_inference_matrix <- rbind(classic_inference_matrix, classic_inference_vector)
  #print(inference_vector)
  #write.csv(inference_vector, paste("Sel", a, "_inference_200x100.csv", sep="")) #output es la inferencia de una matriz de prob contra todas las de cuentas.
  #write.csv(classic_i)
  }
#and after this one is done we have all likelihoods for all combinations
  inference_matrix <- inference_matrix[-1,]
  #classic_inference_matrix <- classic_inference_matrix[-1,]
  row.names(inference_matrix) <- c(1:27)
  colnames(inference_matrix) <- c(1:27)
  #write.csv(inference_matrix, paste(matrix_selection[task_id], "_discrete_inference_rep", z, ".csv", sep="")) #did not work
#works, just needs to take out first row and first column
  matrix_list <- append(matrix_list, list(inference_matrix))
  #write.csv(matrix_list, "valores_de_verosimilitud.csv")
#this should work, test with task_id = 9  
}

result_mat <- {
  rn_fun <- function(m) {
    rn <- if (is.null(rownames(m))) seq_len(nrow(m)) else rownames(m)
    sapply(seq_len(ncol(m)), function(j) rn[which.max(m[, j])])
  }
  do.call(rbind, lapply(matrix_list, rn_fun))
}

write.csv(result_mat, paste("/ConstantSize_discrete/discrete_inferences_", matrix_selection[task_id], "_mil.cvs", sep=""))

#Idealy I execute this and get plots in a single execute. 
#but first step is to test the results output alone. 

