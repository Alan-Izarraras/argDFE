#!/bin/bash
#SBATCH --job-name=diezmil_rerun
#SBATCH --output=cuentas_diezmil_v2.o
#SBATCH --error=cuentas_diezmil_v2_%a.e
#SBATCH --time=08:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --mem=4G

module load r/4.2.1

#Rscript Segregating_mutations_set1.R
Rscript singleton_script.R
