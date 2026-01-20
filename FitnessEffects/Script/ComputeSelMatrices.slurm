#!/bin/bash
#SBATCH --job-name=set2_matrices_100t
#SBATCH --output=log/set2_matrices_100t_%a.o
#SBATCH --error=log/set2_matrices_100t_%a.e
#SBATCH --time=08:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --mem=4G

module load r/4.2.1

#Concatenate all independent runs into single tree and singleton file. 
#cat ../Data/trees/Sel_${SLURM_ARRAY_TASK_ID}/yri_trees_MeanPosterior_* > ../Data/trees/MatrixInputs/trees_Sel${SLURM_ARRAY_TASK_ID}.txt
#cat ../Data/trees/Sel_${SLURM_ARRAY_TASK_ID}/singletons_* > ../Data/trees/MatrixInputs/singletons_Sel${SLURM_ARRAY_TASK_ID}.txt 

echo "scrpit started running at"
echo $(date +%T)

#Rscript ComputeSelMatrices_NewExperiment.R
#Rscript ComputeSelMatrices_NewExperiment_reps.R
Rscript ComputeProbMatrices.R #Computes prob matrices
#Rscript ComputeFullMatrices.R
#Rscript CountMatrices.R

echo "scrpit finished running at"
echo $(date +%T)
