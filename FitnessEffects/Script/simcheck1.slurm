#!/bin/bash
#SBATCH --job-name=Simcheck_1
#SBATCH --output=log/simcheck_1.o
#SBATCH --error=log/simcheck_1.e
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
    file1="../Data/trees/Sel_${s}/trees_${s}${i}_Sel${s}.txt"
    file2="../Data/trees/Sel_${s}/singletons_${s}${i}_Sel${s}_ready.txt"
    if [ ! -s "$file1" ] && [ ! -s "$file2" ]; then
      #echo "'$file1' and '$file2' are empty"
      missing_seeds+=("${s}${i}")  #save this to a vector. 
    fi  
  done
done

echo list of missing simulations: 
 
# 2) If empty files, recover seed and construct command to rerun sim. 
#this did not work.
#kinda verbose but works. maybe having the seeds only would be better? nah. 
for seed in "${missing_seeds[@]}"; do
    echo "${seed}"
done

for s in {1..27}; do 
  ls -l Sel_${s}/trees_${s}{001..300}_Sel${s}.txt | wc
done
#so here, this process has to be done like 2 or 3 times... would it be good to automate? 
#this means directly running leftover sims. 

echo "sbatch -a argDFE_ConstantSize_SimulationTest.slurm 1.29e-8 19379845 100"