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

#Sites from first experiment.
print("Sites from the old experiment")
segregantes <- c(58898, 58336, 58214, 58202, 58309, 58123, 57848, 57851,57690, 56597, 55468, 53430, 48985, 43578, 36643, 30328, 24116, 19002, 14357, 10120,  6950,4279,2595,1508,759,506,314)
print(segregantes)
print("Sites from the recent experiment")
print(sites_vector)

gamma <- c(seq(1:27))

pdf("segregating_sites_per_gamma.pdf", width = 8, height = 6) 

plot(gamma, sites_vector,
     type = "b",               # both points and lines
     pch = 19, col = "steelblue", lwd = 1.5,
     xlab = "Index / γ level", ylab = "Number of segregating sites",
     main = "Segregating Sites: Old vs New",
     xaxt = "n",               # hide default x-axis if you want custom labels
     ylim = range(c(sites_old, sites_new)) * c(0.95, 1.05))  # nice y-range

#points(gamma, segregantes, type = "b", pch = 17, col = "tomato", lwd = 1.5)

#legend("topright", legend = c("Old", "New"),
       #col = c("steelblue", "tomato"), pch = c(19, 17),
       #lwd = 1.5, bty = "n") 
dev.off() 