#!/bin/bash
#SBATCH --job-name=distances_to_matrix
#SBATCH --output=log/distance_to_matrix_%A.o
#SBATCH --error=log/distance_to_matrix_%A.e
#SBATCH --time=05:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --mem=4G

module load r/4.2.1

Rscript Distance_to_matrix.R $SLURM_ARRAY_TASK_ID


