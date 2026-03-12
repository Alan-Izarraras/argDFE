#!/bin/bash
#SBATCH --job-name=kim_dfe
#SBATCH --output=log/kim_dfe_%a.o
#SBATCH --error=log/kim_dfe_%a.e
#SBATCH --time=01:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --mem=4G

module load r/4.2.1

#Rscript ProbTable.R
Rscript New_integration_method.R
#Rscript intgration_check.R 
