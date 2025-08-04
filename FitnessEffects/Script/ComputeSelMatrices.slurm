#!/bin/bash
#SBATCH --job-name=Matrix_Conversion
#SBATCH --output=log/MatrixConversion_%A_%a.o
#SBATCH --error=log/MatrixConversion_%A_%a.e
#SBATCH --time=05:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --mem=4G

module load r/4.2.1

SelectionValue=$(( $SLURM_ARRAY_TASK_ID / 1000 ))

#Concatenate all independent runs into single tree and singleton file. 
cat ../Data/trees/Sel_${SelectionValue}/yri_trees_MeanPosterior_* > ../Data/trees/MatrixInputs/trees_Sel${SelectionValue}.txt
cat ../Data/trees/Sel_${SelectionValue}/singletons_* > ../Data/trees/MatrixInputs/singletons_Sel${SelectionValue}.txt 

Rscript ComputeSelMatrices.R $SLURM_ARRAY_TASK_ID





