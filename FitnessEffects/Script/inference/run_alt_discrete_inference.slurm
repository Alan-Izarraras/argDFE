#!/bin/bash
#SBATCH --job-name=discrete_inference_mil
#SBATCH --output=log/mil_inference_%a.o
#SBATCH --error=log/mil_inference_%a.e
#SBATCH --time=08:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --mem=4G

module load r/4.2.1

#Rscript ml_variation_inference.R
Rscript ml_variation_inference_reps.R
Rscript ml_variation_inference_sfs.R
#Rscript MissingMatricesFinder.R
