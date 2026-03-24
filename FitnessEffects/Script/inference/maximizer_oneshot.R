#grok-oneshot-maximizer
# === KEEP EVERYTHING UP TO HERE EXACTLY AS YOU HAD IT ===
rep <- as.integer(Sys.getenv("SLURM_ARRAY_TASK_ID"))

#Buscar normalizar mis valores de parametros y hacer pruebas. 
#I can either log parameter space of use this parscale thing to nornalize. 

# Grid definitions (kept for reference only)
# AlphaGrid <- 0.005*1:50
# GammaGrid <- 50*1:240

valor_2Ns <- c(0, 10^seq(-2.75, 3.50, by = 0.25))
#valor_medio <- (valor_2Ns[-length(valor_2Ns)] + valor_2Ns[-1]) / 2
valor_medio <- (10^seq(-2.875, 3.375, by = 0.25))
l <- 19379845

# Read in prob_matrices (exactly as you had)
prob_matrix_list <- list()
for (i in 1:27) {
  prob_matrix_list[[i]] <- read.csv(paste0("../../Data/trees/MatrixInputs/ConstantSize/set2/matrices/new_pseudocount/200x8_count_kimDFE_Sel", i, ".csv"))
}

# Read in DFE_matrices (exactly as you had)
dfe_matrix <- read.csv(paste0("../../Data/trees/MatrixInputs/ConstantSize/set1/rep_matrices/dfe/200x8_count_kimDFE1_rep", rep, ".csv"))

ob_inv_dfe <- dfe_matrix[200,1]
ob_var_dfe <- l - ob_inv_dfe
dfe_matrix <- as.matrix(dfe_matrix[-200,])
dfe_matrix <- dfe_matrix[,-ncol(dfe_matrix)]

# ====================== PRECOMPUTE FIXED PER-BIN STUFF (makes it faster) ======================
n_bins <- length(valor_2Ns)
p_var_vec  <- numeric(n_bins)
p_invar_vec <- numeric(n_bins)
mat_list   <- vector("list", n_bins)

for (bin in 1:n_bins) {
  mat <- prob_matrix_list[[bin]]
  mat_true <- as.matrix(mat[-200, -ncol(mat)])
  ob_inv   <- mat[200, 1]
  p_var_vec[bin]  <- (l - ob_inv) / l
  p_invar_vec[bin] <- 1 - p_var_vec[bin]
  mat_list[[bin]] <- mat_true
}

# ====================== NEGATIVE LOG-LIKELIHOOD FUNCTION (for L-BFGS-B) ======================
neg_log_likelihood <- function(params) {
  alpha <- params[1]   # shape
  scale <- params[2]   # your "k" (scale parameter of Gamma)
  
  # Guard against invalid parameters
  if (alpha <= 0 || scale <= 0) return(1e20)
  
  p_var_gamma   <- 0
  p_invar_gamma <- 0
  mat_gamma     <- matrix(0, nrow = 199, ncol = 8)
  
  for (bin in 1:n_bins) {
    if (bin == 1) {
      prob_mass <- pgamma(valor_medio[1], shape = alpha, scale = scale)
    } else if (bin == n_bins) {
      prob_mass <- 1 - pgamma(valor_medio[bin - 1], shape = alpha, scale = scale)
    } else {
      prob_mass <- pgamma(valor_medio[bin], shape = alpha, scale = scale) - 
                   pgamma(valor_medio[bin - 1], shape = alpha, scale = scale)
    }
    
    p_var_gamma   <- p_var_gamma   + prob_mass * p_var_vec[bin]
    p_invar_gamma <- p_invar_gamma + prob_mass * p_invar_vec[bin]
    mat_gamma     <- mat_gamma     + mat_list[[bin]] * prob_mass
  }
  
  total_col1 <- sum(mat_gamma[, 1])
  if (total_col1 <= 0 || p_var_gamma <= 0 || p_invar_gamma <= 0) {
    return(1e20)
  }
  
  mat_gamma <- mat_gamma / total_col1
  
  # Safeguard against log(0) → this fixes the weird "last parameter most probable" issue you saw
  #mat_gamma[mat_gamma < 1e-300] <- 1e-300
  
  # Likelihood components
  sites_ll  <- ob_var_dfe * log(p_var_gamma) + ob_inv_dfe * log(p_invar_gamma)
  matrix_ll <- sum(dfe_matrix * log(mat_gamma))
  total_ll  <- sites_ll + matrix_ll
  
  return(-total_ll)   # negative because optim minimizes
}

# ====================== RUN L-BFGS-B OPTIMIZER ======================
# Start near the literature values you mentioned (Kim/Boyko)
start_params <- c(0.10, 1500)
#start_params <- log(start_params)

# Reasonable bounds (wider than your old grid but still sensible)
lower_bounds <- c(0.001, 10)
#lower_bounds <- log(lower_bounds)
upper_bounds <- c(5,    50000)
#upper_bounds <- log(upper_bounds)

opt_result <- optim(par       = start_params,
                    fn        = neg_log_likelihood,
                    method    = "L-BFGS-B",
                    lower     = lower_bounds,
                    upper     = upper_bounds,
                    control   = list(maxit = 500,      # plenty of iterations
                                     factr = 1e7,      # relative tolerance
                                     pgtol = 1e-8,
                                     trace = 1,
                                     lmm = 10,
                                     parscale = c(0.15, 100), #funciona super bien. performed even better
                                     ndeps = c(1e-4, 1e-3)))       # set to 1 if you want progress

# Extract results
best_alpha <- opt_result$par[1]
best_scale <- opt_result$par[2]
best_lik   <- -opt_result$value

cat("\n=== OPTIMIZATION FINISHED ===\n")
cat("Best α (shape)   =", best_alpha, "\n")
cat("Best k (scale)   =", best_scale, "\n")
cat("Max log-likelihood =", best_lik, "\n")
cat("Convergence code =", opt_result$convergence, "(0 = success)\n")
cat("Message:", opt_result$message, "\n")

# Save result (similar format to your old grid file)
write.table(data.frame(alpha = best_alpha, 
                       scale = best_scale, 
                       loglik = best_lik,
                       convergence = opt_result$convergence,
                       message = opt_result$message),
            paste0("dfe_optim_results_", rep, ".txt"),
            row.names = FALSE, quote = FALSE, sep = "\t")


#Probar con varios inicios y ajustar las escalas. 
