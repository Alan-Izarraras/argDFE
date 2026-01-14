#!/bin/bash
#SBATCH --job-name=constantsize_inference_cien
#SBATCH --output=log/cien_inference_%a.o
#SBATCH --error=log/cien_inference_%a.e
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
