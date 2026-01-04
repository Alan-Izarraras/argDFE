#!/bin/bash
#SBATCH --job-name=Prob_matrix_raras
#SBATCH --output=log/MatrixConversion_raras_%a.o
#SBATCH --error=log/MatrixConversion_raras_%a.e
#SBATCH --time=08:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --mem=1G

module load r/4.2.1

echo "scrpit started running at"
echo $(date +%T)

Rscript ComputeProbMatrices_raros.R 

echo "scrpit finished at"
echo $(date +%T)