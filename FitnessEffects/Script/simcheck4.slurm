#!/bin/bash
#SBATCH --job-name=Simcheck4
#SBATCH --output=log/simcheck4_%a.o
#SBATCH --error=log/simcheck4_%a.e
#SBATCH --time=10:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --mem=4G

###Concatenate set2 tree files for matrix construct. 
for s in {1..27}; do
  cat ../Data/trees/MatrixInputs/ConstantSize/set2/source_trees/yri_trees_MeanPosterior_*_Sel${s}.txt > ../Data/trees/MatrixInputs/ConstantSize/set2/matrices/trees_Sel${s}.txt
  cat ../Data/trees/MatrixInputs/ConstantSize/set2/source_trees/singletons_*_Sel${s}_ready.txt > ../Data/trees/MatrixInputs/ConstantSize/set2/matrices/singletons_Sel${s}.txt
done

#Run matrix cosntruct. 