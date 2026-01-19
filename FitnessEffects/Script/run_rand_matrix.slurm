#!/bin/bash
#SBATCH --job-name=matrix_reps
#SBATCH --output=log/matrix_reps_%a.o
#SBATCH --error=log/matrix_reps_%a.e
#SBATCH --time=08:00:00
#SBATCH --nodes=1 
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --mem=4G

module load r/4.2.1

echo "script started running at"
echo $(date +%T)

Rscript rand_matrix_draw.R

echo "script finished running at"
echo $(date +%T)