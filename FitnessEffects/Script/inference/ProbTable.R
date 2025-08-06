##Perform integration aka Table of probabilities.

#Makes various distributions around the Kim et al (target) distribution
#Se tiene que calibrar el valor gamma conforme al tamaño poblacional..? o era conforme la muestra?
AlphaGrid <- 0.01*1:100 #(100 valores) (Kim)
GammaGrid <- 15*1:100 #(100 valores) (Kim)

vector2Ns_sup <- c(0.001333521,0.002371374,0.004216965,0.007498942,0.01333521,0.02371374,0.04216965,0.07498942,0.1333521,0.2371374,0.4216965,0.7498942,1.333521,2.371374,4.216965,7.498942,13.33521,23.71374,42.16965,74.98942,133.3521,237.1374,421.6965,749.8942,1333.521,2371.374)
vector2Ns_inf <- c(-0.001333521,0.001333521,0.002371374,0.004216965,0.007498942,0.01333521,0.02371374,0.04216965,0.07498942,0.1333521,0.2371374,0.4216965,0.7498942,1.333521,2.371374,4.216965,7.498942,13.33521,23.71374,42.16965,74.98942,133.3521,237.1374,421.6965,749.8942,1333.521)

Table <- matrix(ncol=28,nrow=0)  #Limite minimo, valores 2Ns, limite maximo

#Genera intervalos de probabilidad para distribuciones gamma
for (j in AlphaGrid)  {
  for (k in GammaGrid)  {
    Probability <- 0
    Row <- c(j,k)
    z <- 1
    for (i in vector2Ns_sup)  { #Para cada i, solamente se ejecuta una de las 3 condiciones. UNA.
      if ( i == 0.001333521)  {
        Probability <- pgamma(0.001333521,j,1/k)
        Row <- c(Row,Probability)
      }else if (i==2371.374)  {
        Probability <- (1 - pgamma(vector2Ns_inf[26],j,1/k))
        Row <- c(Row,Probability)
      }else  {
        Probability <- (pgamma(i,j,1/k) - pgamma(vector2Ns_inf[z],j,1/k))
        Row <- c(Row,Probability)
      }
      z <- z +1
    }
    Table <- rbind(Table,Row)
  }
}

write.csv(Table, "Table_of_probabilities.csv")
