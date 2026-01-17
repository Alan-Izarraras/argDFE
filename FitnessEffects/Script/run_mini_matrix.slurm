#!/bin/bash
#SBATCH --job-name=mini_Sel20
#SBATCH --output=log/mini_matrix_Sel20.o
#SBATCH --error=log/mini_matrix_Sel20.e
#SBATCH --time=08:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --mem=4G

#sbatch -a 1-27 run_mini_matrix.slurm 

module load r/4.2.1

echo "scrpit started running at"
echo $(date +%T)

Rscript mini_CountMatrix_8t.R
Rscript mini_CountMatrix_40t.R
Rscript mini_CountMatrix_100t.R

echo "scrpit finished running at"
echo $(date +%T)
