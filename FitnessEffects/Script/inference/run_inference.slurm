#!/bin/bash
#SBATCH --job-name=dfe_inference
#SBATCH --output=log/dfe_inference_%a.o
#SBATCH --error=log/dfe_inference_%a.e
#SBATCH --time=01:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --mem=4G

module load r/4.2.1

#Rscript GammaDistributions.R

echo integration complete! Proceeding with likelihood inferece.

Rscript likelihood_dfe_inference.R

echo likelihood inference complete. Data saved.
