#!/bin/bash
#SBATCH --job-name=ABC_testrun
#SBATCH --output=log/ABC_testrun_stdout_%A_%a.o
#SBATCH --error=log/ABC_testrun_stderr_%A_%a.e
#SBATCH --time=05:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --mem=4G

module load r/4.2.1

###RandomNumber, SeedName and RANDOM_SEED are 3 variables with the same value. 

#Data can be replicated repeating the same seed
RandomNumber=$SLURM_ARRAY_TASK_ID

#Better directory name for "ABCAnalysisPopExpansion" could be "Parameters" but lets change that at the end. 
#Makes and restarts parameter files. 
Parameters="../Data/ABCAnalysisPopExpansion"$SLURM_ARRAY_TASK_ID".txt"
CurrentNumber=1

LeftParametersFile="../Data/ABCAnalysisPopExpansion/DemographyData"$SLURM_ARRAY_TASK_ID".txt"
rm $LeftParametersFile

FullAlleles="../Data/ABCAnalysisPopExpansion/Output/Alleles_"$SLURM_ARRAY_TASK_ID".txt"
AlleleList="../Data/ABCAnalysisPopExpansion/Output/Traj_"$SLURM_ARRAY_TASK_ID".txt"
rm $FullAlleles
rm $AlleleList

touch $FullAlleles
touch $AlleleList
AlleleNumber=0 

## Obtain parameter files
#Random seed is passed to py script
#Python script formats unique parameter file for random draw of parameter distribution
python ABC_RandomNumbers_update_fixedsites_stdpopsim.py $SLURM_ARRAY_TASK_ID

echo "Demography draw parameter files constructed"
#lets keep going with the rest of the script. 

LeftParametersFile="../Data/ABCAnalysisPopExpansion/DemographyData"$SLURM_ARRAY_TASK_ID".txt"
CurTrajFile="../Data/ABCAnalysisPopExpansion/Output/Traj_"$SLURM_ARRAY_TASK_ID".txt"
PassTrajFile="../Data/ABCAnalysisPopExpansion/Output/Traj_"$SLURM_ARRAY_TASK_ID"_"$TrajRepNumber".txt"
ParameterFile="../Data/ABCAnalysisPopExpansion/ParameterFile_"$SLURM_ARRAY_TASK_ID".txt"
ParameterFileB="../Data/ABCAnalysisPopExpansion/ParameterFile_"$SLURM_ARRAY_TASK_ID"_B.txt"
RandomNumberFile="../Data/ABCAnalysisPopExpansion/DemographyScales"$SLURM_ARRAY_TASK_ID".txt"
MsselOut="../Data/ABCAnalysisPopExpansion/Output/MsselOut"$SLURM_ARRAY_TASK_ID".txt"

SeedName=$RandomNumber

echo Using random seed ${SeedName}
echo Comencing demographic simulaton under neutral selective conditions

RANDOM_SEED=${SeedName}

### Simulation conditions

Sample_size=200 #haploid genomes
DerivedAlleleNumber=1
ValorFrecuencia=1

# First run of PReFerSim. You must set the PrintSegSiteInfo parameter to 1 to produce an outfile

GSL_RNG_SEED=$RANDOM_SEED GSL_RNG_TYPE=mrg /mnt/data/dortega/aizarraraz/PReFerSim-master/./PReFerSim ../Data/ABCAnalysisPopExpansion/ParameterFile_"$SLURM_ARRAY_TASK_ID".txt $SLURM_ARRAY_TASK_ID

echo "if you see this prefersim worked?"

##test uptil here. See if PReFerSim runs in new env. 

