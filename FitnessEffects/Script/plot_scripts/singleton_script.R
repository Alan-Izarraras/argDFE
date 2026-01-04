#SCRIPT

input_dir <- "../../Data/trees/MatrixInputs/new_likelihood_experiment/second_run/set1/matrices/diezmil/type2/"
segregating_matrix <- matrix(nrow=27, ncol=50)

for (i in 24:27)  {
  for (a in 1:50)  {
    matriz <- read.csv(paste(input_dir, "observed_diezmil_type2_200x8_count_matrix_Sel", i, "_rep", a, ".csv", sep=""))
    dobleton <- matriz[197,1] 
    singleton <- matriz[198,1]
    print(paste("Valor de 2Ns =", i, "Tiene", dobleton, "dobletones +",singleton, sep=" "))
  }
}

