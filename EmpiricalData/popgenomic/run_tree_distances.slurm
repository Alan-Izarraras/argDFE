#!/bin/bash
#SBATCH --job-name=tree_to_distances
#SBATCH --output=log/Relate_tree_to_distances_%A.o
#SBATCH --error=log/Relate_tree_to_distances_%A.e
#SBATCH --time=05:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --mem=4G

#Run using... sbatch -n script.name.slurm #Where n is the chromosome number. 
#Load py env. 

source /opt/apps/anaconda3/2025.06/etc/profile.d/conda.sh
conda activate Treeseq 

python Tree_distances_from_Relate.py

