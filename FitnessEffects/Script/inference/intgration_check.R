#matriz_gamma_check
#codigo para verificar la integración y cosntruccion de matrices con una dfe 

AlphaGrid <- 0.186
GammaGrid <- 706

valor_2Ns <- c(0, 10^seq(-2.75, 3.50, by = 0.25))
valor_medio <- (valor_2Ns[-length(valor_2Ns)] + valor_2Ns[-1]) / 2

l <- 19379845

prob_matrix_list <- list()
for (i in 1:27)  {
  prob_matrix_list[[i]] <- read.csv(paste0("../../Data/trees/MatrixInputs/ConstantSize/set2/matrices/new_pseudocount/200x8_count_kimDFE_Sel", i, ".csv"))
  ejemplo <- prob_matrix_list[[i]]
}

dfe_matrix <- read.csv("../../Data/trees/MatrixInputs/ConstantSize/set1/rep_matrices/dfe/200x8_count_kimDFE1_rep1.csv")
dfe_matrix <- as.matrix(dfe_matrix[-200,])
dfe_prob_matrix <- dfe_matrix / dfe_matrix[199,9]
write.csv(dfe_prob_matrix, "dfe_prob_matrix.csv", row.names = FALSE)

gamma_matrix_list <- list()

for (j in AlphaGrid)  {
  for (k in GammaGrid)  {
    a <- 1
    mass <- vector()
    for (i in valor_2Ns)  { #Para cada i, solamente se ejecuta una de las 3 condiciones. UNA.
      matriz_prob <- prob_matrix_list[[a]] #this contains non prob at last row so have to transform
      matriz_prob_true <- as.matrix(matriz_prob[-200,])
      ob_inv_sites <- matriz_prob[200,1]
      ob_var_sites <- l - ob_inv_sites 
      p_var_sites <- (ob_var_sites / l) 
      p_invar_sites <- 1 - p_var_sites
      if ( i == valor_2Ns[1])  { #No es el primer valor, sino un valor intermedio entre primer y segudo valor.
        prob_mass <- pgamma(valor_medio[1],j,1/k)
        cat(matriz_prob_true[199,1], "\t", prob_mass, "\n")
        mass[a] <- prob_mass
        gamma_matrix_list[[a]] <- matriz_prob_true * prob_mass
      }else if (i==valor_2Ns[length(valor_2Ns)])  { #ultimo valor 
        prob_mass <- (1 - pgamma(valor_medio[a-1],j,1/k)) #ok creo este es el problema.
        cat(matriz_prob_true[199,1], "\t", prob_mass, "\n")
        mass[a] <- prob_mass
        gamma_matrix_list[[a]] <- matriz_prob_true * prob_mass
      }else  { #resto de valores 
        prob_mass <- (pgamma(valor_medio[a],j,1/k) - pgamma(valor_medio[a-1],j,1/k))
        cat(matriz_prob_true[199,1], "\t", prob_mass, "\n")
        mass[a] <- prob_mass
        gamma_matrix_list[[a]] <- matriz_prob_true * prob_mass
      }
      a <- a + 1
    }
  }
}

gamma_matrix <- Reduce(`+`, gamma_matrix_list) #Gracias chatgpt
gamma_matrix <- gamma_matrix / sum(gamma_matrix[,1])
write.csv(gamma_matrix, "dfe_gamma_matrix_v5.csv", row.names = FALSE)


#por cada i (valor 2ns) tengo que guardar la matriz y alfinal lo que se imprime o lo que estoy operando
#es la suma. 

#si to grafico cada masa de probabilidad en bines, deberia ser la dfe que busco, no?  si parece. 


#si esto esta bien entonces es cosa de las matrices de prob? 