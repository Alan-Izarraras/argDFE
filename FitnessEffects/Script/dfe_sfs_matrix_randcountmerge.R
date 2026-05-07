# dfe_count_merge.R
# FIXED + THETA LABELS ADDED TO OUTPUT FILENAMES (no more overwriting!)
#   • Theta label is now part of every output file name
#   • Matrices  → ..._count_boykoDFE1_diezmil_rep01.csv
#   • SFS       → total_sfs_boykoDFE1_diezmil_rep01.txt
#   • All your custom paths preserved exactly
#   • Log file still works perfectly
#
task_id <- as.numeric(Sys.getenv("SLURM_ARRAY_TASK_ID"))
if (is.na(task_id)) task_id <- 1  # for local testing

#l <- 193798.45   # special value for trees with no segregating sites
l <- 193779.07 #0.01% overest

matrix_dim <- c("200x100", "20x100", "6x100",
                "200x40",  "20x40",  "6x40",
                "200x8",   "20x8",   "6x8")

# ====================== PATHS (exactly as you modified) ======================
file_in_matrix <- "../Data/trees/MatrixInputs/ConstantSize/set1/matrices/kim_target_size/under_0.01/"
file_out_matrix <- "../Data/trees/MatrixInputs/ConstantSize/set1/rep_matrices/kim_target_size/under_0.01/"

file_in_sfs   <- "../Data/trees/Sel_1/target_size/under_0.01/"   
file_out_sfs  <- "../Data/trees/MatrixInputs/ConstantSize/set1/rep_matrices/kim_target_size/under_0.01/"

# ====================== REPRODUCIBILITY LOG ======================
log_file <- paste0(file_out_matrix, "sampling_log_kim_targetsize_DFE1.txt")

# Create header the first time
if (!file.exists(log_file)) {
  header <- c(
    "=== DFE Count Merge + SFS Sampling Log ===",
    paste("Generated on:", format(Sys.time(), "%Y-%m-%d %H:%M:%S")),
    paste("SLURM task_id:", task_id),
    paste("Matrix dimensions used:", paste(matrix_dim, collapse = ", ")),
    "Each block shows the EXACT trees sampled (with replacement) for that replicate.",
    "You can copy the indices and re-run with set.seed() if you ever need to reproduce the exact same sampling.",
    "--------------------------------------------------\n"
  )
  writeLines(header, log_file)
}

# ====================== THETA OPTIONS ======================
theta_labels <- c("diezmil", "mil", "cien")
n_trees      <- c(100, 10, 1)

cat("=== Starting DFE count merge + SFS summation + logging ===\n")

for (j in seq_along(theta_labels)) {
  num <- n_trees[j]
  theta <- theta_labels[j]   # for clean filename use
  
  cat(sprintf("\n=== Theta = %s | Sampling %d trees per replicate ===\n", 
              theta, num))
  
  known_nrow <- NULL
  known_ncol <- NULL
  
  for (f in 1:50) {   # 50 replicates
    
    # Sample tree indices (1–200) with replacement + zero-padding
    rand_indices <- sample(1:200, size = num, replace = TRUE)
    rand_num_vector <- sprintf("%03d", rand_indices)   # "001", "002", ..., "200"
    
    rand_matrix_list <- vector("list", num)
    sfs_paths        <- character(num)
    
    for (k in seq_along(rand_num_vector)) {
      tree_str <- rand_num_vector[k]
      tree_idx <- rand_indices[k]                  # numeric 1–200
      
      # --------------------- MATRIX ---------------------
      mat_file <- paste0(file_in_matrix, 
                         matrix_dim[task_id], 
                         "_count_1", tree_str, "_sel1.csv")
      
      if (file.exists(mat_file)) {
        mat <- as.matrix(read.csv(mat_file, header = TRUE, check.names = FALSE))
        
        if (is.null(known_nrow)) {
          known_nrow <- nrow(mat)
          known_ncol <- ncol(mat)
        }
        rand_matrix_list[[k]] <- mat
        
      } else {
        if (is.null(known_nrow)) {
          stop(sprintf("ERROR: First matrix missing and dimensions unknown!\nFile: %s", mat_file))
        }
        empty_mat <- matrix(0, nrow = known_nrow, ncol = known_ncol)
        empty_mat[known_nrow, ] <- l
        rand_matrix_list[[k]] <- empty_mat
        cat(sprintf("  ⚠️  Missing matrix %s → empty matrix with %g\n", basename(mat_file), l))
      }
      
      # --------------------- SFS (same tree) ---------------------
      sfs_num  <- 1000 + tree_idx
      sfs_file <- paste0(file_in_sfs, "sfs_", sprintf("%04d", sfs_num), ".txt")
      
      if (file.exists(sfs_file)) {
        sfs_paths[k] <- sfs_file
      } else {
        cat(sprintf("  ⚠️  Missing SFS file %s → skipped in sum\n", basename(sfs_file)))
        sfs_paths[k] <- NA
      }
    }
    
    # ====================== LOG SAMPLED TREES (REPRODUCIBILITY) ======================
    log_lines <- c(
      paste0("=== Theta = ", theta, 
             " | Replicate = ", sprintf("%02d", f), 
             " | task_id = ", task_id, " ==="),
      paste0("Number of trees sampled (with replacement): ", num),
      paste0("Sampled indices (1-200): ", paste(rand_indices, collapse = ", ")),
      paste0("Corresponding SFS files: ", 
             paste(paste0("sfs_", sprintf("%04d", 1000 + rand_indices)), collapse = ", ")),
      paste0("Matrix pattern used: ", matrix_dim[task_id], "_count_1XXX_sel1.csv"),
      "--------------------------------------------------"
    )
    writeLines(log_lines, con = file(log_file, open = "a"))
    
    # ====================== 1. SUM COUNT MATRICES ======================
    result_matrix <- Reduce(`+`, rand_matrix_list)
    
    out_mat <- paste0(file_out_matrix,
                      matrix_dim[task_id],
                      "_count_kim_targetsize_DFE1_",
                      theta,
                      "_rep",
                      f, ".csv")
    
    write.csv(result_matrix, out_mat, row.names = FALSE)
    
    # ====================== 2. SUM SFS (exact same trees) ======================
    total_sfs <- integer(199)
    
    for (sfs_path in sfs_paths) {
      if (!is.na(sfs_path) && file.exists(sfs_path)) {
        sfs_lines <- readLines(sfs_path, warn = FALSE)
        sfs_counts <- as.integer(sfs_lines)
        len <- min(199, length(sfs_counts))
        total_sfs[1:len] <- total_sfs[1:len] + sfs_counts[1:len]
      }
    }
    
    out_sfs <- paste0(file_out_sfs,
                      "total_sfs_kim_targetsize_DFE1_",
                      theta,
                      "_rep",
                      f, ".txt")
    
    writeLines(as.character(total_sfs), out_sfs)
    
    cat(sprintf("  ✓ Replicate %02d | Matrix → %s | SFS → %s | 📝 Logged\n", 
                f, basename(out_mat), basename(out_sfs)))
  }
}

cat("\n=== ALL DONE! ===\n")
cat("Matrices  →", file_out_matrix, "\n")
cat("SFS files →", file_out_sfs, "\n")
cat("Sampling log →", log_file, "\n")
cat("50 replicates ×", length(theta_labels), "theta cases completed.\n")
cat("Theta label is now included in every filename → no more overwriting!\n")
cat("You can now reproduce any specific replicate exactly by copying the indices from the log.\n")
                       