#!/bin/bash
#SBATCH --job-name=Simcheck_2
#SBATCH --output=log/simcheck_2_%a.o
#SBATCH --error=log/simcheck_2_%a.e
#SBATCH --time=10:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --mem=4G

# 3) Move trees to desired folder 
# Wait. This is only relevant if no reps are needed. So for set2 trees. 
# Condition to verify that therech  are no empty files
#Set1 trees
#if [ ${#missing_seeds[@]} -eq 0 ]; then
  #echo "no missing seeds"
for s in {1..27}; do
  for i in {201..300}; do #set2
    mv "../Data/trees/Sel_${s}/trees_${s}${i}_Sel${s}.txt" ../Data/trees/MatrixInputs/ConstantSize/set2/source_trees/
    mv "../Data/trees/Sel_${s}/singletons_${s}${i}_Sel${s}_ready.txt" ../Data/trees/MatrixInputs/ConstantSize/set2/source_trees/
  done
done
#ok si se movieron pero no se concatenaron.
cat source trees moved to set2 directory: "../Data/trees/MatrixInputs/ConstantSize/set2/source_trees/"

for s in {1..27}; do
  cat ../Data/trees/MatrixInputs/ConstantSize/set2/source_trees/trees_*_Sel${s}.txt > ../Data/trees/MatrixInputs/ConstantSize/set2/matrices/trees_Sel${s}.txt
  cat ../Data/trees/MatrixInputs/ConstantSize/set2/source_trees/singletons_*_Sel${s}_ready.txt > ../Data/trees/MatrixInputs/ConstantSize/set2/matrices/singletons_Sel${s}.txt
done

#todo bien, creo que vi otro error que no correspondia. 
