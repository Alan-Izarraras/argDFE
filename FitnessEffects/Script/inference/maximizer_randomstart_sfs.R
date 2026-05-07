#grok-oneshot-maximizer
# === KEEP EVERYTHING UP TO HERE EXACTLY AS YOU HAD IT ===
rep <- as.integer(Sys.getenv("SLURM_ARRAY_TASK_ID"))

valor_2Ns <- c(0, 10^seq(-2.75, 3.50, by = 0.25))
#valor_medio <- (valor_2Ns[-length(valor_2Ns)] + valor_2Ns[-1]) / 2
valor_medio <- (10^seq(-2.875, 3.375, by = 0.25))
l <- 19379845
l <- l / 10

# Read in prob_matrices (exactly as you had)
prob_matrix_list <- list()
for (i in 1:27) {
  prob_matrix_list[[i]] <- read.csv(paste0("../../Data/trees/MatrixInputs/ConstantSize/set2/matrices/new_pseudocount/mil/200x8_count_mil_kimDFE_Sel", i, ".csv"))
}

# Read in DFE_matrices (exactly as you had)
dfe_matrix <- read.csv(paste0("../../Data/trees/MatrixInputs/ConstantSize/set1/rep_matrices/boyko_lognormal/200x8_count__boykolognormDFE1_cien_rep", rep, ".csv"))

ob_inv_dfe <- dfe_matrix[200,1]
ob_var_dfe <- l - ob_inv_dfe
dfe_matrix <- as.matrix(dfe_matrix[-200,])
dfe_matrix <- dfe_matrix[,-ncol(dfe_matrix)]
col <- ncol(dfe_matrix)

dfe_matrix <- as.matrix(dfe_matrix[,1]) #Case for 1 time k=1

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
  mat_list[[bin]] <- mat_true[,1]
}

# ====================== NEGATIVE LOG-LIKELIHOOD FUNCTION (for L-BFGS-B) ======================
neg_log_likelihood <- function(params) {
  alpha <- params[1]   # shape
  scale <- params[2]   # your "k" (scale parameter of Gamma)
  
  # Guard against invalid parameters
  if (alpha <= 0 || scale <= 0) return(1e20)
  
  p_var_gamma   <- 0
  p_invar_gamma <- 0
  mat_gamma     <- matrix(0, nrow = 199, ncol = 1) # 1
  
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

# ====================== RUN L-BFGS-B OPTIMIZER WITH MULTI-START ======================

# Bounds
lower_bounds <- c(0.001, 10)
upper_bounds <- c(5,    50000)

# Number of random starts (3–6 is usually a good balance between speed and robustness)
n_starts <- 100

# Storage for best result
best_loglik <- -Inf
best_params <- NULL
best_result <- NULL

cat("Running", n_starts, "random starts for optimization...\n")

for (i in 1:n_starts) {
  
  # Generate random starting point inside the bounds
  # Use log-uniform for the scale parameter (much better than uniform!)
  start_alpha <- runif(1, min = lower_bounds[1], max = upper_bounds[1])
  start_scale <- 10^runif(1, log10(lower_bounds[2]), log10(upper_bounds[2]))
  
  start_params <- c(start_alpha, start_scale)
  
  cat(sprintf("Start %d/%d:  α = %.4f   scale = %.0f\n", 
              i, n_starts, start_alpha, start_scale))
  
  # Run optimization
  opt_result <- optim(
    par     = start_params,
    fn      = neg_log_likelihood,
    method  = "L-BFGS-B",
    lower   = lower_bounds,
    upper   = upper_bounds,
    control = list(
      trace   = 0,          # set to 1 if you want to see details for one run
      maxit   = 1500,
      factr   = 1e11,
      pgtol   = 1e-11,
      lmm     = 15,
      parscale = c(0.2, 2000),
      ndeps   = c(1e-4, 1e-3)
    )
  )
  
  current_loglik <- -opt_result$value
  
  # Keep track of the best one
  if (current_loglik > best_loglik) {
    best_loglik <- current_loglik
    best_params <- opt_result$par
    best_result <- opt_result
    cat(sprintf("   → New best! logL = %.3f\n", best_loglik))
  }
}

# ====================== FINAL RESULT ======================
cat("\n=== OPTIMIZATION FINISHED ===\n")
cat("Best α (shape)   =", best_params[1], "\n")
cat("Best scale (k)   =", best_params[2], "\n")
cat("Max log-likelihood =", best_loglik, "\n")
cat("Convergence code =", best_result$convergence, "\n")

# Save result
write.table(data.frame(
  rep         = rep,
  alpha       = best_params[1],
  scale       = best_params[2],
  loglik      = best_loglik,
  convergence = best_result$convergence,
  n_starts    = n_starts
), 
file = sprintf("boykolognorm_k1_tmil_result_rep%02d.txt", rep),
row.names = FALSE, quote = FALSE, sep = "\t")