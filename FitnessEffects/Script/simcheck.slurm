#!/bin/bash
#SBATCH --job-name=Simcheck
#SBATCH --output=log/simcheck_%a.o
#SBATCH --error=log/simcheck_%a.e
#SBATCH --time=10:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --mem=4G

###Script that checks and prints the tree and singleton files that are empty.

# 1) Checks file emptiness 
#check logfile for list of missing. 
#if empty non missing.
missing_seeds=()
for s in {1..27}; do
  for i in {001..300}; do
    file1="../Data/trees/Sel_${s}/yri_trees_MeanPosterior_${s}${i}_Sel${s}.txt"
    file2="../Data/trees/Sel_${s}/singletons_${s}${i}_Sel${s}_ready.txt"
    if [ ! -s "$file1" ] && [ ! -s "$file2" ]; then
      echo "'$file1' and '$file2' are empty"
      missing_seeds+=("${s}${i}")  #save this to a vector. 
    fi  
  done
done
 
# 2) If empty files, recover seed and construct command to rerun sim. 
for seed in "{missing_seeds[@]}"; do 
  echo "sbatch -a ${seed} argDFE_ConstantSize_SimulationTest.slurm 10000 1.29e-8 19379845 100" 
done

# 3) Move trees to desired folder 
# Condition to verify that there are no empty files
#Set1 trees
if [ ${#missing_seeds[@]} -eq 0 ]; then
  echo "no missing seeds"
  for s in {1..27}; do
  #set1 trees
    for i in {001..200}; do
      mv "../Data/trees/Sel_${s}/yri_trees_MeanPosterior_${s}${i}_Sel${s}.txt" ../Data/trees/MatrixInputs/MatrixInputs/ConstantSize/set1/source_trees/
      mv "../Data/trees/Sel_${s}/singletons_${s}${i}_Sel${s}_ready.txt" ../Data/trees/MatrixInputs/MatrixInputs/ConstantSize/set1/source_trees/
    done
    #set2 trees
    for i in {201..300}; do
      mv "../Data/trees/Sel_${s}/yri_trees_MeanPosterior_${s}${i}_Sel${s}.txt" ../Data/trees/MatrixInputs/ConstantSize/set2/source_trees/
      mv "../Data/trees/Sel_${s}/singletons_${s}${i}_Sel${s}_ready.txt" ../Data/trees/MatrixInputs/ConstantSize/set2/source_trees/
    done
  done
fi 

#4) Construct independent files of different sampling schemes (theta values)
###This might need a little tweak/testing and is probably widely inneficient.
### bueno me quede revisando las rutas de esto que cambie un poquito. 

output_set1="../Data/trees/MatrixInputs/ConstantSize/set1/source_trees/"
output_set2="../Data/trees/MatrixInputs/ConstantSize/set2/source_trees/" #no reps here
a=0
for ((f=1; f<=27; f+=1)) #270 en medio para todos los valores. pero esto es una prueba
do
  a=$((a + 1))
  for b in {1..50} #Controls the number of replicate files
  do #Aqui vale la pena usar variables para el nombre de archivos. 
    touch "../Data/trees/MatrixInputs/ConstantSize/set1/source_trees/reps/trees_Sel${a}_rep${b}.txt"
    touch "../Data/trees/MatrixInputs/ConstantSize/set1/source_trees/reps/singletons_Sel${a}_rep${b}.txt"

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
    cat ../Data/trees/Sel_${a}/yri_trees_MeanPosterior_${f}${nums_random}_Sel${a}.txt >> "${output_set1}/reps/cien/trees_Sel${a}_rep${b}.txt"
    cat ../Data/trees/Sel_${a}/singletons_${f}${nums_random}_Sel${a}_ready.txt >> "${output_set1}/reps/cien/singletons_Sel${a}_rep${b}.txt"
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
      cat yri_trees_MeanPosterior_${f}${nums_random}_Sel${a}.txt >> "reps/diezmil/trees_Sel${a}_rep${b}.txt"
      cat singletons_${f}${nums_random}_Sel${a}_ready.txt >> "reps/diezmil/singletons_Sel${a}_rep${b}.txt"
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
      cat yri_trees_MeanPosterior_${f}${nums_random}_Sel${a}.txt >> "reps/mil/trees_Sel${a}_rep${b}.txt"
      cat singletons_${f}${nums_random}_Sel${a}_ready.txt >> "reps/mil/singletons_Sel${a}_rep${b}.txt"
    done
    echo "archivo bootstrap$b armado"
  done
done

echo "Finished constructing ${b} independent replicates by sampling ${i} trees per replicate."

###Despues de esto sigue construir las matrices. 
###Agregar git ignore 
#pushear 