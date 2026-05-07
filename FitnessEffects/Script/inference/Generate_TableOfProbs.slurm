#!/bin/bash
#SBATCH --job-name=kim_mil_under_0.01
#SBATCH --output=log/kim_dfe_mil_under_0.01_%a.o
#SBATCH --error=log/kim_dfe_mil_under_0.01_%a.e
#SBATCH --time=01:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --mem=4G

module load r/4.2.1

#Rscript ProbTable.R
#Rscript New_integration_method.R
#Rscript intgration_check.R 
#Rscript maximizer_oneshot.R
Rscript maximizer_randomstart.R
#Rscript maximizer_randomstart_sfs.R
#Rscript maximizer_randstart_lognorm.R
#Rscript maximizer_logrnom_v2.R
