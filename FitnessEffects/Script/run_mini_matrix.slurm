#!/bin/bash
#SBATCH --job-name=mini_dfe
#SBATCH --output=log/mini_dfe_%a.o
#SBATCH --error=log/mini_dfe_%a.e
#SBATCH --time=08:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --mem=4G

module load r/4.2.1

echo "script started running at"
echo $(date +%T)

Rscript mini_CountMatrix_8t.R
Rscript mini_CountMatrix_40t.R
Rscript mini_CountMatrix_100t.R
#Rscript mini_prob_sum.R

echo "script finished running at"
echo $(date +%T)
