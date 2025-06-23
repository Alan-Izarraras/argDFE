#!/bin/bash
#SBATCH --job-name=ABC_testrun      
#SBATCH --output=/mnt/data/dortega/aizarraraz/job_output_monitor/ABC_testrun_stdout_%j.txt      
#SBATCH --error=ABC_testrun_stderr_%j.txt         
#SBATCH --time=05:00:00              
#SBATCH --nodes=1                    
#SBATCH --ntasks=1                   
#SBATCH --cpus-per-task=4            
#SBATCH --mem=4G                     
#SBATCH --mail-user=alanizarraras3@gmail.com # Email address
#SBATCH --mail-type=END,FAIL         

module load r/4.2.1

RandomNumber=$SLURM_ARRAY_TASK_ID

#Necesito crear nueva estructura de directorios. 

Parameters="../Data/ABCAnalysisPopExpansion"$SLURM_ARRAY_TASK_ID".txt"
CurrentNumber=1

#Horrible varaible name. Must
LeftParametersFile="../Data/ABCAnalysisPopExpansion/DemographyData"$SLURM_ARRAY_TASK_ID".txt"
#Esto es para volver a escribirlo al paralelizar.
rm $LeftParametersFile

FullAlleles="../Data/ABCAnalysisPopExpansion/Output/Alleles_"$SLURM_ARRAY_TASK_ID".txt"
AlleleList="../Data/ABCAnalysisPopExpansion/Output/Traj_"$SLURM_ARRAY_TASK_ID".txt"
rm $FullAlleles
rm $AlleleList

touch $FullAlleles
touch $AlleleList
AlleleNumber=0 #Cuidado con este

## Obtain parameter files
#Esto corre con argumentos para poner la semilla aleatoria.

python ABC_RandomNumbers_update_fixedsites_stdpopsim.py $SLURM_ARRAY_TASK_ID


###Probar correr hasta aqui? 


echo seeds used for python RandomNumbers are $SLURM_ARRAY_TASK_ID and $RandomNumber

#Cada que corre, el output es el mismo.?

#Deberia tener (LeftParams, Demogrfia, ParamFiles, )

LeftParametersFile="../Results/ABCAnalysisPopExpansion/DemographyData"$SLURM_ARRAY_TASK_ID".txt"
CurTrajFile="../Results/ABCAnalysisPopExpansion/Output/Traj_"$SLURM_ARRAY_TASK_ID".txt"
PassTrajFile="../Results/ABCAnalysisPopExpansion/Output/Traj_"$SLURM_ARRAY_TASK_ID"_"$TrajRepNumber".txt"

ParameterFile="../Results/ABCAnalysisPopExpansion/ParameterFile_"$SLURM_ARRAY_TASK_ID".txt"
ParameterFileB="../Results/ABCAnalysisPopExpansion/ParameterFile_"$SLURM_ARRAY_TASK_ID"_B.txt"
###Esto de aqui es la lista de valores tbs que toma msel
RandomNumberFile="../Results/ABCAnalysisPopExpansion/DemographyScales"$SLURM_ARRAY_TASK_ID".txt"

###
MsselOut="../Results/ABCAnalysisPopExpansion/Output/MsselOut"$SLURM_ARRAY_TASK_ID".txt"

#Creo que eso ya no es necesario..? Igual no debería romper nada
SeedName=$SLURM_ARRAY_TASK_ID

echo La semilla aleatoria es ${SeedName}
echo Simulación neutral para demografía

# Set the number of the random seed.

RANDOM_SEED=${SeedName}

### pending more code 
