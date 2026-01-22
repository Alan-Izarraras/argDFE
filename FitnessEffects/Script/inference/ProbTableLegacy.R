#THis is the classic code, for a different number of selection values. 
UpperThreshold = 60
Limit = UpperThreshold + 2.5
Runs = 60/5 #what is this? why 5 though? 
RunsPlusTwo = Runs + 3
#5 es el intervalo de cada valor.
#### These two lists define the grid of the alpha and gamma parameters
AlphaGrid <- 0.02*1:10
GammaGrid <- 2*1:10

TwoNsValues <- 0:Runs * 5 + 2.5

Table <- matrix(ncol=RunsPlusTwo,nrow=0)

#Para cada valor Alfa, y para cada valor Gamma
#Para cada valor 2Ns .. si el valor 2Ns es 2.5 entonces la probabilidad es pgamma

for (j in AlphaGrid){
    for (k in GammaGrid){
		Probability <- 0
		Row <- c(j,k)
		for (i in TwoNsValues){
			
			if ( i == 2.5){ #da la probabilidad de que la variable sea menor o igual a esto
				Probability <- pgamma(2.5,j,1/k) #Toma el primer valor 2ns, con el primer alfa y con 1/gamma que esto es la forma
				Row <- c(Row,Probability) #la guardas. 
			}else if (i==Limit){ #el caso para el ultimo valor o el limite.
				Probability <- ( 1 - pgamma(i-5,j,1/k) ) #por que 5????
				Row <- c(Row,Probability)
			}else{
				Probability <-(pgamma(i,j,1/k) - pgamma(i-5,j,1/k))
				Row <- c(Row,Probability)
			}
			
		}
		Table <- rbind(Table,Row)
#print (Probability)
    }
}

colnames(Table) <- c("alpha", "gamma", "P(2Ns < 2.5)", "P(2.5 < 2Ns < 7.5)", "P(7.5 < 2Ns < 12.5)", "P(12.5 < 2Ns < 17.5)", "P(17.5 < 2Ns < 22.5)", "P(22.5 < 2Ns < 27.5)", "P(27.5 < 2Ns < 32.5)", "P(32.5 < 2Ns < 37.5)", "P(37.5 < 2Ns < 42.5)", "P(42.5 < 2Ns < 47.5)", "P(47.5 < 2Ns < 52.5)", "P(52.5 < 2Ns < 57.5)", "P( 2Ns > 57.5)")

write.table(Table,file="TableOfProbabilities.txt",row.names=FALSE,col.names=FALSE,sep="\t")

### Show that the probabilities are equal to 1
for (k in 1:100){
    print(sum(Table[k,3:15]))
}