
Table <- read.csv("Table_of_probabilities.csv", sep=",")
Table <- Table[,-1]

Lista_matrices <- list()
Vector_Ns <- seq(1,26) #Aqui en mi caso nombro los valores del 1 al 26, entonces es una lista del 1 al 26.

#Simulated (training) probability matrices
#/mnt/data/dortega/aizarraraz/argDFE/FitnessEffects/Data/trees/Matrices/simulated
input_matrix <- "../Data/trees/Matrices/simulated/"

for (v in 1:length(Vector_Ns))  {
  uno <- read.csv(paste(input_matrix, "matriz_prob_", v, ".csv", sep="")) #nombre/path de cada matriz de prob.
  Lista_matrices[[v]] <- uno
}

Lista_Suma <- list() #En esta lista obtengo matrices de probabilidad weighteadas por la gamma correspondiente a su intervalo específico.

for (r in 1:nrow(Table))  {
  i <- 3 #3 porque ahi inician los valores en la tabla de prob
  for (v in 1:length(Vector_Ns))  { #v lo uso para iterar las matrices de la lista de matrices
    Lista_Suma[[v]] <- Lista_matrices[[v]]*Table[r,i] #Cada matriz de la lista de matrices la multiplico por un intervalo de probabilidad. Es la asignación del peso correspondiente a las gammas
    i <- i+1 #El vector cambia junto con i que es la columna, el intervalo. Las matrices son de valores 2Ns específicos que van a estar weighteados por el intervalo específico
  }
  matriz_gamma_suma <- Reduce(`+`, Lista_Suma) #Gracias chatgpt
  #Recuerdo que inteté formas más eficientes de hacer esto de arriba y no lo logré entonces lo dejé así.
  write.csv(matriz_gamma_suma, paste("distribution_dump/matriz_gamma_", r, ".csv", sep="")) #Genero una matriz de probabilidad por dist gamma
}
