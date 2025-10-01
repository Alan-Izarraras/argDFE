
#Algo asi ya estaría aunque creo que el if lo puedo recorrer a mucho mas arriba?

#2) Poner length (cambiar nombre) como linea de comandos
#3) Mandar una prueba completa. 
#4) Mover numero de filas. 
#5) Poder nombrar input/output desde linea de comandos.

#Falta agregar "length" aka seleccion de numero de sitios como argumento. Pero primero probar asi. 
#looks good. lets try. 

library(ape)

SGE_TASK_ID <- 3
PresentSize <- 30000
PastSize <- 5000
l <- 500000
step <- 4

PresentSize <- as.numeric(PresentSize)
PastSize <- as.numeric(PastSize)
l <- as.numeric(l)
step <- as.numeric(step)

#Read in trees and transforms to coalescent matrix
lista_arboles <- read.tree(paste("../ABC_Demography/Data/Parameters/Output/matrices/tree_dump/trees_ABCDemography_", SGE_TASK_ID, ".txt", sep=""))
lista_intervalos <- list()
cuenta <- read.table(paste("../ABC_Demography/Data/Parameters/Output/matrices/tree_dump/trees_ABCDemography_", SGE_TASK_ID, ".txt", sep=""))

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

#Reads in singleton file and passes interval list to matrix 
num.obs <- sapply(lista_intervalos, length)
seq.max <- seq_len(max(num.obs))
matriz_intervalos <- t(sapply(lista_intervalos, "[", i = seq.max))
singletones <- read.table(paste("../ABC_Demography/Data/Parameters/Output/matrices/tree_dump/singletons_", SGE_TASK_ID, "_ready.txt", sep=""))
colnames(singletones) <- c(1,2)
matriz_temp <- matrix(nrow=nrow(singletones), ncol=ncol(matriz_intervalos)-2)
matriz_temp <- cbind(singletones, matriz_temp)
colnames(matriz_temp) <- seq(1:ncol(matriz_intervalos))
colnames(matriz_intervalos) <- seq(1:ncol(matriz_intervalos))
matriz_intervalos <- rbind(matriz_temp, matriz_intervalos)

ajuste_poblacional <- 4*PresentSize
matriz_intervalos <- matriz_intervalos * (4*PresentSize)
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
#formating
matriz_intervalos[is.na(matriz_intervalos)] <- 0
tiempo_acumulado[is.na(tiempo_acumulado)] <- 0
max_linajes <- ncol(matriz_intervalos) #Aqui otro cambio ncol(matriz_intervalos)
num_linajes <- 1

#based on previous matrix, notes how many intervals are contained in each tree and stores in vector
for (i in 1:nrow(tiempo_acumulado))  {
  num_linajes[i] <- match(0, tiempo_acumulado[i,])
  if (0 %in% num_linajes[i])  {
    num_linajes[i] <- max_linajes

  }
}
num_linajes[is.na(num_linajes)] <- max_linajes

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
max_value <- max(tiempo_acumulado)
length <- 3

if (length == 1)  {
  count <- tabulate(num_linajes) #retrieves occurance of every number (SFS)
  row_conversion <- 200 - max_linajes  #200 = sample_size in haploids
  count <- c(count, rep(0, row_conversion)) #Adds unobserve frequency values
  count <- rev(count) #Reverses for formatting (first rows are max frequency, last row is singleton)
  sfs_count <- matrix(count, ncol=1) #this is actually the final thing.

  #This might also be helpful for changing groupings ! 
  #Splits matrix into parts, counts the parts then regroups in whatever number of rows you want. 
  #Now i want to generalize this. Think its better to give grouping number and that yields number of rows. 
  split_parts <- 20 #final rownumber is 20
  rows_per_part <- 10 #collapses 10 rows.
  split_indices <- rep(1:split_parts, each = rows_per_part)
  split_mats <- split(sfs_count, split_indices) #Somethings failing here... says dimensions are different.
  sfs_count_matrix <- sapply(split_mats, sum)
  sfs_count_matrix <- matrix(sfs_count_matrix, ncol=1)

  #printing output
  max_sitios = round(l / step) #Since we are looking at probability, this operation reduces times while not distorting probability
  max_effective_sites <- max(sfs_count_matrix)

  vector_1 <- max_sitios - max_effective_sites #numero maximo de arboles siempre esta en esa coordenada

  sfs_count_matrix <- rbind(sfs_count_matrix, as.integer(vector_1)) #Hasta aqui tengo matriz con num de sitios invariables.
  sfs_prob_matrix <- sfs_count_matrix / max_sitios
   
  #print statement. 
  write.csv(sfs_count_matrix, paste("observed_sfs_matrix_", SGE_TASK_ID, ".csv", sep=""), row.names = FALSE)
  #works! 

} else { #else proceed as usual.

  sequence <- generate_geometric_sequence(min_value, max_value, length)
  rangos_tiempo <- sequence

  #num_linajes[is.na(num_linajes)] <- max_linajes
  #rangos_tiempo <- c(0.000002, 0.000020, 0.000200, 0.002000, 0.020000, 0.200000, 2.000000, 16)
  rangos_tiempo <- rangos_tiempo * 60000
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

  #Recuerda que un singleton es cuenta 2 porque está acoplado al ancestral y un linaje cuenta 1 ya solo es el ancestral.
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

  #This is dependant on the number of samples, this was constructed for 200 genomes or 100 indvs.
  filas_extra <- 199 - ncol(matriz_intervalos)
  matriz_extra <- matrix(nrow = filas_extra, ncol = ncol(matriz_conteo))
  matriz_extra[is.na(matriz_extra)] <- 0
  matriz_conteo <- rbind(matriz_extra, matriz_conteo)

  #Sitios invariables caso matriz completa
  vector_1 <- vector()

  #When comparing versus an observed for ABC generations, a step of 100 is ideal, considering it produces at least 20k sites or so.
  max_sitios = round(l / step) #Since we are looking at probability, this operation reduces times while not distorting probability
  max_effective_sites <- max(matriz_conteo)

  for (i in 1:ncol(matriz_conteo))  {
    vector_1[i] <- max_sitios - max_effective_sites #numero maximo de arboles siempre esta en esa coordenada
  }

  matriz_conteo_invariables <- rbind(matriz_conteo, vector_1) #Hasta aqui tengo matriz con num de sitios invariables.
  matriz_prob_invariables <- matriz_conteo_invariables / max_sitios
  rownames(matriz_conteo_invariables) <- c(1:200)

  #Uncomment if you want the full matrix showing all frequency values
  #write.csv(matriz_conteo_invariables, paste("../Data/Parameters/Output/trees/training_matrices/matriz_conteo_invariables_full", SGE_TASK_ID, ".csv", sep=""), row.names = FALSE)
  #write.csv(matriz_prob_invariables, paste("../Data/Parameters/Output/trees/training_matrices/matriz_prob_invariables_full", SGE_TASK_ID, ".csv", sep=""), row.names = FALSE)

  #Hago matriz con rangos de frecuencia
  matriz_conteo_rangos <- matrix(nrow= 20, ncol=length(rangos_tiempo))

  for (c in 1:ncol(matriz_conteo))  {
    suma <- 0
    i <- 1
    contador = 0
    for (r in 1:nrow(matriz_conteo))  {
      contador = contador + 1
      suma <- suma + matriz_conteo[r,c]
      if (contador==10)  { #Cambiar aqui
        matriz_conteo_rangos[i,c] <- suma
        suma <- 0
        i <- i+1
        contador = 0
      }
      else  {
        matriz_conteo_rangos[i,c] <- suma
      }
    }
  }

  #Sitios invariables caso matriz rangos
  vector_1 <- vector()

  for (i in 1:ncol(matriz_conteo))  {
    vector_1[i] <- max_sitios - max_effective_sites #numero maximo de arboles siempre esta en esa coordenada
  }

  matriz_conteo_invariables_rangos <- rbind(matriz_conteo_rangos, vector_1) #Hasta aqui tengo matriz con num de sitios invariables.
  rownames(matriz_conteo_invariables_rangos) <- c(1:21)
  matriz_prob_invariables_rangos <- matriz_conteo_invariables_rangos / max_sitios

  #This prints sub matrices, meaning they are parts of the total observed matrix.
  #To generate total observed matrix a final step is needed to sum al sub count matrices and generate final probability matrix.
  write.csv(matriz_conteo_invariables_rangos, paste("observed_count_matrix_", SGE_TASK_ID, ".csv", sep=""), row.names = FALSE)
  #write.csv(matriz_prob_invariables_rangos, paste("../Data/Parameters/Output/matrices/observed_matrices/observed_prob_matrix", SGE_TASK_ID, ".csv", sep=""), row.names = FALSE)
}

