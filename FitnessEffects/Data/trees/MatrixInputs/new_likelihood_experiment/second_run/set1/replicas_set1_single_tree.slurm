#!/bin/bash
#SBATCH --job-name=single
#SBATCH --output=reps_%a.o
#SBATCH --error=reps_%a.e
#SBATCH --time=08:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --mem=1G

a=0
for ((f=1; f<=27; f+=1)) #270 en medio para todos los valores. pero esto es una prueba
do
  a=$((a + 1))
  for b in {1..50} #numero de replicas distintas que queires hacer, 50
  do
    touch "reps/trees_Sel${a}_rep${b}.txt"
    touch "reps/singletons_Sel${a}_rep${b}.txt"

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
      cat yri_trees_MeanPosterior_${f}${nums_random}_Sel${a}.txt >> "reps/cien/trees_Sel${a}_rep${b}.txt"
      cat singletons_${f}${nums_random}_Sel${a}_ready.txt >> "reps/cien/singletons_Sel${a}_rep${b}.txt"
      echo "archivo bootstrap$b armado"

  done
done

echo "Finished constructing ${b} independent replicates by sampling 1 trees per replicate."
