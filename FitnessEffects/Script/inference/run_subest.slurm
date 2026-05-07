#!/bin/bash
#SBATCH --job-name=target_size_mil_0.001
#SBATCH --output=log/target_size_mil_0.001_%a.o
#SBATCH --error=log/target_size_mil_0.001_%a.e
#SBATCH --time=01:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --mem=4G

module load r/4.2.1

Rscript script_subest_totalsitios.R

