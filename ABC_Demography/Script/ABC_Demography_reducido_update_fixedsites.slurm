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
module load gsl/1.15

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

echo "First prefersim run done"

#Names trees being generated for this run.
NombreArbol="../Data/ABCAnalysisPopExpansion/Output/trees/trees_ABCDemography_"${SLURM_ARRAY_TASK_ID}".txt"
rm $NombreArbol
touch $NombreArbol

#Only tracks/formats alleles dividing in each frequency value
for ValorFrecuencia in $(seq 0.005 0.005 0.995);
do
perl prefersim_additionals/GetList_2_update.pl $ValorFrecuencia $ValorFrecuencia ../Data/ABCAnalysisPopExpansion/Output/Output."$SLURM_ARRAY_TASK_ID".full_out.txt ../Data/ABCAnalysisPopExpansion/Output/Alleles_"$SLURM_ARRAY_TASK_ID"_"$ValorFrecuencia".txt
done

mkdir ../Data/ABCAnalysisPopExpansion/Output/Allele_"$SLURM_ARRAY_TASK_ID"_freqs
mv ../Data/ABCAnalysisPopExpansion/Output/Alleles_"$SLURM_ARRAY_TASK_ID"_0.* ../Data/ABCAnalysisPopExpansion/Output/Allele_"$SLURM_ARRAY_TASK_ID"_freqs/

#Quizas aqui cuando hago el cat, el orden importa...?
cat ../Data/ABCAnalysisPopExpansion/Output/Allele_"$SLURM_ARRAY_TASK_ID"_freqs/Alleles_"$SLURM_ARRAY_TASK_ID"_* > ../Data/ABCAnalysisPopExpansion/Output/Alleles_"$SLURM_ARRAY_TASK_ID"_full_freqs.txt
#Esto corta la segunda columna
sed 's/ .*//' ../Data/ABCAnalysisPopExpansion/Output/Alleles_"$SLURM_ARRAY_TASK_ID"_full_freqs.txt > ../Data/ABCAnalysisPopExpansion/Output/Alleles_"$SLURM_ARRAY_TASK_ID".txt

#Sorting step
sort -nr -o ../Data/ABCAnalysisPopExpansion/Output/Alleles_"$SLURM_ARRAY_TASK_ID".txt ../Data/ABCAnalysisPopExpansion/Output/Alleles_"$SLURM_ARRAY_TASK_ID".txt

### Second run of PReFerSim. This takes the list of allele IDs you want trajectories for  and re-runs PReFerSim.
GSL_RNG_SEED=$RANDOM_SEED GSL_RNG_TYPE=mrg /mnt/data/dortega/aizarraraz/PReFerSim-master/./PReFerSim "../Data/ABCAnalysisPopExpansion/ParameterFile_"$SLURM_ARRAY_TASK_ID"_B.txt" $SLURM_ARRAY_TASK_ID

#This generates output for the Traj file. 
mv ../Data/ABCAnalysisPopExpansion/Output/Traj_"$SLURM_ARRAY_TASK_ID".txt ../Data/ABCAnalysisPopExpansion/Output/Allele_"$SLURM_ARRAY_TASK_ID"_freqs/
#Breaks the Traj_ file into Traj_freq for each frequency value. 
python prefersim_additionals/traj_break.py $SLURM_ARRAY_TASK_ID

###################################################### Step 2) Transform the allele frequency trajectories

mkdir ../Data/ABCAnalysisPopExpansion/Output/trees/seed_"$SLURM_ARRAY_TASK_ID"/

for f in $(seq 0.005 0.005 0.995);
do

echo working of frequency ${f}

DerivedAlleleNumber=$(echo "($f * 200 + 0.5)/1" | bc)

CurrentTrajs="../Data/ABCAnalysisPopExpansion/Output/Allele_"$SLURM_ARRAY_TASK_ID"_freqs/ReducedTrajectories"$SLURM_ARRAY_TASK_ID"_"$f".txt" #Agregar identificador unico
ResampledTrajectory="../Data/ABCAnalysisPopExpansion/Output/Allele_"$SLURM_ARRAY_TASK_ID"_freqs/ResampledTrajs"$SLURM_ARRAY_TASK_ID"_"$f".txt"
TrajsMsselLike="../Data/ABCAnalysisPopExpansion/Output/Allele_"$SLURM_ARRAY_TASK_ID"_freqs/TrajMsselLike"$SLURM_ARRAY_TASK_ID"_"$f".txt"

#Ruta del archivo de demografia
LastPopSize=$( tail -n1 ../Data/ABCAnalysisPopExpansion/Output/DemographicHistory"$SLURM_ARRAY_TASK_ID".txt | awk '{print $1}' )

echo "Last pop size = "$LastPopSize

#This should be subfolder and looped for each freq.
AlleleCount=$( wc -l ../Data/ABCAnalysisPopExpansion/Output/Allele_"$SLURM_ARRAY_TASK_ID"_freqs/Alleles_${SLURM_ARRAY_TASK_ID}_"$f".txt | tail -n1 | awk '{print $1}' )
echo Se encontraron $AlleleCount alelos en el valor de frecuencia $DerivedAlleleNumber

if [ "$DerivedAlleleNumber" -eq 1 ]; then
    SingletonCount="$AlleleCount"
fi

Reps=$( ls ../Data/ABCAnalysisPopExpansion/Output/Allele_"$SLURM_ARRAY_TASK_ID"_freqs/Alleles_${SLURM_ARRAY_TASK_ID}_"$f".txt | wc -l )

#Solo tengo que imprimir los mismos dos valroes el numero de veces que hay alelos.
TimeFraction=$(head -n1 ../Data/ABCAnalysisPopExpansion/DemographyScales"$SLURM_ARRAY_TASK_ID".txt | awk '{print $1}')
PopFraction=$(head -n1 ../Data/ABCAnalysisPopExpansion/DemographyScales"$SLURM_ARRAY_TASK_ID".txt | awk '{print $2}')
Rho=1

RandFile="../Data/ABCAnalysisPopExpansion/DemographyScales"$SLURM_ARRAY_TASK_ID".txt"
rm $RandFile
touch $RandFile

if [ "$AlleleCount" -eq 0 ]; then
    Temp_TimeFraction="$TimeFraction"
    Temp_PopFraction="$PopFraction"
    String="$Temp_TimeFraction\t$Temp_PopFraction\n"
    echo -ne "$String" >> $RandFile
else
    for ((x=0; x<$AlleleCount; x++)); do
      String="$TimeFraction\t$PopFraction\n"
      echo -ne "$String" >> $RandFile
    done
fi

echo RandFile has this number of lines
wc -l "$RandFile" | awk '{print $1}'

echo popscales for this demography are $TimeFraction and $PopFraction
echo which are being used for $AlleleCount alleles

### This script creates the trajectory in a format that mssel3 likes.
perl prefersim_additionals/Traj_mssel_2.pl ../Data/ABCAnalysisPopExpansion/Output/Allele_"$SLURM_ARRAY_TASK_ID"_freqs/Traj_ $LastPopSize ../Data/ABCAnalysisPopExpansion/Output/Allele_"$SLURM_ARRAY_TASK_ID"_freqs/TrajMsselLike"$SLURM_ARRAY_TASK_ID"_"$f".txt $AlleleCount 0 $SLURM_ARRAY_TASK_ID $f #este ultimo realmente es $f
cat $TrajsMsselLike | /mnt/data/dortega/aizarraraz/Mssel./stepftn > $CurrentTrajs

###################################################### Step 3) Simulate trees based on the allele frequency trajectory

NombreArbol="trees_ABCDemography_"${SLURM_ARRAY_TASK_ID}".txt"
NombreArbolSub="trees_ABCDemography_"${SLURM_ARRAY_TASK_ID}"_${f}.txt"
rm ../Data/ABCAnalysisPopExpansion/Output/trees/seed_"$SLURM_ARRAY_TASK_ID"/$NombreArbolSub
rm ../Data/ABCAnalysisPopExpansion/Output/trees/seed_"$SLURM_ARRAY_TASK_ID"/$NombreArbol
#Recuerda resetear nombre arbol. meter semilla aleatorea a msel y leer de RandomNumberFile

ThingsToPrint="$(( $DerivedAlleleNumber + 1))"

#Hago subcarpeta por valor de frecuencia sino voy a llenar la carpeta trees. trees > Seed_"$SLURM_ARRAY_TASK_ID" >
/mnt/data/dortega/aizarraraz/Mssel./mssel3 $ThingsToPrint $AlleleCount 1 $DerivedAlleleNumber $CurrentTrajs 1 -r 0.0 2 -t 0.0 -eN 0.0 1.0 -eN tbs tbs -seeds $RandomNumber $RandomNumber $RandomNumber -T < $RandFile | grep '(' >> ../Data/ABCAnalysisPopExpansion/Output/trees/seed_"$SLURM_ARRAY_TASK_ID"/$NombreArbolSub

echo $NombreArbol done

#El archivo concatenado con todos los arboles de esa semilla van al directorio trees.
cat ../Data/ABCAnalysisPopExpansion/Output/trees/seed_"$SLURM_ARRAY_TASK_ID"/trees_ABCDemography_"${SLURM_ARRAY_TASK_ID}"_* > ../Data/ABCAnalysisPopExpansion/Output/trees/trees_ABCDemography_"${SLURM_ARRAY_TASK_ID}".txt

done

rm $RandFile
touch $RandFile

##Esto va al final del paso 2??
rm $MsselOut
rm $MsselFile
rm $ReducedTrajectories
rm $DemHistFile
rm $AlleleNumberFile
rm $RandomNumberFile
rm $ParameterFileB
rm $ParameterFile
rm $FullAlleles
rm $AlleleList

rm $CurTrajFile
rm $CurrentTrajs
rm $ResampledTrajectory
rm $TrajsMsselLike
rm $PassTrajFile
