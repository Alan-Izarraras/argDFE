Table <- read.csv("Table_of_probabilities.csv", sep=",")
Table <- Table[,-1]

loglikelihoods <- vector()
likelihood_estimates <- vector() #Col 1 = alfa, Col2= gamma, col3= numero

param_table <- Table[, c(1, 2)]
#Observed (empirical) count matrices
#/mnt/data/dortega/aizarraraz/argDFE/FitnessEffects/Data/trees/Matrices/empirical
DFE_conteo <- read.csv("../../Data/trees/Matrices/empirical/matriz_conteo_YorubaWGS_no_sinonimo.csv")
DFE_conteo <- DFE_conteo[,-1]

for (a in 1:10000)  {
  matriz_gamma <- read.csv(paste("distribution_dump/matriz_gamma_", a, ".csv", sep=""))
  matriz_gamma <- matriz_gamma[,-1]
  i<-1
  for (r in 1:nrow(DFE_conteo))  {
    for (c in 1:ncol(DFE_conteo))  {
      if (DFE_conteo[r, c] != 0)  {
        loglikelihoods[i] <- DFE_conteo[r,c] * log(matriz_gamma[r, c]) #Necesito que este archivo no cambie
        i <- i +1
      }
    }
  }

  likelihood_estimates[a] <- sum(loglikelihoods)

}

param_table <- cbind(param_table, likelihood_estimates)
write.csv(param_table, paste("LikelihoodEstimates.csv", sep=""))
