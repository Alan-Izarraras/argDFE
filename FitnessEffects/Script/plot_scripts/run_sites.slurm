#!/bin/bash
#SBATCH --job-name=sites_plot
#SBATCH --output=sites_plot_set1.o
#SBATCH --error=sites_plot_set1.e
#SBATCH --time=08:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --mem=4G

module load r/4.2.1

#Rscript Segregating_mutations_set1.R
#Rscript singleton_script.R
#Rscript Segregating_mutations_per_gamma_set2_plot.R
Rscript Seg_sites_gamma_set1.R
