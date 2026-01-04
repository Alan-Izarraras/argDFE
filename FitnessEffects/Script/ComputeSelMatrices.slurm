#!/bin/bash
#SBATCH --job-name=Type2
#SBATCH --output=log/Type2_Matrix_rerun_%a.o
#SBATCH --error=log/Type2_Matrix_rerun_%a.e
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
#Rscript ComputeProbMatrices.R #Computes prob matrices
#Rscript ComputeFullMatrices.R
#Rscript MatrixRepair.R #Constructs set1 matrices with repetitions (random samplings) has case where tree file is empty for extreme selection runs.
Rscript Type_2_matrices.R

echo "scrpit finished running at"
echo $(date +%T)
