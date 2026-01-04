#!/bin/bash
#SBATCH --job-name=check
#SBATCH --output=check_%a.o
#SBATCH --error=check_%a.e
#SBATCH --time=08:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --mem=1G

for a in {1..27}; do
    echo "Sel${a}"
    awk 'END{print NR}' trees_Sel${a}.txt singletons_Sel${a}.txt
done
