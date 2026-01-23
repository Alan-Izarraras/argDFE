#Probability Table new. 
#
#Ya tengo estas probabilidades de rangos de 2Ns para distintas distribuciones gamma. 
#La misma pero con probabildiad de sitios 
#Multiplicar ambas tablas --> Gamma compuesta (sitios + arbol) 
#Probabilidad de encontrar cierto numero de sitios para cierto patron de coalescencia en un intervalo de una distribucion gamma con paramentros j,k

AlphaGrid <- 0.01*1:100 #(100 valores) (Kim)
GammaGrid <- 15*1:100 #(100 valores) (Kim)

Valores_2Ns <- c(0, 10^seq(-2.75, 3.75, by = 0.25))
valor_medio <- #Valor i + Valor 1+i / 2 #lenght(26)

#Conteo_sitios <- c(5000,4000,3000,1000 ...)
#l <- 19123832

Probabilidad_sitio_variable <- (Conteo_sitios[a] / l)
#vector length(27)

Table <- matrix(ncol=30,nrow=0) #Ncol is length of 2Ns values (27) + alpha and Gamma params = 29 but theres some wierd extra space so 30
promedio <- Valores_2Ns[1] + Valores_2Ns[2] #llamo esto para la funcion pgamma

for (j in AlphaGrid)  {
  for (k in GammaGrid)  {
    total_prob <- 0
    Probability <- 0
    Row <- c(j,k)
    a <- 1
    for (i in Valores_2Ns)  { #Para cada i, solamente se ejecuta una de las 3 condiciones. UNA.
      if ( i == Valores_2Ns[1])  { #No es el primer valor, sino un valor intermedio entre primer y segudo valor.
        Probability <- pgamma(valor_medio[1],j,1/k)
        Row <- c(Row,Probability)
      }else if (i==Valores_2Ns[length(Valores_2Ns)])  { #ultimo valor
        Probability <- (1 - pgamma(valor_medio[a-1],j,1/k)) #valor anterior al ultimo
        Row <- c(Row,Probability)
      }else  { #resto de valores 
        Probability <- (pgamma(valor_medio[a],j,1/k) - pgamma(valor_medio[a-1],j,1/k))
        Row <- c(Row,Probability)
      }
      a <- a + 1
    }
    total_prob <- sum(Probability) #Si esto = 1 todo bien
    print(total_prob)
    Table <- rbind(Table,Row)
  }
}

#this gives me the probability that a random variable falls in some interval of the distribution. 
#now if I want to add another term. Still from a gamma distribution. then i must compound the probabilities? 
#So do a Prob1 and Prob2 where Prob1 is that and Prob2 is the sites thing then multiply these? 
#is that it? 
#hmmm but these are observations? so all combination of weights 10k combination of weights depending on the distribution form 
#each row is a diff distribution
#soo... i need to fit different sites probabilities? no, i have to find the site probability for each dist. 
#its jsut one term, not 27. 
#Orrr..? Maybe create site probabilities associated with each 2Ns values. and then sum the up and proceed with that term? 

