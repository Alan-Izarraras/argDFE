#!/bin/bash
#SBATCH --job-name=count_merge
#SBATCH --output=log/matrix_count_merge_%a.o
#SBATCH --error=log/matrix_count_merge_%a.e
#SBATCH --time=08:00:00
#SBATCH --nodes=1 
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --mem=4G

module load r/4.2.1

echo "script started running at"
echo $(date +%T)

#Rscript rand_matrix_draw.R
Rscript dfe_count_merge.R
#Rscript mini_prob_sum.R 

echo "script finished running at"
echo $(date +%T)
