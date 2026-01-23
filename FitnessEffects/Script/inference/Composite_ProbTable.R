#ProbTable_Sitios.R
#1) Generate table of Composite probability (2Ns integration + invariable sites probability)

AlphaGrid <- 0.01*1:100 #(100 valores) (Kim)
GammaGrid <- 15*1:100 #(100 valores) (Kim)

site_counts <- c() #Los sitios segregantes de cada valor gamma (leer la matriz)
l <- 19123543
invariable_sites_prob <- 1 - (site_counts(i) / l)

#Prueba de que todo cuadre
#1) Simular una DFE (boyko/Kim) 10,000 
#2) Consulto sitios fijos de esa matriz/sim 
#3) Deberian ser iguales a su probabilidad compuesta ^ e 

for (j in AlphaGrid)  {
  for (k in GammaGrid)  {
    prob_compuesta <- 0
    Row <- c(j,k)
    a <- 1
    for (i in Valores_2Ns)  { #Para cada i, solamente se ejecuta una de las 3 condiciones. UNA.
      if ( i == Valores_2Ns[1])  { #No es el primer valor, sino un valor intermedio entre primer y segudo valor.
        Probability <- pgamma(valor_medio[1],j,1/k)
        Prob_compuesta <- log(Probability) + log(probabilidad_invariable[1])
        Row <- c(Row,Probability)
      }else if (i==Valores_2Ns[length(Valores_2Ns)])  { #ultimo valor
        Probability <- (1 - pgamma(valor_medio[a-1],j,1/k)) #valor anterior al ultimo
        Prob_compuesta <- log(Probability) + log(probabilidad_invariable[1])
        Row <- c(Row,Probability)
      }else  { #resto de valores 
        Probability <- (pgamma(valor_medio[a],j,1/k) - pgamma(valor_medio[a-1],j,1/k))
        Prob_compuesta <- log(Probability) + log(probabilidad_invariable[1])
        Row <- c(Row,Probability)
      }
      a <- a + 1
    }
    total_prob <- sum(Probability) #Si esto = 1 todo bien
    print(total_prob)
    Table <- rbind(Table,Row)
  }
}

#2) 
# - Verosimilitud de sitios 
# - Verosimilutd de coalescencias
# - Verosimilitud compuesta <- V_sitios * V_Coalescencias
#



