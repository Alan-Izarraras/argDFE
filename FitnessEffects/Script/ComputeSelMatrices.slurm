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

#Concatenate all independent runs into single tree and singleton file. 
cat ../Data/trees/Sel_${SLURM_ARRAY_TASK_ID}/yri_trees_MeanPosterior_* > ../Data/trees/MatrixInputs/trees_Sel${SLURM_ARRAY_TASK_ID}.txt
cat ../Data/trees/Sel_${SLURM_ARRAY_TASK_ID}/singletons_* > ../Data/trees/MatrixInputs/singletons_Sel${SLURM_ARRAY_TASK_ID}.txt 

Rscript ComputeSelMatrices.R $SLURM_ARRAY_TASK_ID

