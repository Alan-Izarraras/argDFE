#New integration method 
#No intermediary files, integration + likelihood calc in one script.
#Now just print likelihoods + parameters in new file, print winning parameters in script output and plot. 

### These are the target DFEs
#Kim (alfa = 0.186, Beta= 706)
#Boyko (alfa = 0.184, Beta = 3238)

#Grid of gamma distribution parameter values (12)
AlphaGrid <- 0.005*1:50
GammaGrid <- 50*1:240

valor_2Ns <- c(0, 10^seq(-2.75, 3.50, by = 0.25))
valor_medio <- (valor_2Ns[-length(valor_2Ns)] + valor_2Ns[-1]) / 2

l <- 19379845

#Read in prob_matrices as a list of matrices.

prob_matrix_list <- list()
for (i in 1:27)  {
  prob_matrix_list[[i]] <- read.csv(paste0("../../Data/trees/MatrixInputs/ConstantSize/set2/matrices/200x8_prob_matrix_Sel", i, ".csv"))
}

#Read in DFE_matrices 
#One per complete cycle, will implement in paralele for each dfe file.
dfe_matrix_list <- list()
for (i in 1:50)  {
  dfe_matrix_list[[i]] <- read.csv(paste0("../../Data/trees/MatrixInputs/ConstantSize/set1/rep_matrices/diezmil_200x8_count_kimDFE1_rep", i ,".csv"))
}
#esto no se esta haciendo bien.
dfe_matrix <- dfe_matrix_list[[1]]
ob_var_dfe <- dfe_matrix[200,1]
ob_inv_dfe <- l - ob_var_dfe
#print(ob_var_dfe)
dfe_matrix <- as.matrix(dfe_matrix[-200,])

#Output log file
results <- data.frame(j = numeric(), k = numeric(), likelihood = numeric())

#might not need in future but tracks integration
Table <- matrix(ncol=31,nrow=0) #Ncol is length of 2Ns values (27) + alpha and Gamma params = 29 but theres some wierd extra space so 30
#for each gamma dist. 
for (j in AlphaGrid)  {
  for (k in GammaGrid)  {
    total_prob <- 0
    prob_mass <- 0
    Row <- c(j,k) #for table construction
    a <- 1 #integrated value counter
    p_var_sites_gamma <- 0
    p_invar_sites_gamma <- 0
    matriz_gamma <- matrix(0, nrow=199, ncol=9)
    gamma_matrix_likelihood <- vector()
    for (i in valor_2Ns)  { #Para cada i, solamente se ejecuta una de las 3 condiciones. UNA.
      matriz_prob <- prob_matrix_list[[a]] #this contains non prob at last row so have to transform
      matriz_prob_true <- as.matrix(matriz_prob[-200,])
      ob_inv_sites <- matriz_prob[200,1]
      ob_var_sites <- l - ob_inv_sites 
      p_var_sites <- (ob_var_sites / l) 
      p_invar_sites <- 1 - p_var_sites
      if ( i == valor_2Ns[1])  { #No es el primer valor, sino un valor intermedio entre primer y segudo valor.
        prob_mass <- pgamma(valor_medio[1],j,1/k)
        p_var_sites_gamma <- p_var_sites_gamma + prob_mass * p_var_sites
        p_invar_sites_gamma <- p_invar_sites_gamma + prob_mass * p_invar_sites
        matriz_gamma <- matriz_gamma + matriz_prob_true * prob_mass
        Row <- c(Row, prob_mass) #me quedue tratando de incorporrar p_invar a la fila
      }else if (i==valor_2Ns[length(valor_2Ns)])  { #ultimo valor 
        #porque a-1? en teoria deberia ser el ultimo indice? 
        prob_mass <- (1 - pgamma(valor_medio[a-1],j,1/k)) #ok creo este es el problema.
        p_var_sites_gamma <- p_var_sites_gamma + prob_mass * p_var_sites
        p_invar_sites_gamma <- p_invar_sites_gamma + prob_mass * p_invar_sites
        matriz_gamma <- matriz_gamma + matriz_prob_true * prob_mass
        Row <- c(Row,prob_mass)
      }else  { #resto de valores 
        prob_mass <- (pgamma(valor_medio[a],j,1/k) - pgamma(valor_medio[a-1],j,1/k))
        p_var_sites_gamma <- p_var_sites_gamma + prob_mass * p_var_sites
        p_invar_sites_gamma <- p_invar_sites_gamma + prob_mass * p_invar_sites
        matriz_gamma <- matriz_gamma + matriz_prob_true * prob_mass
        Row <- c(Row,prob_mass)
      }
      a <- a + 1
    } #Aqui empieza una fila nueva, un calculo de verosimilitud. 
    Row <- c(Row, p_var_sites_gamma, p_invar_sites_gamma) 
    Table <- rbind(Table, Row)
    var_sites_likelihood <- ob_var_dfe * log(p_var_sites_gamma)
    invar_sites_likelihood <- ob_inv_dfe * log(p_invar_sites_gamma)
    sites_likelihood <- var_sites_likelihood + invar_sites_likelihood
    #This should go element wise. Creo que con el 0 se atora. 
    gamma_matrix_likelihood <- sum(dfe_matrix * log(matriz_gamma)) #not equally sized
    total_likelihood <- sum(gamma_matrix_likelihood) + sites_likelihood
    #format into two column text file (params,likelihood)
    results <- rbind(results, data.frame(j = j, k = k, likelihood = total_likelihood))
  }
}

best <- results[which.max(results$likelihood), ]

cat("\nBest likelihood:", best$likelihood, "\n")
cat("α (shape) =", best$j, "\n")
cat("k (scale) =", best$k, "\n")
cat("Max at row:", which.max(results$likelihood), "of", nrow(results), "\n")

# Optional: save all results
write.table(results, "dfe_grid_results.txt", row.names = FALSE, quote = FALSE, sep = "\t")