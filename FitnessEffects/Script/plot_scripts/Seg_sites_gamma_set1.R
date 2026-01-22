#Same thing but for 50 replicates of se1 matrices.
sites_list <- vector("list", length = 50)

for (r in 1:50)  {
  sites_vec <- numeric(27)   # pre-allocate vector for this repetition
  for (a in 1:27)  {
    set1_file <- paste0("../../Data/trees/MatrixInputs/ConstantSize/set1/rep_matrices/diezmil_6x8_count_sel", a, "_rep",r, ".csv")
    set1_mat <- read.csv(set1_file)
    sites_vec[a] <- set1_mat[6, 9]
  }
  sites_list[[r]] <- sites_vec   # correct way to assign to list
}

print(sites_list[[1]])

pdf("segregating_sites_summary_50reps.pdf", width = 9, height = 6)

sites_mat <- do.call(rbind, sites_list)          # 50 rows × 27 columns

# Basic version
boxplot(sites_mat,
        names       = 1:27,
        xlab        = "γ value",
        ylab        = "Number of segregating sites",
        main        = "Distribution across 50 repetitions per γ value",
        las         = 1,                # horizontal x labels
        cex.axis    = 0.9,
        cex.lab     = 1.1,
        outline     = TRUE,             # show outliers as points
        col         = "lightsteelblue", # optional: fill color
        border      = "steelblue")

sites_mat_first12 <- sites_mat[, 1:12, drop = FALSE]

boxplot(sites_mat_first12,
        names       = 1:12,                          # only 1 to 12
        xlab        = "Position / γ index (first 12)",
        ylab        = "Number of segregating sites",
        main        = "Distribution across 50 repetitions (positions 1–12)",
        las         = 1,
        cex.axis    = 1.0,                           # can be larger now (less crowding)
        cex.lab     = 1.2,
        cex.main    = 1.3,
        outline     = TRUE,
        col         = "aliceblue",
        border      = "steelblue",
        whisklty    = 1,                             # solid whisker lines
        staplewex   = 0.5)                           # narrower staple

dev.off()