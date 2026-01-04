###New script for constructing matrices of different dimensions for new likelihood calc
#this produces set2 matrices with different dimensions. 
#set2 matrices require a pseudocount and probability matrices. 

library(ape)

# Get SLURM_ARRAY_TASK_ID from the environment and uses for selection specification
sel <- as.integer(Sys.getenv("SLURM_ARRAY_TASK_ID"))

print(sel)

PresentSize <- 10000
PastSize <- 10000
l <- 19379845
step <- 1 #should be 1 here...? 

PresentSize <- as.numeric(PresentSize)
PastSize <- as.numeric(PastSize)
l <- as.numeric(l)
step <- as.numeric(step)

#Path where input files can be found (singletons and trees)
file_path <- "../Data/trees/MatrixInputs/new_likelihood_experiment/second_run/set2/"

lista_arboles <- read.tree(paste(file_path, "trees_Sel", sel, ".txt", sep=""))
lista_intervalos <- list()
cuenta <- read.table(paste(file_path, "trees_Sel", sel, ".txt", sep=""))

#Lists number of intervals per each tree (branch number)
if (nrow(cuenta) == 1)  {
  ci <- coalescent.intervals(lista_arboles)
  lista_intervalos[1] <- c(ci[2])
} else  {
  for (i in 1:length(lista_arboles))  {
    ci <- coalescent.intervals(lista_arboles[[i]])
    lista_intervalos[i] <- c(ci[2])
  }
}

num.obs <- sapply(lista_intervalos, length)
seq.max <- seq_len(max(num.obs))
matriz_intervalos <- t(sapply(lista_intervalos, "[", i = seq.max))

singletones <- read.table(paste(file_path, "singletons_Sel", sel, ".txt", sep=""), sep="", fill = TRUE)
colnames(singletones) <- c(1,2)
matriz_temp <- matrix(nrow=nrow(singletones), ncol=ncol(matriz_intervalos)-2)
matriz_temp <- cbind(singletones, matriz_temp)
colnames(matriz_temp) <- seq(1:ncol(matriz_intervalos))
colnames(matriz_intervalos) <- seq(1:ncol(matriz_intervalos))
matriz_intervalos <- rbind(matriz_temp, matriz_intervalos)

#ajuste_poblacional <- 4*PresentSize
#matriz_intervalos <- matriz_intervalos * (4*PresentSize)
tiempo_acumulado <- matrix(nrow=nrow(matriz_intervalos), ncol=ncol(matriz_intervalos))

#Transform time values from interval value to "accumulated" time. Keeps track of summed time past per tree per interval
for (r in 1:nrow(matriz_intervalos))  {
  i<-1
  suma <- matriz_intervalos[r,i]
  tiempo_acumulado[r,i] <- suma
  for (c in 1:ncol(matriz_intervalos))  {
    suma <- suma + matriz_intervalos[r, i+1]
    tiempo_acumulado[r, i+1] <- suma
    i <- i+1
    if (tiempo_acumulado[r,1] - tiempo_acumulado[r,2] == 0)  {
      tiempo_acumulado[r,2] = 0
    }
    if (i==ncol(matriz_intervalos))  { #Aqui el cambio 99 por ncol(matriz_intervalos)
      break
    }
  }
}

matriz_intervalos[is.na(matriz_intervalos)] <- 0
tiempo_acumulado[is.na(tiempo_acumulado)] <- 0
max_linajes <- ncol(matriz_intervalos) #Aqui otro cambio ncol(matriz_intervalos)
num_linajes <- 1

for (i in 1:nrow(tiempo_acumulado))  {
  num_linajes[i] <- match(0, tiempo_acumulado[i,])
  if (0 %in% num_linajes[i])  {
    num_linajes[i] <- max_linajes

  }
}
num_linajes[is.na(num_linajes)] <- max_linajes

#Calculates time distribution based on a desired number of discrete times. 
generate_geometric_sequence <- function(min_value, max_value, length) {
  # Ensure valid inputs
  if (min_value <= 0 || max_value <= min_value || length < 1) {
    return("Invalid input: min_value must be positive, max_value > min_value, length >= 1")
  }

  # Calculate the common ratio
  if (length == 1) {
    return(min_value)
  }

  # Common ratio: r^(length-2) = max_value / min_value to ensure last term (r^(length-1)) > max_value
  ratio <- (max_value / min_value) ^ (1 / (length - 2))

  # Generate sequence
  sequence <- numeric(length)
  for (i in 1:length) {
    term <- min_value * (ratio ^ (i - 1))
    sequence[i] <- term
  }

  return(sequence)
}

min_value <- 0.000002
max_value <- 4
length <- 8

#for 100 times 
sequence <- generate_geometric_sequence(min_value, max_value, length)
rangos_tiempo <- sequence
rangos_tiempo[length(rangos_tiempo)] <- 16
print(rangos_tiempo)

matriz_linajes <- matrix(nrow=nrow(tiempo_acumulado), ncol=length(rangos_tiempo)) #24 columnas porque es la division de tiempo usada.
matriz_linajes <- matriz_linajes^0 #Requerimos que todo esté en 1s para empezar el proceso.

for (r in 1:nrow(tiempo_acumulado))  {
  num_linajes[r]
  i <- 1
  for (c in 1:ncol(tiempo_acumulado))  {
    while (tiempo_acumulado[r,c] > rangos_tiempo[i])  {
      matriz_linajes[r, i] <- num_linajes[r]
      i <- i +1
    }
    num_linajes[r] <- num_linajes[r] - 1
    matriz_linajes[r,i] <- num_linajes[r]
  }
}

matriz_linajes[matriz_linajes<1] <- 1
matriz_conteo <- matrix(nrow=ncol(matriz_intervalos), ncol=length(rangos_tiempo)) # Para esto creamos matriz de conteo, con rows = num linajes y ncol = rangos de tiempo.
matriz_conteo <- matriz_conteo^0*0 #Queremos la matriz en 0s.

for (c in 1:ncol(matriz_linajes))  {
  freq_col <- as.data.frame(table(matriz_linajes[,c]))
  for (x in nrow(matriz_conteo):1)  {
    #Si el valor X se encuentra en la columna de valores, entonces pegar su freq en matriz_conteo[x,c]
    if (x %in% freq_col$Var1)  { # True si se encuentra.
      indice <- match(x, freq_col$Var1)
      fila <- (max_linajes + 1) -x
      matriz_conteo[fila, c] <- freq_col$Freq[indice] #Poner el 215 en una variable.
    }
  }
}

filas_extra <- 200 - ncol(matriz_intervalos) #cambie de 199 a 200
matriz_extra <- matrix(nrow = filas_extra, ncol = ncol(matriz_conteo))
matriz_extra[is.na(matriz_extra)] <- 0
matriz_conteo <- rbind(matriz_extra, matriz_conteo)
#pseudocuenta. 
matriz_conteo <- matriz_conteo + 0.1

#Sitios invariables caso matriz completa
vector_1 <- vector()

max_sitios = round(l / step) #Since we are looking at probability, this operation reduces times while not distorting probability
max_effective_sites <- sum(matriz_conteo[,1])
print(max_effective_sites)

#Hasta aqui calculo la probabilidad. Porque el total ahora se calcula aparte. 
#hmmm entonces igual y djeo de computar la ultima fila. 
#y entonces... el ultimo estadistico lo imprimo o algo asi. o lo guardo aparte? 

for (i in 1:ncol(matriz_conteo))  {
  vector_1[i] <- max_sitios - max_effective_sites #numero maximo de arboles siempre esta en esa coordenada
}

print(paste("numero total de mutaciones:", max_effective_sites, sep=""))
print(paste("numero total de sitios:", max_sitios, sep=""))

matriz_prob_invariables <- matriz_conteo / max_effective_sites
rownames(matriz_conteo) <- c(1:nrow(matriz_conteo))
matriz_prob_invariables <- rbind(matriz_prob_invariables, vector_1)
write.csv(matriz_prob_invariables, paste(file_path, "set2_200x8_prob_matrix_Sel", sel, ".csv", sep=""), row.names = FALSE)

print("esta suma debe dar 1 --> ")
print(sum(matriz_prob_invariables[,1]))

#matriz_conteo_invariables <- rbind(matriz_conteo, vector_1) #Hasta aqui tengo matriz con num de sitios invariables.

#for 20 rows 
rows_per_part <- 10
n_rows_new <- ceiling(nrow(matriz_conteo) / rows_per_part)
matriz_conteo_rangos <- matrix(0, nrow = n_rows_new, ncol = ncol(matriz_conteo))

for (c in 1:ncol(matriz_conteo)) { # per column
  suma <- 0
  i <- 1
  contador <- 0
  
  for (r in 1:nrow(matriz_conteo)) { # per row
    contador <- contador + 1
    suma <- suma + matriz_conteo[r, c]
    
    if (contador == rows_per_part) { # if counter met, store sum and reset
      matriz_conteo_rangos[i, c] <- suma
      suma <- 0
      i <- i + 1
      contador <- 0
    }
  }
  
  # Handle remainder rows after the loop
  if (contador > 0) { # if there are leftover rows
    matriz_conteo_rangos[i, c] <- suma
  }
}

vector_1 <- vector()
for (i in 1:ncol(matriz_conteo_rangos))  {
  vector_1[i] <- max_sitios - max_effective_sites #numero maximo de arboles siempre esta en esa coordenada
}

#matriz_conteo_invariables_rangos <- rbind(matriz_conteo_rangos, vector_1) #Hasta aqui tengo matriz con num de sitios invariables.
rownames(matriz_conteo_rangos) <- c(1:nrow(matriz_conteo_rangos))
matriz_prob_rangos <- matriz_conteo_rangos / max_effective_sites
matriz_prob_rangos <- rbind(matriz_prob_rangos, vector_1)
print(sum(matriz_prob_rangos[,1]))

write.csv(matriz_prob_rangos, paste(file_path, "set2_20x8_prob_matrix_Sel", sel, ".csv", sep=""), row.names = FALSE)
  
####5 rows
rows_per_part <- 35
n_rows_new <- ceiling(nrow(matriz_conteo) / rows_per_part)
matriz_conteo_rangos <- matrix(0, nrow = n_rows_new, ncol = ncol(matriz_conteo))

for (c in 1:ncol(matriz_conteo)) { # per column
  suma <- 0
  i <- 1
  contador <- 0
  
  for (r in 1:nrow(matriz_conteo)) { # per row
    contador <- contador + 1
    suma <- suma + matriz_conteo[r, c]
    
    if (contador == rows_per_part) { # if counter met, store sum and reset
      matriz_conteo_rangos[i, c] <- suma
      suma <- 0
      i <- i + 1
      contador <- 0
    }
  }
  
  # Handle remainder rows after the loop
  if (contador > 0) { # if there are leftover rows
    matriz_conteo_rangos[i, c] <- suma
  }
}

#Sitios invariables caso matriz rangos
vector_1 <- vector()

for (i in 1:ncol(matriz_conteo))  {
  vector_1[i] <- max_sitios - max_effective_sites #numero maximo de arboles siempre esta en esa coordenada
}

print(vector_1)

#matriz_conteo_invariables_rangos <- rbind(matriz_conteo_rangos, vector_1) #Hasta aqui tengo matriz con num de sitios invariables.
rownames(matriz_conteo_rangos) <- c(1:nrow(matriz_conteo_rangos))
matriz_prob_rangos <- matriz_conteo_rangos / max_effective_sites
matriz_prob_rangos <- rbind(matriz_prob_rangos, vector_1) #This should print max number of mutations on last row. Count only. 
#I need this info for computing total site probability. 

write.csv(matriz_prob_rangos, paste(file_path, "set2_6x8_prob_matrix_Sel", sel, ".csv", sep=""), row.names = FALSE)
print(sum(matriz_prob_rangos[,2]))

#probemos esto. Solo cambie fials extra a 200. 
#202 lineas incluyendo nombres