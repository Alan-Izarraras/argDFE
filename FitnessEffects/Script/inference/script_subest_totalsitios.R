#Make matrices with an "overestimated" and "underestimated" number of total sites (l)

prob_matrix_list <- list()

for (i in 1:27) { #a 27                                                                                                   #200x8_count_mil_kimDFE_Sel1.csv
  prob_matrix_list[[i]] <- read.csv(paste0("../../Data/trees/MatrixInputs/ConstantSize/set2/matrices/new_pseudocount/mil/200x8_count_mil_kimDFE_Sel", i, ".csv"))
  matriz <- prob_matrix_list[[i]]

  total_sitios <- sum(matriz[,1]) #numero total de sitios
  print(total_sitios)
  sitios_fijos <- matriz[200,1] #numero de sitios fijos
  sitios_variables <- total_sitios - sitios_fijos #numero de sitios variables 
  modificador <- (total_sitios * 0.001) / 100 #0.1%
  print(sitios_variables)
  print(modificador)
  sub_estimacion_total <- (total_sitios - modificador) - sitios_variables
  print(sub_estimacion_total)
  matriz[200,] <- sub_estimacion_total
  print(sum(matriz[,1]))
  write.csv(matriz, paste0("../../Data/trees/MatrixInputs/ConstantSize/set2/matrices/new_pseudocount/mil/target_size/under/200x8_count_mil_under_0.001_KimDFE_Sel", i, ".csv"), row.names = FALSE)
  sobre_estimacion_total <- (total_sitios + modificador) - sitios_variables
  print(sobre_estimacion_total)
  matriz[200,] <- sobre_estimacion_total
  print(sum(matriz[,1]))
  write.csv(matriz, paste0("../../Data/trees/MatrixInputs/ConstantSize/set2/matrices/new_pseudocount/mil/target_size/over/200x8_count_mil_over_0.001_KimDFE_Sel", i, ".csv"), row.names = FALSE)

}

