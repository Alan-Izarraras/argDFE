#!/bin/bash
#SBATCH --job-name=ABC_testrun
#SBATCH --output=log/prueba_parametros_%A_%a.o
#SBATCH --error=log/prueba_parametros_%A_%a.e
#SBATCH --time=05:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --mem=4G

###Pass parameters for python script. 

#Default ranges 
DEFAULT_N_PAST_RANGE="1000 15000"
DEFAULT_N_PRESENT_RANGE="1000 50000"
DEFAULT_TIME_RANGE="100 15000"

#Read parameters from commandline. 
N_PAST_RANGE=${1:-$DEFAULT_N_PAST_RANGE}
N_PRESENT_RANGE=${2:-$DEFAULT_N_PRESENT_RANGE}
TIME_RANGE=${3:-$DEFAULT_TIME_RANGE}

# Basic validation: check if ranges have two values
for range in "$N_PAST_RANGE" "$N_PRESENT_RANGE" "$TIME_RANGE"; do
    if [[ ! $range =~ ^[0-9]+[[:space:]]+[0-9]+$ ]]; then
        echo "Error: Invalid range format '$range'. Expected two integers (e.g., '0 100')."
        exit 1
    fi
done

# Extract min and max for validation
read n_past_min n_past_max <<< "$N_PAST_RANGE"
read n_present_min n_present_max <<< "$N_PRESENT_RANGE"
read time_min time_max <<< "$TIME_RANGE"

module load r/4.2.1
module load gsl/1.15

###RandomNumber, SeedName and RANDOM_SEED are 3 variables with the same value.

#Data can be replicated repeating the same seed
RandomNumber=$SLURM_ARRAY_TASK_ID

#Better directory name for "ABCAnalysisPopExpansion" could be "Parameters" but lets change that at the end.
#Makes and restarts parameter files.
Parameters="../Data/Parameters"$SLURM_ARRAY_TASK_ID".txt"
CurrentNumber=1

LeftParametersFile="../Data/Parameters/DemographyData"$SLURM_ARRAY_TASK_ID".txt"
rm $LeftParametersFile

FullAlleles="../Data/Parameters/Output/Alleles_"$SLURM_ARRAY_TASK_ID".txt"
AlleleList="../Data/Parameters/Output/Traj_"$SLURM_ARRAY_TASK_ID".txt"
rm $FullAlleles
rm $AlleleList

touch $FullAlleles
touch $AlleleList
AlleleNumber=0

## Obtain parameter files
#Python script formats unique parameter file for random draw of parameter distribution
python ABC_Parameters.py --n_past_range "$n_past_min $n_past_max" --n_present_range "$n_present_min $n_present_max" --time_range "$time_min $time_max"
#Creo que solo debo asegurarme que el sistema lea slurmtaskid
#maybe like this. 


