#!/bin/bash
#SBATCH --job-name=ProbTable
#SBATCH --output=log/ProbTable_%a.o
#SBATCH --error=log/ProbTable_%a.e
#SBATCH --time=01:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --mem=4G

module load r/4.2.1

Rscript ProbTable.R
