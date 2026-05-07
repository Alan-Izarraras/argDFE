#!/bin/bash
#SBATCH --job-name=count_sfs_kim_under1
#SBATCH --output=log/matrix_sfs_kim_count_under1_%a.o
#SBATCH --error=log/matrix_sfs_kim_count_under1_%a.e
#SBATCH --time=08:00:00
#SBATCH --nodes=1 
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --mem=4G

module load r/4.2.1

echo "script started running at"
echo $(date +%T)

#Rscript rand_matrix_draw.R
#Rscript dfe_count_merge.R
Rscript dfe_sfs_matrix_randcountmerge.R
#Rscript dfe_sfs_matrix_randcountmerge_2.R.R
#Rscript mini_prob_sum.R 

echo "script finished running at"
echo $(date +%T)
