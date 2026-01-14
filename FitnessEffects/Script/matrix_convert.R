#Codigo para transformar matrices creadas con rangos de 100 tiempos a matrices con menos rangos de tiempo.
#No transforma entre matrices con distinto numero de filas. why not?   

new_matrix <- matrix(nrow=200, ncol=8)
sample_matrix <- read.csv("observed_200x100_count_matrix.csv")

#transformación de tiempos
for (f in 1:nrow(sample_matrix))  }
  for (a in rangos_tiempo_8)  {
    b <- 2
    while (a > rangos_tiempo_100[b])  { #esto automaticamente deberia resultar en el numero correcto de columnas.
      b <- b +1
    }
    #ya no es mayor entonces print  
    i <- i +1
    new_matrix[f,i] <- sample_matrix[f,b]
  }
}

#Transformación de filas. 
#for 20 rows 

for (c in 1:2) {

  rows_per_part <- c(10,35)
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
}

#esto cambia, aqui solo pongo la ultima fila tal cual y gg. 
vector_1 <- vector()
for (i in 1:ncol(matriz_conteo))  {
  vector_1[i] <- max_sitios - max_effective_sites #numero maximo de arboles siempre esta en esa coordenada
}

#Ah esto solo falta un for mas grande para movernos de fila. 
#this should be it. Just some testing to make sure.
#esa inferencia ya lleva 4 horas. no es para tanto?  