#!/bin/bash
#SBATCH --job-name=Simcheck3
#SBATCH --output=log/simcheck3_%a.o
#SBATCH --error=log/simcheck3_%a.e
#SBATCH --time=10:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --mem=4G

output_set1="../Data/trees/MatrixInputs/ConstantSize/set1/"
output_set2="../Data/trees/MatrixInputs/ConstantSize/set2/" #no reps here
a=0
for ((f=1; f<=27; f+=1)) #270 en medio para todos los valores. pero esto es una prueba
do
  a=$((a + 1))
  for b in {1..50} #Controls the number of replicate files
  do #Aqui vale la pena usar variables para el nombre de archivos. 
    touch "../Data/trees/MatrixInputs/ConstantSize/set1/reps/cien/trees_Sel${a}_rep${b}.txt"
    touch "../Data/trees/MatrixInputs/ConstantSize/set1/reps/cien/singletons_Sel${a}_rep${b}.txt"

    nums_random=$((1 + $RANDOM % 200)) # generates 1 to 199

    # Apply correct zero-padding based on digit count
    if [ $nums_random -lt 10 ]; then
      nums_random=$(printf "%03d" $nums_random)  # 001 to 009
    elif [ $nums_random -lt 100 ]; then
      nums_random=$(printf "%03d" $nums_random)  # 010 to 099 (still 3 digits)
    else
	    nums_random=$(printf "%d" $nums_random)    # 100 to 199 (no padding)
    fi

    echo "muestreando archivo ${f}${nums_random}_Sel${a}"
    cat ../Data/trees/MatrixInputs/ConstantSize/set1/source_trees/yri_trees_MeanPosterior_${f}${nums_random}_Sel${a}.txt >> "${output_set1}/reps/cien/trees_Sel${a}_rep${b}.txt"
    cat ../Data/trees/MatrixInputs/ConstantSize/set1/source_trees/singletons_${f}${nums_random}_Sel${a}_ready.txt >> "${output_set1}/reps/cien/singletons_Sel${a}_rep${b}.txt"
    echo "archivo bootstrap$b armado"

    for i in {1..100} #Controls number of sampled files (modify depending on target theta) 1, 10 and 100 trees
    do
      nums_random=$((1 + $RANDOM % 200)) # generates 1 to 199

      # Apply correct zero-padding based on digit count
      if [ $nums_random -lt 10 ]; then
        nums_random=$(printf "%03d" $nums_random)  # 001 to 009
      elif [ $nums_random -lt 100 ]; then
        nums_random=$(printf "%03d" $nums_random)  # 010 to 099 (still 3 digits)
      else
        nums_random=$(printf "%d" $nums_random)    # 100 to 199 (no padding)
      fi

      echo "muestreando archivo ${f}${nums_random}_Sel${a}"
      cat ../Data/trees/MatrixInputs/ConstantSize/set1/source_trees/yri_trees_MeanPosterior_${f}${nums_random}_Sel${a}.txt >> "${output_set1}/reps/diezmil/trees_Sel${a}_rep${b}.txt"
      cat ../Data/trees/MatrixInputs/ConstantSize/set1/source_trees/singletons_${f}${nums_random}_Sel${a}_ready.txt >> "${output_set1}/reps/diezmil/singletons_Sel${a}_rep${b}.txt"
    done
    echo "archivo bootstrap$b armado"
    for i in {1..10} #Controls number of sampled files (modify depending on target theta) 1, 10 and 100 trees
    do
      nums_random=$((1 + $RANDOM % 200)) # generates 1 to 199

      # Apply correct zero-padding based on digit count
      if [ $nums_random -lt 10 ]; then
        nums_random=$(printf "%03d" $nums_random)  # 001 to 009
      elif [ $nums_random -lt 100 ]; then
        nums_random=$(printf "%03d" $nums_random)  # 010 to 099 (still 3 digits)
      else
        nums_random=$(printf "%d" $nums_random)    # 100 to 199 (no padding)
      fi

      echo "muestreando archivo ${f}${nums_random}_Sel${a}"
      cat ../Data/trees/MatrixInputs/ConstantSize/set1/source_trees/yri_trees_MeanPosterior_${f}${nums_random}_Sel${a}.txt >> "${output_set1}/reps/mil/trees_Sel${a}_rep${b}.txt"
      cat ../Data/trees/MatrixInputs/ConstantSize/set1/source_trees/singletons_${f}${nums_random}_Sel${a}_ready.txt >> "${output_set1}/reps/mil/singletons_Sel${a}_rep${b}.txt"
    done
    echo "archivo bootstrap$b armado"
  done
done

echo "Finished constructing ${b} independent replicates by sampling ${i} trees per replicate."
#this worked first try! good for me. 