#!/bin/bash
#SBATCH --job-name=plots
#SBATCH --output=plots.o
#SBATCH --error=plots.e
#SBATCH --time=08:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --mem=4G

module load r/4.2.1


#Rscript Discrete_inference_Fig2_main.R
Rscript Discrete_inference_SuppFig3.R
Rscript Discrete_inference_SuppFig6.R
#Rscript Discrete_inference_SuppFig1.R
#Rscript Discrete_inference_SuppFig4.R
#Rscript Discrete_inference_SuppFig2.R
Rscript Discrete_inference_SuppFig5.R
