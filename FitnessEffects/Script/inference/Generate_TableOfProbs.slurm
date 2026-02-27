#!/bin/bash
#SBATCH --job-name=integration_test
#SBATCH --output=log/new_dfe_test.o
#SBATCH --error=log/new_dfe_test.e
#SBATCH --time=01:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --mem=4G

module load r/4.2.1

#Rscript ProbTable.R
Rscript New_integration_method_v2.R
