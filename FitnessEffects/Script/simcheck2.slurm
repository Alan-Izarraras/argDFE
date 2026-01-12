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
# Condition to verify that there are no empty files
#Set1 trees
#if [ ${#missing_seeds[@]} -eq 0 ]; then
  #echo "no missing seeds"
  for s in {1..27}; do
    for i in {001..200}; do #set1
      mv "../Data/trees/Sel_${s}/yri_trees_MeanPosterior_${s}${i}_Sel${s}.txt" ../Data/trees/MatrixInputs/ConstantSize/set1/source_trees/
      mv "../Data/trees/Sel_${s}/singletons_${s}${i}_Sel${s}_ready.txt" ../Data/trees/MatrixInputs/ConstantSize/set1/source_trees/
    done
    #set2 trees
    for i in {201..300}; do #set2
      mv "../Data/trees/Sel_${s}/yri_trees_MeanPosterior_${s}${i}_Sel${s}.txt" ../Data/trees/MatrixInputs/ConstantSize/set2/source_trees/
      mv "../Data/trees/Sel_${s}/singletons_${s}${i}_Sel${s}_ready.txt" ../Data/trees/MatrixInputs/ConstantSize/set2/source_trees/
    done
  done

cat source trees moved to set2 directory: "../Data/trees/MatrixInputs/ConstantSize/set2/source_trees/"
#not found 27220
#ok when this bappens i should probably rerun that seed right? 
#bug why does it not exist... cuz even when sim fails it still creates the empty file. 
#wierd? 


#trees are now found at "../Data/trees/MatrixInputs/ConstantSize/set2/source_trees/"
