#### These are the target DFEs
#Kim (alfa = 0.186, Beta= 706)
#Boyko (alfa = 0.184, Beta = 3238)
 
#Grid of gamma distribution parameter values (12)
AlphaGrid <- 0.005*1:50
GammaGrid <- 50*1:240

AlphaGrid <- 0.005*1:3
GammaGrid <- 50*1:3

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

results <- data.frame(j = numeric(), k = numeric(), likelihood = numeric(), stringsAsFactors = FALSE)

for (j in AlphaGrid) {
  for (k in GammaGrid) {
    
    # Reset accumulators for this parameter pair
    p_var_sites_gamma  <- 0
    p_invar_sites_gamma <- 0
    matriz_gamma <- matrix(0, nrow = 199, ncol = ncol(prob_matrix_list[[1]]))  # -1 because last row is invariant count
    
    for (a in seq_along(valor_2Ns)) {
      i <- valor_2Ns[a]
      
      # Get the corresponding probability matrix
      matriz_prob <- prob_matrix_list[[a]]
      ob_inv_sites <- matriz_prob[200, 1]
      ob_var_sites <- l - ob_inv_sites
      
      p_var_sites  <- ob_var_sites / l
      p_invar_sites <- 1 - p_var_sites
      
      matriz_prob_true <- as.matrix(matriz_prob[-200, ])           # should be 199 × 8 (or whatever)
      
      # Probability mass for this 2Ns bin
      if (a == 1) {
        # First bin: 0 to first midpoint
        prob_mass <- pgamma(valor_medio[1], shape = j, rate = 1/k)
      } else if (a == length(valor_2Ns)) {
        # Last bin: last midpoint → ∞
        prob_mass <- 1 - pgamma(valor_medio[a-1], shape = j, rate = 1/k)
      } else {
        # Middle bins
        prob_mass <- pgamma(valor_medio[a],   shape = j, rate = 1/k) -
                     pgamma(valor_medio[a-1], shape = j, rate = 1/k)
      }
      
      # Accumulate
      p_var_sites_gamma  <- p_var_sites_gamma  + prob_mass * p_var_sites
      p_invar_sites_gamma <- p_invar_sites_gamma + prob_mass * p_invar_sites
      matriz_gamma <- matriz_gamma + matriz_prob_true * prob_mass
    }
    
    # Now compute log-likelihood
  
    # 1. Invariant vs variable sites (binomial / bernoulli part)
    loglik_sites <- ob_var_dfe * log(p_var_sites_gamma) +  ob_inv_dfe * log(p_invar_sites_gamma)
    print(loglik_sites)
    # 2. DFE part — element-wise
    # Make sure matriz_gamma has NO zeros where dfe_matrix > 0
    log_mat <- log(matriz_gamma)
    loglik_dfe <- sum(dfe_matrix * log_mat)
    print(loglike_dfe)
    total_likelihood <- loglik_sites + loglik_dfe
    print(total_likelihood)
    
    # Store result
    results <- rbind(results, data.frame(j = j, k = k, likelihood = total_likelihood))
    
    # Optional: progress
    cat(sprintf("j=%.3f  k=%d   logL = %.2f\n", j, k, total_likelihood))
  }
}

# Find best fit
best_idx <- which.max(results$likelihood)
best <- results[best_idx, ]

cat("\nBest result:\n")
cat("  likelihood =", best$likelihood, "\n")
cat("  α (j)      =", best$j, "\n")
cat("  scale (k)  =", best$k, "\n")
cat("  mean 2Ns ≈ ", best$j * best$k, "\n\n")

# Optional: save all results
ile_out <- "dfe_grid_results.txt"

# Write header + best line
cat("=== BEST FIT ===\n", file = file_out)
cat("likelihood\tj\tk\n", file = file_out, append = TRUE)
cat(sprintf("%.6f\t%.3f\t%d\n", best$likelihood, best$j, best$k), 
    file = file_out, append = TRUE)

cat("\n=== FULL GRID ===\n", file = file_out, append = TRUE)
cat("likelihood\tj\tk\n", file = file_out, append = TRUE)

# Write the full sorted or unsorted grid
write.table(results, file = file_out, 
            append = TRUE, 
            quote = FALSE, 
            sep = "\t", 
            row.names = FALSE, 
            col.names = FALSE)

cat("Results written to:", file_out, "\n")
cat("Best fit is at the top of the file.\n")