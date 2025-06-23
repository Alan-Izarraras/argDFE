#Winning Demography.R
#Calculates and writes the Posterior demography to be used for dfe simulation.
### Modificado para hacer proceso paralelizable con sge_tas_id e imprimir resutados en directorio comun. 

# Get the SGE_TASK_ID from the environment
task_id <- as.numeric(Sys.getenv("SGE_TASK_ID"))
# Set a unique seed for each replicate to simulate different results
set.seed(task_id)

input_file <- sprintf("../Results/ABCAnalysisPopExpansion/Output/DemoRun/DemographyReport_StdpopsimChr1_Relate_%d.csv", task_id)
Resultados <- read.csv(input_file, sep = ",")
Resultados <- Resultados[,-1]
colnames(Resultados) <- c("PresentSize", "PastSize", "Time", "stat1", "RandomSeed", "stat4")

Valores_M <- Resultados$stat4

# Find the threshold value for the lowest 1%, top 0.1% (100vals if 10k runs)
corte <- quantile(Valores_M, probs = 0.01) #top 1%

# Filter the data for values below the threshold
top_porciento <- Valores_M[Valores_M < corte]

#Obtengo numero de fila
row_numbers <- which(Valores_M < corte)

#Top values
top_PresentSize <- Resultados$PresentSize[row_numbers]
top_PastSize <- Resultados$PastSize[row_numbers]
top_Time <- Resultados$Time[row_numbers]
top_M <- Resultados$stat4[row_numbers]

#I also want to graph this. 
#Falta hacerlas bonitas, ajustar ejes, y cosas así pero ya están. 
library(ggplot2)

# Define output directory (absolute path)
out_dir <- "/mnt/Timina/dortega/aizarraraz/PRF/Demografia/ABC_runs/Scripts/stdpopsim_chr1_demographies"  # Change this to your desired path
# Construct the filename with the task ID
output_file <- sprintf("MeanPosteriorDemographyStdpopsimChr1Relate_rep%d.txt", task_id)
output_path <- file.path(out_dir, output_file)

# Create a boxplot (N_presente)
options(scipen = 100)

# For PresentSize
png(file.path(out_dir, sprintf("PresentSize_stdpopsimchr1_Relate_%d.png", task_id)), width = 350, height = 600)
boxplot(Resultados$PresentSize, main = "Population size in present epoch", ylab = "", xaxt = "n", outline = FALSE)
dev.off()

# For PastSize
png(file.path(out_dir, sprintf("PastSize_stdpopsimchr1_Relate_%d.png", task_id)), width = 350, height = 600)
boxplot(Resultados$PastSize, main = "Population size in past epoch", ylab = "", xaxt = "n", outline = FALSE)
dev.off()

# For TimeChange
png(file.path(out_dir, sprintf("TimeChange_stdpopsimchr1_Relate_%d.png", task_id)), width = 350, height = 600)
boxplot(Resultados$Time, main = "Time of population size change", ylab = "", xaxt = "n", outline = FALSE)
dev.off()

# For M statistic
png(file.path(out_dir, sprintf("M_stdpopsimchr1_Relate_%d.png", task_id)), width =350, height = 600)
boxplot(Resultados$stat4, main = "M statistic", ylab = "", xaxt = "n", outline = FALSE)
dev.off()

#Density curves

# Present Size distributions
png(file.path(out_dir, sprintf("PresentSize_density_stdpopsimchr1_Relate_%d.png", task_id)),width = 541, height = 401)
options(scipen = 999)
density_est <- density(Resultados$PresentSize)
plot(density_est, main = "Present Size (stdpopsim_chr1_)", xlab = "N", ylab = "Density", ylim = c(0, max(density_est$y) * 1))
density_2 <- density(top_PresentSize)
lines(density_2, col = "darkcyan", lty = 2, lwd = 2)
legend("topright", legend = c("Prior Distribution", "Posterior Distribution"), col = c("black", "darkcyan"), lty = c(1, 2), lwd = 2, cex = 0.6, bty = "n")
dev.off()

# Past Size distributions
png(file.path(out_dir, sprintf("PastSize_density_stdpopsimchr1_Relate_%d.png", task_id)), width = 541, height = 401)
options(scipen = 999)
density_est <- density(Resultados$PastSize)
plot(density_est, main = "Past Size (stdpopsim_chr1_)", xlab = "N", ylab = "Density", ylim = c(0, max(density_est$y) * 1.5))
density_2 <- density(top_PastSize)
lines(density_2, col = "darkcyan", lty = 2, lwd = 2)
# Uncomment if you want the legend
# legend("topright", legend = c("Prior Distribution", "Posterior Distribution"), col = c("black", "darkcyan"), lty = c(1, 2), lwd = 2, cex = 0.5, bty = "n", inset = 0.01)
dev.off()

# Time distributions
png(file.path(out_dir, sprintf("Time_density_stdpopsimchr1_Relate_%d.png", task_id)), width = 541, height = 401)
options(scipen = 999)
density_est <- density(Resultados$Time)
plot(density_est, main = "Time change (stdpopsim_chr1_)", xlab = "generations", ylab = "Density", ylim = c(0, max(density_est$y) * 1.5))
density_2 <- density(top_Time)
lines(density_2, col = "darkcyan", lty = 2, lwd = 2)
dev.off()

# M value distribution
png(file.path(out_dir, sprintf("M_density_stdpopsimchr1_Relate_%d.png", task_id)), width = 541, height = 401)
density_est <- density(Resultados$stat4)
plot(density_est, main = "M value distribution", xlab = "Age", ylab = "Density", ylim = c(0, max(density_est$y) * 30))
density_2 <- density(top_M)
lines(density_2, col = "darkcyan", lty = 2, lwd = 2)
legend("topright", legend = c("Prior Distribution", "Posterior Distribution"), col = c("black", "darkcyan"), lty = c(1, 2), lwd = 2, cex = 0.8)
dev.off()

#Codigo para obtener promedio y media de la dsitribución posterior para cada valor.
top_posterior <- matrix(nrow=3, ncol=2)
colnames(top_posterior) <- c("mean", "median")
rownames(top_posterior) <- c("PresentSize", "PastSize", "Timing")

top_posterior[1,1] <- round(mean(top_PresentSize))
top_posterior[2,1] <- round(mean(top_PastSize))
top_posterior[3,1] <- round(mean(top_Time))

##Mean posterior demographic parameters
line1 <- paste(2 * top_posterior[2, 1], 16 * top_posterior[2, 1], sep = " ")
line2 <- paste(2 * top_posterior[1, 1], top_posterior[3, 1], sep = " ")
# Write the lines to the text file in my other diretory.

writeLines(c(line1, line2), output_path)

#Obtengo demografía para usar y correr el script que genera los paramfiles y escalas de la run de selección
