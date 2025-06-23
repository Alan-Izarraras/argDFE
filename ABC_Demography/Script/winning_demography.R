#Winning Demography.R 
#Calculates and writes the Posterior demography to be used for dfe simulation. 

Resultados <- read.csv("../Results/ABCAnalysisPopExpansion/Output/DemoRun/DemographyReport_updateWGS_2.csv", sep="\t")
#Resultados <- Resultados[,-1]
colnames(Resultados) <- c("PresentSize", "PastSize", "Time", "M_value", "RandomSeed")

if (any(is.na(Resultados))) {
    # Remove the last row of the matrix
    rows_with_na <- apply(Resultados, 1, function(row) any(is.na(row)))
    Resultados <- Resultados[!rows_with_na, ]
    print("Results contained NA value and is now clean")
} else {
    print("Results does not contain any NA values.")
}

Valores_M <- Resultados$M_value

# Find the threshold value for the lowest 1%, top 0.1% (100vals if 10k runs)
corte <- quantile(Valores_M, probs = 0.001)

# Filter the data for values below the threshold
top_porciento <- Valores_M[Valores_M < corte]

#Obtengo numero de fila
row_numbers <- which(Valores_M < corte)

#Top values
top_PresentSize <- Resultados$PresentSize[row_numbers]
top_PastSize <- Resultados$PastSize[row_numbers]
top_Time <- Resultados$Time[row_numbers]
top_M <- Resultados$M_value[row_numbers]

#Codigo para obtener promedio y media de la dsitribución posterior para cada valor. 
top_posterior <- matrix(nrow=3, ncol=2)
colnames(top_posterior) <- c("mean", "median")
rownames(top_posterior) <- c("PresentSize", "PastSize", "Timing")

top_posterior[1,1] <- round(mean(top_PresentSize))
top_posterior[2,1] <- round(mean(top_PastSize))
top_posterior[3,1] <- round(mean(top_Time))

top_posterior[1,2] <- median(top_PresentSize)
top_posterior[2,2] <- median(top_PastSize)
top_posterior[3,2] <- median(top_Time)

##Mean posterior demographic parameters
line1 <- paste(2 * top_posterior[2, 1], 16 * top_posterior[2, 1], sep = " ")
line2 <- paste(2 * top_posterior[1, 1], top_posterior[3, 1], sep = " ")
# Write the lines to the text file in my other diretory. 
writeLines(c(line1, line2), "/mnt/Timina/dortega/aizarraraz/PRF/Demografia/estimation/script/MeanPosteriorDemography.txt")

#Obtengo demografía para usar y correr el script que genera los paramfiles y escalas de la run de selección
