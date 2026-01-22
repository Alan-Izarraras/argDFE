#Prob Table new. 

AlphaGrid <- 0.01*1:100 #(100 valores) (Kim)
GammaGrid <- 15*1:100 #(100 valores) (Kim)

Valores_2Ns <- c(0, 10^seq(-2.75, 3.75, by = 0.25))

Table <- matrix(ncol=30,nrow=0) #Ncol is length of 2Ns values (27) + alpha and Gamma params = 29 but theres some wierd extra space so 30

for (j in AlphaGrid)  {
  for (k in GammaGrid)  {
    Probability <- 0
    Row <- c(j,k)
    a <- 1
    for (i in Valores_2Ns)  { #Para cada i, solamente se ejecuta una de las 3 condiciones. UNA.
      if ( i == Valores_2Ns[1])  { #priemr valor 
        Probability <- pgamma(Valores_2Ns[1],j,1/k)
        Row <- c(Row,Probability)
      }else if (i==Valores_2Ns[length(Valores_2Ns)])  { #ultimo valor
        Probability <- (1 - pgamma(Valores_2Ns[a-1],j,1/k)) #valor anterior al ultimo
        Row <- c(Row,Probability)
      }else  { #resto de valores 
        Probability <- (pgamma(i,j,1/k) - pgamma(Valores_2Ns[a-1],j,1/k))
        Row <- c(Row,Probability)
      }
      a <- a + 1
    }
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

