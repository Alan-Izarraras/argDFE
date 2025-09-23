#!/bin/bash
#SBATCH --job-name=fiex_matrix
#SBATCH --output=log/matrix_%a.o
#SBATCH --error=log/matrix_%a.e
#SBATCH --time=05:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --mem=4G

module load r/4.2.1

Rscript FixedMatrix.R
