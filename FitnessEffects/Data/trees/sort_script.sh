for s in {1..27}; do
  for i in {201..300}; do
    mv "Sel_${s}/yri_trees_MeanPosterior_${s}${i}_Sel${s}.txt" MatrixInputs/new_likelihood_experiment/second_run/set2
    mv "Sel_${s}/singletons_${s}${i}_Sel${s}_ready.txt" MatrixInputs/new_likelihood_experiment/second_run/set2
  done
done
