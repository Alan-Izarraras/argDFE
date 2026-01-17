#Construct matrices for every tree file. aka 200 matrices per selection value.
#Design to cut down matrix construction time but unsure how much efficient. 

library(ape)
sel <- as.integer(Sys.getenv("SLURM_ARRAY_TASK_ID"))
print(sel)
PresentSize <- 10000
PastSize <- 10000
l <- 19379845
l <- l/100
step <- 1 #should be 1 here...?
PresentSize <- as.numeric(PresentSize)
PastSize <- as.numeric(PastSize)
l <- as.numeric(l)
step <- as.numeric(step)

# Get SLURM_ARRAY_TASK_ID from the environment
sel <- as.integer(Sys.getenv("SLURM_ARRAY_TASK_ID")) 

#Path where input files can be found (singletons and trees)
file_path <- paste0("../Data/trees/Sel_", sel, "/")
#path where outputs (matrices) are to be placed
out_path <- "../Data/trees/MatrixInputs/ConstantSize/set1/matrices/"

for (a in 1:200) {
  lista_intervalos <- list()
  tree_name <- paste0(file_path, "trees_", sel, formatC(a, width = 3, flag = "0"), "_Sel", sel, ".txt") #zer-padding for numbered names
  is_empty <- file.info(tree_name)$size == 0
  # formatC is the base R version of sprintf

  if (is_empty==0)  { #Evalua si hay arboles
    print("There are trees")
    lista_arboles <- read.tree(paste0(file_path, "trees_", sel, formatC(a, width = 3, flag = "0"), "_Sel", sel, ".txt"))
    cuenta <- read.table(paste0(file_path, "trees_", sel, formatC(a, width = 3, flag = "0"), "_Sel", sel, ".txt"))
    #resume as if nothing happened
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

  }
  
  if (is_empty==1)  {
    print("only singletons here, no trees")
  }
  
  singletones <- read.table(paste0(file_path, "singletons_", sel, formatC(a, width = 3, flag = "0"), "_Sel", sel, "_ready.txt"), sep="", fill = TRUE)
  colnames(singletones) <- c(1,2)

  if (is_empty==0)  {
    matriz_temp <- matrix(nrow=nrow(singletones), ncol=ncol(matriz_intervalos)-2)
    matriz_temp <- cbind(singletones, matriz_temp)
    colnames(matriz_temp) <- seq(1:ncol(matriz_intervalos))
    colnames(matriz_intervalos) <- seq(1:ncol(matriz_intervalos))
    matriz_intervalos <- rbind(matriz_temp, matriz_intervalos)
  } else {
    matriz_intervalos <- as.matrix(singletones)
  }

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
  #ok creo que esta condicion, la tengo que ejecutar siempre. 
  if (matriz_intervalos[nrow(matriz_intervalos), ncol(matriz_intervalos)] != 0)  {
    matriz_intervalos <- cbind(matriz_intervalos, 0)
  }

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
    ratio <- (max_value / min_value) ^ (1 / (length - 1))

    # Generate sequence
    sequence <- numeric(length)
    for (i in 1:length) {
      term <- min_value * (ratio ^ (i - 1))
      sequence[i] <- term
    }

    return(sequence)
  }

  min_value <- 0.000001
  max_value <- 1
  length <- 8 #change for different discrete times

#for 50 times
  sequence <- generate_geometric_sequence(min_value, max_value, length)
  rangos_tiempo <- sequence
  #rangos_tiempo[length(rangos_tiempo)] <- 16 #this should be append intead of substitute. 
  rangos_tiempo <- c(rangos_tiempo, 16)
  print(rangos_tiempo)

#rangos_tiempo <- rangos_tiempo * 60000
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

  filas_extra <- 200 - ncol(matriz_intervalos) #this is a hotfix. lets test. 
  #what happens when this is -1 ??? 
  print(paste("filas extra", filas_extra, sep=" "))
  if (filas_extra > 0) { #Case when you have all freq values. 
    print("condition met")
    matriz_extra <- matrix(nrow = filas_extra, ncol = ncol(matriz_conteo)) 
    matriz_extra[is.na(matriz_extra)] <- 0
    matriz_conteo <- rbind(matriz_extra, matriz_conteo)
  }
  #Sitios invariables caso matriz completa
  vector_1 <- vector()

  max_sitios = round(l / step) #Since we are looking at probability, this operation reduces times while not distorting probability
  max_effective_sites <- max(matriz_conteo)
  #ok this works. No more bug where the last tree is misrepresented in frequency. 
  print(ncol(matriz_conteo))
  for (i in 1:ncol(matriz_conteo))  {
    vector_1[i] <- max_sitios - max_effective_sites #numero maximo de arboles siempre esta en esa coordenada
  }
  print(vector_1)
  matriz_conteo_invariables <- rbind(matriz_conteo, vector_1) #Hasta aqui tengo matriz con num de sitios invariables.
  
  i <- nrow(matriz_conteo_invariables) -2
  matriz_conteo_invariables_2 <- matriz_conteo_invariables                                  
  matriz_conteo_invariables_2[i, ] <- matriz_conteo_invariables[i, ] + matriz_conteo_invariables[i+1, ]              
  matriz_conteo_invariables_2 <- matriz_conteo_invariables_2[- (i+1), ]

  write.csv(matriz_conteo_invariables_2, paste(out_path, "200x8_count_",sel, formatC(a, width = 3, flag = "0"), "_sel", sel, ".csv", sep=""), row.names = FALSE)

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
  for (i in 1:ncol(matriz_conteo))  {
    vector_1[i] <- max_sitios - max_effective_sites #numero maximo de arboles siempre esta en esa coordenada
  }

  matriz_conteo_rangos <- rbind(matriz_conteo_rangos, vector_1) #Hasta aqui tengo matriz con num de sitios invariables. 
  write.csv(matriz_conteo_rangos, paste(out_path, "20x8_count_",sel, formatC(a, width = 3, flag = "0"), "_sel", sel, ".csv", sep=""), row.names = FALSE)

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

  vector_1 <- vector()
  for (i in 1:ncol(matriz_conteo))  {
    vector_1[i] <- max_sitios - max_effective_sites #numero maximo de arboles siempre esta en esa coordenada
  }

  matriz_conteo_rangos <- rbind(matriz_conteo_rangos, vector_1) #Hasta aqui tengo matriz con num de sitios invariables.
  write.csv(matriz_conteo_rangos, paste(out_path, "6x8_count_", sel, formatC(a, width = 3, flag = "0"), "_sel",sel, ".csv", sep=""), row.names = FALSE)

}