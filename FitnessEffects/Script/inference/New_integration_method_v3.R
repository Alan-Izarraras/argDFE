# We'll collect ALL results here
results <- data.frame(
  j              = numeric(),
  k              = numeric(),
  likelihood     = numeric(),
  loglik_sites   = numeric(),
  loglik_dfe     = numeric(),
  p_var_gamma    = numeric(),  # For extra diagnostics
  stringsAsFactors = FALSE
)

# Optional: print p_var_sites for each bin to check if they vary
cat("\nChecking p_var_sites across the 27 bins:\n")
for (a in seq_along(valor_2Ns)) {
  matriz_prob <- prob_matrix_list[[a]]
  ob_inv_sites <- matriz_prob[200, 1]
  ob_var_sites <- l - ob_inv_sites
  p_var_sites <- ob_var_sites / l
  cat(sprintf("Bin %2d (2Ns=%.2f): p_var = %.6f\n", a, valor_2Ns[a], p_var_sites))
}

#Grid of gamma distribution parameter values (12)
AlphaGrid <- 0.005*1:50
GammaGrid <- 50*1:240

valor_2Ns <- c(0, 10^seq(-2.75, 3.50, by = 0.25))
valor_medio <- (valor_2Ns[-length(valor_2Ns)] + valor_2Ns[-1]) / 2
l <- 19379845

prob_matrix_list <- list()
for (i in 1:27)  {
  prob_matrix_list[[i]] <- read.csv(paste0("../../Data/trees/MatrixInputs/ConstantSize/set2/matrices/200x8_prob_matrix_Sel", i, ".csv"))
}

dfe_matrix_list <- list()
for (i in 1:50)  {
  dfe_matrix_list[[i]] <- read.csv(paste0("../../Data/trees/MatrixInputs/ConstantSize/set1/rep_matrices/diezmil_200x8_count_kimDFE1_rep", i ,".csv"))
}
#esto no se esta haciendo bien.
dfe_matrix <- dfe_matrix_list[[1]]
ob_var_dfe <- dfe_matrix[200,1]
ob_inv_dfe <- l - ob_var_dfe
dfe_matrix <- as.matrix(dfe_matrix[-200,])

for (j in AlphaGrid) {
  for (k in GammaGrid) {
    
    p_var_sites_gamma  <- 0
    p_invar_sites_gamma <- 0
    matriz_gamma <- matrix(0, nrow = 199, ncol = ncol(prob_matrix_list[[1]]) - 1)  # Adjust ncol based on data
    
    for (a in seq_along(valor_2Ns)) {
      i <- valor_2Ns[a]
      
      matriz_prob      <- prob_matrix_list[[a]]
      ob_inv_sites     <- matriz_prob[200, 1]
      ob_var_sites     <- l - ob_inv_sites
      p_var_sites      <- ob_var_sites / l
      p_invar_sites    <- 1 - p_var_sites
      matriz_prob_true <- as.matrix(matriz_prob[-200, ])
      
      if (a == 1) {
        prob_mass <- pgamma(valor_medio[1], shape = j, rate = 1/k)
      } else if (a == length(valor_2Ns)) {
        prob_mass <- 1 - pgamma(valor_medio[a-1], shape = j, rate = 1/k)
      } else {
        prob_mass <- pgamma(valor_medio[a],   shape = j, rate = 1/k) -
                     pgamma(valor_medio[a-1], shape = j, rate = 1/k)
      }
      
      p_var_sites_gamma  <- p_var_sites_gamma  + prob_mass * p_var_sites
      p_invar_sites_gamma <- p_invar_sites_gamma + prob_mass * p_invar_sites
      matriz_gamma <- matriz_gamma + matriz_prob_true * prob_mass
    }
    
    # Avoid log(0)
    p_var_gamma_safe   <- max(p_var_sites_gamma, 1e-320)
    p_invar_gamma_safe <- max(p_invar_sites_gamma, 1e-320)
    
    loglik_sites <- ob_var_dfe * log(p_var_gamma_safe) +
                    ob_inv_dfe * log(p_invar_gamma_safe)
    
    log_mat <- log(matriz_gamma + 1e-320)
    loglik_dfe <- sum(dfe_matrix * log_mat, na.rm = TRUE)
    
    total_likelihood <- loglik_sites + loglik_dfe
    
    # Store
    results <- rbind(results,
                     data.frame(j = j, k = k, likelihood = total_likelihood,
                                loglik_sites = loglik_sites, loglik_dfe = loglik_dfe,
                                p_var_gamma = p_var_sites_gamma))
  }
}

# ────────────────────────────────────────────────
# Find best
# ────────────────────────────────────────────────
best_idx <- which.max(results$likelihood)
best <- results[best_idx, ]

cat("\nBest result:\n")
cat("  likelihood   =", best$likelihood, "\n")
cat("  loglik_sites =", best$loglik_sites, "\n")
cat("  loglik_dfe   =", best$loglik_dfe, "\n")
cat("  α (j)        =", best$j, "\n")
cat("  scale (k)    =", best$k, "\n")
cat("  mean 2Ns ≈   ", best$j * best$k, "\n")
cat("  p_var_gamma  =", best$p_var_gamma, " (observed p_var ≈", ob_var_dfe / l, ")\n\n")

# To see "weight": compare ranges/variances across grid
range_sites <- range(results$loglik_sites)
range_dfe   <- range(results$loglik_dfe)
var_sites   <- var(results$loglik_sites)
var_dfe     <- var(results$loglik_dfe)

cat("Across the grid:\n")
cat("  Range loglik_sites: ", range_sites[1], " to ", range_sites[2], " (span =", diff(range_sites), ")\n")
cat("  Range loglik_dfe:   ", range_dfe[1], " to ", range_dfe[2], " (span =", diff(range_dfe), ")\n")
cat("  Var loglik_sites:   ", var_sites, "\n")
cat("  Var loglik_dfe:     ", var_dfe, "\n\n")

if (diff(range_sites) < 1e-5 || var_sites < 1e-10) {
  cat("WARNING: loglik_sites is nearly constant across grid! It has no weight in maximization.\n")
  cat("This happens if p_var_sites is identical across all 27 bins.\n")
} else {
  cat("loglik_sites varies, so it contributes to the fit.\n")
  cat("Compare spans/variances: the larger span/var means more 'weight' in driving the maximum.\n")
}

# ────────────────────────────────────────────────
# Write to file: BEST FIRST, then full table
# ────────────────────────────────────────────────
file_out <- "dfe_grid_results.txt"

# Write header + best line
cat("=== BEST FIT ===\n", file = file_out)
cat("likelihood\tloglik_sites\tloglik_dfe\tj\tk\tp_var_gamma\n", file = file_out, append = TRUE)
cat(sprintf("%.6f\t%.6f\t%.6f\t%.3f\t%d\t%.8f\n", 
            best$likelihood, best$loglik_sites, best$loglik_dfe, best$j, best$k, best$p_var_gamma), 
    file = file_out, append = TRUE)

cat("\n=== FULL GRID ===\n", file = file_out, append = TRUE)
cat("likelihood\tloglik_sites\tloglik_dfe\tj\tk\tp_var_gamma\n", file = file_out, append = TRUE)

write.table(results[, c("likelihood", "loglik_sites", "loglik_dfe", "j", "k", "p_var_gamma")], 
            file = file_out, append = TRUE, quote = FALSE, sep = "\t", row.names = FALSE, col.names = FALSE)

cat("Results written to:", file_out, "\n")
cat("Best fit (with components) is at the top of the file.\n")