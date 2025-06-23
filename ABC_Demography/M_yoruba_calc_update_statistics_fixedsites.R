demography_data <- read.csv("../Results/ABCAnalysisPopExpansion/Output/DemoRun/DemographyReport.txt", sep = "\t")
SGE_TASK_ID <- demography_data[, 5] #Just need to confirm it is on the 5th column.

wgs_matrix <- read.csv("../Results/ABCAnalysisPopExpansion/Output/trees/matrices/stdpopsim_chr1/Yoruba_wgs/matriz_prob_YorubaWGS_sinonimo.csv")

l <- 8058343 #Total number of synonimous sites in human genome. Prev 16634285
l <- round(l / 300) #changed 100 to 300 to make it faster

vector_M1 <- vector()
vector_M2 <- vector()
vector_M3 <- vector()
vector_M4 <- vector()

a <- 1

for (j in SGE_TASK_ID)  {

  #Arreglar las matrices
  matriz_conteo <- read.csv(paste("../Results/ABCAnalysisPopExpansion/Output/trees/matrices/matriz_conteo_", j, ".csv", sep=""))
  matriz_conteo[21,] <- l - matriz_conteo[20,8]
	
  #generar matriz_prob_ nuevas
  matriz_prob <- matriz_conteo / l

  ###Sumary 1. Classic statistic
  Matriz_M <- wgs_matrix - matriz_prob
  Valor_M1 <- sum(abs(Matriz_M))

  ###Sumary 2. Only proportion of segregating to not segregating mutations matter
  #Valor_M2 <- (matriz_prob_invariables_rangos[20,8] - wgs_matrix[20,8])  / (wgs_matrix[20,8])
  Valor_M2 <- abs((matriz_prob[20,8] - wgs_matrix[20,8])  / max(wgs_matrix[20,8], matriz_prob[20,8]))
  #This update should yield non negative between 0 and 1  ()

  ###Sumary 3. Only segregating mutations matter
  matriz_M3 <- matriz_prob[-21,] - wgs_matrix[-21,]
  Valor_M3 <- sum(abs(matriz_M3))

  ###Summary 4. Composite of 2 & 3.
  Valor_M4 <- (Valor_M2 + Valor_M3) / 2

  ###save Valor_M to a vector
  vector_M1[a] <- Valor_M1
  vector_M2[a] <- Valor_M2
  vector_M3[a] <- Valor_M3
  vector_M4[a] <- Valor_M4

  a <- a +1

  #Escribir matriz_prob nueva
  write.csv(matriz_prob, paste("../Results/ABCAnalysisPopExpansion/Output/trees/matrices/matriz_prob2_", j, ".csv", sep=""))
  write.csv(matriz_conteo, paste("../Results/ABCAnalysisPopExpansion/Output/trees/matrices/matriz_conteo2_", j, ".csv", sep=""))
}

new_columns <- data.frame(vector_M1, vector_M2, vector_M3, vector_M4)
demography_data <- cbind(demography_data, new_columns)

##Y aqui cambiar el nombre.
write.csv(demography_data, "../Results/ABCAnalysisPopExpansion/Output/DemoRun/DemographyReport_MultiStatistics_Synsitescorrection.csv")








