
args <- commandArgs(trailingOnly = TRUE)

# The first argument is the SLURM task ID
task_id <- as.numeric(args[1])

#Make tree matrix out of "empirical" data, in this case coding sites. from tree distance file. 
datos <- readLines(paste0("Distances/chr", task_id, "_syn_distances.txt"))

lista_intervalos <- lapply(datos, function(row) strsplit(row, ",")[[1]])
# If length the la lista es 3, entonces borrar el primer numero --> caso para los dobletones.

num.obs <- sapply(lista_intervalos, length)
seq.max <- seq_len(max(num.obs))
matriz_intervalos <- t(sapply(lista_intervalos, "[", i = seq.max))

matriz_intervalos <- apply(matriz_intervalos, 2, as.numeric)

# Borrar renglones que inicien en 0.
rows_to_keep <- matriz_intervalos[,1] != 0
matriz_intervalos <- matriz_intervalos[rows_to_keep, ]

# Despues de esto tengo 7235 arboles
matriz_intervalos[is.na(matriz_intervalos)] <- 0
tiempo_acumulado <- matriz_intervalos

max_linajes <- ncol(matriz_intervalos) -1 # Aqui otro cambio ncol(matriz_intervalos)
num_linajes <- numeric(nrow(tiempo_acumulado)) # Initialize num_linajes as numeric vector

# Lo que hace es imprimir el numero de columna donde ocurre el 0 para tener reflejado el numero de linajes.
for (i in 1:nrow(tiempo_acumulado)) {
  num_linajes[i] <- match(0, tiempo_acumulado[i,])
  if (is.na(num_linajes[i])) {
    num_linajes[i] <- max_linajes
  }
}

for (i in 1:length(num_linajes)) {
  tryCatch({
    if (num_linajes[i] == 2) { # Si numlinajes es 2 entonces es singleton.
      num_linajes[i] <- 1
    } else if (num_linajes[i] != 2) { # Si es diferente a dos entonces restale 2 y ese es.
      num_linajes[i] <- num_linajes[i] - 2
    }
  }, warning = function(w) {
    # Handle warning
    cat("Warning in num_linajes loop: ", conditionMessage(w), "\n")
  }, error = function(e) {
    # Handle error
    cat("Error in num_linajes loop: ", conditionMessage(e), "\n")
  })
}

num_linajes[is.na(num_linajes)] <- max_linajes

rangos_tiempo <- c(0.000002, 0.000020, 0.000200, 0.002000, 0.020000, 0.200000, 2.000000, 1600)
# rangos_tiempo <- c(0.000002, 0.000500, 0.001000, 0.0020000, 0.020000, 0.200000, 2.000000, 16)
rangos_tiempo <- rangos_tiempo * 60000

matriz_linajes <- matrix(nrow=nrow(tiempo_acumulado), ncol=length(rangos_tiempo)) # 24 columnas porque es la division de tiempo usada.

# matriz_linajes <- matriz_linajes^0 # Requerimos que todo esté en 1s para empezar el proceso.
# Creo que es mejor inicialziar en -1
matriz_linajes[is.na(matriz_linajes)] <- 0
matriz_linajes <- matriz_linajes * -1

for (r in 1:nrow(tiempo_acumulado)) {
  num_linajes[r]
  i <- 1
  for (c in 1:ncol(tiempo_acumulado)) {
    while (tiempo_acumulado[r,c] > rangos_tiempo[i]) {
      matriz_linajes[r, i] <- num_linajes[r]
      i <- i +1
    }
    num_linajes[r] <- num_linajes[r] - 1
    matriz_linajes[r,i] <- num_linajes[r]
  }
}

matriz_linajes[matriz_linajes==1] <- 2
matriz_linajes[matriz_linajes<0] <- 1
matriz_linajes[matriz_linajes==0] <- 1

matriz_conteo <- matrix(nrow=ncol(matriz_intervalos), ncol=length(rangos_tiempo)) # Para esto creamos matriz de conteo, con rows = num linajes y ncol = rangos de tiempo.
matriz_conteo <- matriz_conteo^0*0 # Queremos la matriz en 0s.

for (c in 1:ncol(matriz_linajes)) {
  freq_col <- as.data.frame(table(matriz_linajes[,c]))
  for (x in nrow(matriz_conteo):1) { # de 200 a 1
    # Si el valor X se encuentra en la columna de valores, entonces pegar su freq en matriz_conteo[x,c]
    if (x %in% freq_col$Var1) { # True si se encuentra.
      indice <- match(x, freq_col$Var1)
      fila <- (max_linajes + 1) -x
      matriz_conteo[fila, c] <- freq_col$Freq[indice] # Poner el 215 en una variable.
    }
  }
}

matriz_conteo_rangos <- matrix(nrow= 20, ncol=length(rangos_tiempo))

for (c in 1:ncol(matriz_conteo)) {
  suma <- 0
  i <- 1
  contador = 0
  for (r in 1:nrow(matriz_conteo)) {
    contador = contador + 1
    suma <- suma + matriz_conteo[r,c]
    if (contador==10) { # Cambiar aqui
      matriz_conteo_rangos[i,c] <- suma
      suma <- 0
      i <- i+1
      contador = 0
    }
    else {
      matriz_conteo_rangos[i,c] <- suma
    }
  }
}

vector_1 <- vector()
#max_sitios <- 3993192 # Total de sitios no_sinonimos en todo el genoma para genes "immune system"
max_sitios <- 6775033 #Total de sitios no sinonimos en genes de la matriz extracelular
#max_sitios <- 3993192 # Total de sitios sinonimos en cromosoma 22. Numero total de sitios codificantes 

for (i in 1:ncol(matriz_conteo)) {
  vector_1[i] <- max_sitios - matriz_conteo_rangos[20,8] # numero maximo de arboles siempre esta en esa coordenada
}

matriz_conteo_invariables <- rbind(matriz_conteo_rangos, vector_1) # Hasta aqui tengo matriz con num de sitios invariables.
rownames(matriz_conteo_invariables) <- c(1:21)

matriz_prob_invariables <- matriz_conteo_invariables / max_sitios

write.csv(matriz_conteo_invariables, paste("Distances/matriz_conteo_chr", task_id, "_syn.csv", sep=""))
write.csv(matriz_prob_invariables, paste("Distances/matriz_prob_chr", task_id, "_syn.csv", sep=""))

#this works. Now just do mechanism for running both syn and nonsyn simultaneouly? or better yet, make it be function of slurmtaskid. 

