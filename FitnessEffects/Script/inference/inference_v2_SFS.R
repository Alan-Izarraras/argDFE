# More efficient version of the code.
# Key optimizations:
# - Preload all probability matrices once outside all loops (they don't depend on z).
# - For each z (repetition), preload all 27 count matrices for that z.
# - Vectorize the likelihood calculation instead of nested for loops over rows/columns.
# - Use faster file reading with data.table::fread() if data.table is installed; otherwise fallback to read.csv.
# - Remove unnecessary print statements for speed.
# - Handle potential log(0) cases properly in vectorized sum.
# Assumes data.table is available; if not, replace fread with read.csv.

library(data.table)  # For faster fread; install if needed.

set1_input <- "../../Data/trees/MatrixInputs/ConstantSize/set1/rep_matrices/"
set2_input <- "../../Data/trees/MatrixInputs/ConstantSize/set2/matrices/"

sel_values <- 27
task_id <- Sys.getenv("SLURM_ARRAY_TASK_ID")
task_id <- as.numeric(task_id)  # taskid controls matrix dimension

#passes a theta ID to switch between theta values.
theta_idx <- as.integer(Sys.getenv("THETA_INDEX"))
if (is.na(theta_idx) || theta_idx < 1 || theta_idx > 3) {
  stop("THETA_INDEX must be 1, 2, or 3")
}

theta <- c("diezmil", "mil", "cien")
dividers <- c(1, 10, 100)
selected_theta <- theta[theta_idx]
divider <- dividers[theta_idx]

matrix_selection <- c("200x100", "20x100", "6x100", "200x40", "20x40", "6x40", "200x8", "20x8", "6x8")
prob_matrix_base <- paste(set2_input, matrix_selection[task_id], "_prob_matrix_Sel", sep="")
count_matrix_base <- paste(set1_input, selected_theta,"_", matrix_selection[task_id], "_count_sel", sep="")

total_sites <- 19379845

# Preload all 27 probability matrices (independent of z)
probs <- list()
prob_fixed_probs <- numeric(sel_values)  # Precompute set2_prob_fixed_sites for each a
for (a in 1:sel_values) {
  prob_file <- paste(prob_matrix_base, a, ".csv", sep="")
  prob_matrix <- fread(prob_file, data.table = FALSE)  # Or read.csv if no data.table
  prob_matrix <- prob_matrix[, -ncol(prob_matrix)]  # Erase last column
  set2_fixed_sites <- prob_matrix[nrow(prob_matrix), 1] / divider #depends on theta value
  prob_matrix <- prob_matrix[, 1, drop = FALSE] #not sure if it goes here
  set2_mutated_sites <- total_sites - set2_fixed_sites
  set2_prob_fixed_sites <- set2_fixed_sites / total_sites
  prob_fixed_probs[a] <- set2_prob_fixed_sites
  prob_matrix <- prob_matrix[-nrow(prob_matrix), ]  # Erase last row
  probs[[a]] <- prob_matrix
}

# Now process each repetition z
matrix_list <- list()
for (z in 1:50) {
  # Preload all 27 count matrices for this z
  counts <- list()
  count_fixed_sites <- numeric(sel_values)  # Precompute set1_fixed_sites for each b
  for (b in 1:sel_values) {
    count_file <- paste(count_matrix_base, b, "_rep", z, ".csv", sep="")
    count_matrix <- fread(count_file, data.table = FALSE)  # Or read.csv
    count_matrix <- count_matrix[, -ncol(count_matrix)]
    set1_fixed_sites <- count_matrix[nrow(count_matrix), 1]
    count_matrix <- count_matrix[, 1, drop = FALSE] #i think it goes here
    count_fixed_sites[b] <- set1_fixed_sites
    count_matrix <- count_matrix[-nrow(count_matrix), ]
    counts[[b]] <- count_matrix
  }
  
  # Now compute inference_matrix for this z
  inference_matrix <- matrix(NA, nrow = sel_values, ncol = sel_values)
  for (a in 1:sel_values) {
    prob_matrix <- probs[[a]]
    set2_prob_fixed <- prob_fixed_probs[a]
    
    for (b in 1:sel_values) {
      count_matrix <- counts[[b]]
      set1_fixed <- count_fixed_sites[b]
      
      # Vectorized likelihood calculation
      non_zero_prob <- prob_matrix > 0
      if (any(count_matrix[!non_zero_prob] > 0)) {
        sum_likelihoods <- -Inf  # Impossible if count > 0 where prob == 0
      } else {
        valid <- count_matrix > 0  # Only sum where count > 0 (implies prob > 0 from check)
        sum_likelihoods <- sum(count_matrix[valid] * log(prob_matrix[valid]))
      }
      
      # Variation likelihood
      fixed_sites_likelihood <- set1_fixed * log(set2_prob_fixed)
      mutated_sites_likelihood <- (total_sites - set1_fixed) * log(1 - set2_prob_fixed)
      variation_likelihood <- fixed_sites_likelihood + mutated_sites_likelihood
      
      # Combined
      loglikelihood_estimate <- sum_likelihoods + variation_likelihood
      inference_matrix[a, b] <- loglikelihood_estimate
    }
  }
  
  rownames(inference_matrix) <- 1:sel_values
  colnames(inference_matrix) <- 1:sel_values
  matrix_list <- append(matrix_list, list(inference_matrix))
}

# Compute result_mat
result_mat <- do.call(rbind, lapply(matrix_list, function(m) {
  sapply(1:ncol(m), function(j) which.max(m[, j]))
}))

write.csv(result_mat, paste("ConstantSize/discrete_inference_", matrix_selection[task_id], "_", selected_theta, "_SFS.csv", sep=""))