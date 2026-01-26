#Plot number of segregating sites per 2Ns value. 
#For set2 matrices. 

#Read in set2 matrices, extract first value. 
l <- 19379845
sites_vector_list <- list()
sites_vector <- vector()
for (a in 1:27)  {
  set2_matrix <- read.csv(paste0("../../Data/trees/MatrixInputs/ConstantSize/set2/matrices/6x8_prob_matrix_Sel", a, ".csv"))
  sites <- set2_matrix[7,1]
  sites_vector[a] <- l - sites
}

gamma <- c(seq(1:27))

pdf("segregating_sites_per_gamma.pdf", width = 8, height = 6) 

tick_indices <- c(1, 5, 9, 13, 17, 21, 25)
# Get the corresponding gamma values to use as tick positions and labels
tick_positions <- gamma[tick_indices]
tick_labels    <- c("0", "0.01", "0.1", "1", "10", "100", "1000")

plot(gamma, sites_vector,
     type   = "p",                    # both points and lines
     pch    = 19,
     col    = "steelblue",
     lwd    = 1.5,
     xlab   = expression(gamma ~ "values"),
     ylab   = "Number of segregating sites",
     main   = "Segregating sites",
     xaxt   = "n",                    # hide automatic x-axis
     ylim   = range(sites_vector) * c(0.95, 1.05))   # ← closing ) here

# Now the custom axis (separate call)
axis(side = 1,
     at    = tick_positions,
     labels = tick_labels,
     las   = 1,
     cex.axis = 0.9)

#legend("topright", legend = c("Old", "New"),
       #col = c("steelblue", "tomato"), pch = c(19, 17),
       #lwd = 1.5, bty = "n") 
dev.off() 