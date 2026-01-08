#!/bin/bash
#SBATCH --job-name=Simcheck_1
#SBATCH --output=log/simcheck_1_%a.o
#SBATCH --error=log/simcheck_1_%a.e
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