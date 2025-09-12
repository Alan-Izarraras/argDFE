
#This script computes the coalescent matrix of a colection of trees simulated under demographic and selection parameters. 
#Use of rep_num variable to control each of 28 discrete selection values to be integrated. 

library(ape)

# Get SLURM_ARRAY_TASK_ID from the environment
sel <- as.integer(Sys.getenv("SLURM_ARRAY_TASK_ID"))

#This demography file should be automated..? How? ahh user inputed input. 
#How to provide user input? But if user input you need user output too. 
lines <- readLines("YRI_MeanPosteriorDemography.txt")
first_line <- lines[1]
second_line <- lines[2]

# Split the first line into individual values (assuming space-separated values)
first_value <- strsplit(first_line, "\\s+")[[1]]
second_value <- strsplit(second_line, "\\s+")[[1]]

# Extract the first value and convert it to numeric
first_value <- as.numeric(first_value[1])
second_value <- as.numeric(second_value[1])

# Divide the first value by 2
PastSize <- first_value / 2
PresentSize <- second_value / 2

print(paste("using presentSize: ", PresentSize))
print(paste("using pastSize: ", PastSize))

#Path where input files can be found (singletons and trees)
file_path <- "../Data/trees/MatrixInputs/"
#path where outputs (matrices) are to be placed
out_path <- "../Data/trees/Matrices/simulated/"
# Construct the filename    #yri_trees_Sel10.txt  #singletons_Sel10_ready.txt

tree_name <- paste0(file_path, "trees_Sel", sel, ".txt")
singleton_name <- paste0(file_path, "singletons_Sel", sel, ".txt")

print(paste("tree file is:", tree_name))

file_info <- file.info(tree_name)

#If file_info is empty then there are no trees and only singletons.
if (file_info$size == 0) {
  cat("This selection run contains only singletons \n")

  singletones <- read.table(singleton_name)

  matriz_conteo_rangos <- matrix(nrow=20, ncol=8)
  matriz_conteo_rangos[20,] <- nrow(singletones)
  matriz_conteo_rangos[is.na(matriz_conteo_rangos)] <- 0

  pseudocuenta <- 0.05 #this might need to be smaller
  matriz_conteo_rangos <- matriz_conteo_rangos + pseudocuenta

  #max_sitios <- 2888091 #total de sitios codificantes en crom 1 stdpopsim
  max_sitios <- 6775033 #total de sitios no sinonimos para extracelular matrix

  vector_1 <- vector()

  for (i in 1:ncol(matriz_conteo_rangos))  {
    vector_1[i] <- max_sitios - matriz_conteo_rangos[20,8] #numero maximo de arboles siempre esta en esa coordenada
  }

  matriz_conteo_invariables_rangos <- rbind(matriz_conteo_rangos, vector_1) #Hasta aqui tengo matriz con num de sitios invariables.
  rownames(matriz_conteo_invariables_rangos) <- c(1:21)
  matriz_prob_invariables_rangos <- matriz_conteo_invariables_rangos / max_sitios

  write.csv(matriz_conteo_invariables_rangos, paste(out_path, "count_matrix_Sel", sel, ".csv", sep=""), row.names = FALSE)
  write.csv(matriz_prob_invariables_rangos, paste(out_path, "prob_matrix_Sel", sel, ".csv", sep=""), row.names = FALSE)


} else {

  cat("This selection run contains trees and singletons \n")

  lista_arboles <- read.tree(tree_name)
  lista_intervalos <- list()

  cuenta <- read.table(tree_name)

  if (nrow(cuenta) == 1)  {
    ci <- coalescent.intervals(lista_arboles)
    #lista_intervalos[1] <- c(ci[lista_intervalos <- list()])
    lista_intervalos[1] <- ci[2]
  } else  {
    for (i in 1:length(lista_arboles))  {
      ci <- coalescent.intervals(lista_arboles[[i]])
      lista_intervalos[i] <- c(ci[2])
    }
  }

  num.obs <- sapply(lista_intervalos, length)
  seq.max <- seq_len(max(num.obs))
  matriz_intervalos <- t(sapply(lista_intervalos, "[", i = seq.max))

  #Hay un big qhe interpreta primer distancia como = 0
  #Con este codigo lo reemplazo por la distancia minima = 0.000001

  # Find values <= 0
  values_leq_zero <- matriz_intervalos[matriz_intervalos <= 0]

  # Get the indices of these values
  indices_leq_zero <- which(matriz_intervalos <= 0, arr.ind = TRUE)
  distancia_minima <- 0.000001
  matriz_intervalos[indices_leq_zero[, 1], 1] <- distancia_minima

  singletones <- read.table(singleton_name)
  colnames(singletones) <- c(1,2)
  matriz_temp <- matrix(nrow=nrow(singletones), ncol=ncol(matriz_intervalos)-2)
  matriz_temp <- cbind(singletones, matriz_temp)
  colnames(matriz_temp) <- seq(1:ncol(matriz_intervalos))
  colnames(matriz_intervalos) <- seq(1:ncol(matriz_intervalos))
  matriz_intervalos <- rbind(matriz_temp, matriz_intervalos)

  #I dont remember this... Is this done for Relate trees or all kinds of trees..?
  #I think this is only to be done for when comparing with real data, but in this case it should be comparable
  ajuste_poblacional <- 4*PresentSize
  matriz_intervalos <- matriz_intervalos * (4*PresentSize)

  tiempo_acumulado <- matrix(nrow=nrow(matriz_intervalos), ncol=ncol(matriz_intervalos))

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

  #Aqui cuento la "frecuencia" que equivale al numero de columnas
  max_linajes <- ncol(matriz_intervalos) #Aqui otro cambio ncol(matriz_intervalos)
  num_linajes <- 1

  for (i in 1:nrow(tiempo_acumulado))  {
    num_linajes[i] <- match(0, tiempo_acumulado[i,]) #La frecuencia es la columna donde encuentra un 0. Para cada renglon/arbol
    if (0 %in% num_linajes[i])  {
      num_linajes[i] <- max_linajes
    }
  }

  num_linajes[is.na(num_linajes)] <- max_linajes


  #Hasta aqui se ve bien.

  rangos_tiempo <- c(0.000002, 0.000020, 0.000200, 0.002000, 0.020000, 0.200000, 2.000000, 1600)
  rangos_tiempo <- rangos_tiempo * 60000 #this also should be for Relate scenario only

  matriz_linajes <- matrix(nrow=nrow(tiempo_acumulado), ncol=length(rangos_tiempo)) #24 columnas porque es la division de tiempo usada.
  matriz_linajes <- matriz_linajes^0 #Requerimos que todo esté en 1s para empezar el proceso.

  #Empata el numero de linajes y ve si ha coalescido
  for (r in 1:nrow(tiempo_acumulado))  { #Por cada fila de tiempo acumulado
    num_linajes[r]  #El mismo arbol con su numero de linajes
    i <- 1
    for (c in 1:ncol(tiempo_acumulado))  { #por cada columna
      while (tiempo_acumulado[r,c] > rangos_tiempo[i])  { #mientras la celda de tiempo acumulado sea mayor al tiempo
        matriz_linajes[r, i] <- num_linajes[r]
        i <- i +1
      }
      num_linajes[r] <- num_linajes[r] - 1
      matriz_linajes[r,i] <- num_linajes[r]
    }
  }

  #Recuerda que un singleton es cuenta 2 porque está acoplado al ancestral y un linaje cuenta 1 ya solo es el ancestral.
  matriz_linajes[matriz_linajes<1] <- 1

  #Una buena prueba es si coinciden num_linajes y tiempo_acum...
  #bug1. Hay veces que algunos arboles empiezan con tiempo 0 entonces se interpreta 1 linaje en lugar de muchos. Es medio comun
  #bug2.
  #Algo está pasando de matriz_linajes a matriz_conteo

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

  #Aqui es potencialmente 199
  filas_extra <- 199 - ncol(matriz_intervalos)
  matriz_extra <- matrix(nrow = filas_extra, ncol = ncol(matriz_conteo))
  matriz_extra[is.na(matriz_extra)] <- 0
  matriz_conteo <- rbind(matriz_extra, matriz_conteo)

  #Calculo sitios invariables
  vector_1 <- vector()
  max_sitios <- 6775033

  for (i in 1:ncol(matriz_conteo))  {
    vector_1[i] <- max_sitios - matriz_conteo[199,8] #numero maximo de arboles siempre esta en esa coordenada
  }

  matriz_conteo_invariables <- rbind(matriz_conteo, vector_1) #Hasta aqui tengo matriz con num de sitios invariables.
  matriz_prob_invariables <- matriz_conteo_invariables / max_sitios
  rownames(matriz_conteo_invariables) <- c(1:200)

  #write.csv(matriz_conteo_invariables, paste(out_path, "matriz_conteo_invariables_", rep_num, "_full_", sel, ".csv", sep=""), row.names = FALSE)
  #write.csv(matriz_prob_invariables, paste(out_path, "matriz_prob_invariables_", rep_num, "_full_", sel, ".csv", sep=""), row.names = FALSE)

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

  #Agrego cuenta de 0.05 a cada valor 0 para incorporar la pseudocuenta.
  pseudocuenta <- 0.05
  matriz_conteo_rangos <- matriz_conteo_rangos + pseudocuenta

  vector_1 <- vector()

  for (i in 1:ncol(matriz_conteo))  {
    vector_1[i] <- max_sitios - matriz_conteo_rangos[20,8] #numero maximo de arboles siempre esta en esa coordenada
  }

  matriz_conteo_invariables_rangos <- rbind(matriz_conteo_rangos, vector_1) #Hasta aqui tengo matriz con num de sitios invariables.
  rownames(matriz_conteo_invariables_rangos) <- c(1:21)
  matriz_prob_invariables_rangos <- matriz_conteo_invariables_rangos / max_sitios

  write.csv(matriz_conteo_invariables_rangos, paste(out_path, "count_matrix_Sel", sel, ".csv", sep=""), row.names = FALSE)
  write.csv(matriz_prob_invariables_rangos, paste(out_path, "prob_matrix_Sel", sel, ".csv", sep=""), row.names = FALSE)

}

