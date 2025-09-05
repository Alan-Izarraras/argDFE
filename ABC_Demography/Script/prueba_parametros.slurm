#!/bin/bash
#SBATCH --job-name=ABC_testrun
#SBATCH --output=log/prueba_parametros_%A_%a.o
#SBATCH --error=log/prueba_parametros_%A_%a.e
#SBATCH --time=05:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --mem=4G

#How to execute? 
# sbatch -a 1-10 prueba_parametros.slurm "100 30000" "100 15000" "100 15000" 1.3e-8 8000000 40
# This example takes values of N_past from 100 to 30k, N_present is 100 to 15k and gens are 100 to 15k. 
# So this may simulate bottlenecks and a few exapnsions. 
# Default run should be something exploratory like this to determin if expansion or bottleneck makes more sense. 

###Pass parameters for python script. 

#Default ranges 
DEFAULT_N_PAST_RANGE="1000 15000"
DEFAULT_N_PRESENT_RANGE="1000 50000"
DEFAULT_TIME_RANGE="100 15000"
DEFAULT_MUTATUIN_RATE=1.5e-8
DEFAULT_TOTAL_SITES=8000000
DEFAULT_STEP_SIZE=100

#Read parameters from commandline. 
N_PAST_RANGE=${1:-$DEFAULT_N_PAST_RANGE}
N_PRESENT_RANGE=${2:-$DEFAULT_N_PRESENT_RANGE}
TIME_RANGE=${3:-$DEFAULT_TIME_RANGE}
MUTATION_RATE=${4:-$DEFAULT_MUTATION_RATE}
TOTAL_SITES=${5:-$DEFAULT_TOTAL_SITES}
STEP_SIZE=${6:-$DEFAULT_STEP_SIZE}

# Basic validation: check if ranges have two values
for range in "$N_PAST_RANGE" "$N_PRESENT_RANGE" "$TIME_RANGE"; do
    if [[ ! $range =~ ^[0-9]+[[:space:]]+[0-9]+$ ]]; then
        echo "Error: Invalid range format '$range'. Expected two integers (e.g., '0 100')."
        exit 1
    fi
done

# Function to validate and convert scientific notation to a usable number
validate_scientific_notation() {
    local input=$1
    # Check if the input matches scientific notation (e.g., 1.5e-8, 2.3E+4)
    if ! echo "$input" | grep -Eq '^[+-]?[0-9]*\.[0-9]+[eE][+-]?[0-9]+$'; then
        echo "Error: MUTATION_RATE ('$input') is not in valid scientific notation (e.g., 1.5e-8)" >&2
        exit 1
    fi
    # Use bc to convert scientific notation to a decimal
    echo "$input" | bc -l
}

# Validate and parse MUTATION_RATE
MUTATION_RATE=$(validate_scientific_notation "$MUTATION_RATE")

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
python ABC_Parameters.py --n_past_range "$n_past_min $n_past_max" --n_present_range "$n_present_min $n_present_max" --time_range "$time_min $time_max" --mutation_rate 1.3e-8 --total_sites 1000000 --step_size 100
#Creo que solo debo asegurarme que el sistema lea slurmtaskid
#maybe like this. 

echo "Demography draw parameter files constructed"

LeftParametersFile="../Data/Parameters/DemographyData"$SLURM_ARRAY_TASK_ID".txt"
CurTrajFile="../Data/Parameters/Output/Traj_"$SLURM_ARRAY_TASK_ID".txt"
PassTrajFile="../Data/Parameters/Output/Traj_"$SLURM_ARRAY_TASK_ID"_"$TrajRepNumber".txt"
ParameterFile="../Data/Parameters/ParameterFile_"$SLURM_ARRAY_TASK_ID".txt"
ParameterFileB="../Data/Parameters/ParameterFile_"$SLURM_ARRAY_TASK_ID"_B.txt"
RandomNumberFile="../Data/Parameters/DemographyScales"$SLURM_ARRAY_TASK_ID".txt"

SeedName=$RandomNumber

echo Using random seed ${SeedName}
echo Comencing demographic simulaton under neutral selective conditions

RANDOM_SEED=${SeedName}

### Simulation conditions

Sample_size=200 #haploid genomes
DerivedAlleleNumber=1
ValorFrecuencia=1

# First run of PReFerSim. You must set the PrintSegSiteInfo parameter to 1 to produce an outfile
GSL_RNG_SEED=$RANDOM_SEED GSL_RNG_TYPE=mrg ../../PReFerSim-master/PReFerSim ../Data/Parameters/ParameterFile_"$SLURM_ARRAY_TASK_ID".txt $SLURM_ARRAY_TASK_ID

echo "First prefersim run done"

#Names trees being generated for this run.
NombreArbol="../Data/Parameters/Output/matrices/tree_dump/trees_ABCDemography_"${SLURM_ARRAY_TASK_ID}".txt"
mkdir -p $(dirname "$NombreArbol")
rm $NombreArbol
touch $NombreArbol

#Only tracks/formats alleles dividing in each frequency value
for ValorFrecuencia in $(seq 0.005 0.005 0.995);
do
perl ../../prefersim_additionals/GetList_2_update.pl $ValorFrecuencia $ValorFrecuencia ../Data/Parameters/Output/Output."$SLURM_ARRAY_TASK_ID".full_out.txt ../Data/Parameters/Output/Alleles_"$SLURM_ARRAY_TASK_ID"_"$ValorFrecuencia".txt
done

mkdir ../Data/Parameters/Output/Allele_"$SLURM_ARRAY_TASK_ID"_freqs
mv ../Data/Parameters/Output/Alleles_"$SLURM_ARRAY_TASK_ID"_0.* ../Data/Parameters/Output/Allele_"$SLURM_ARRAY_TASK_ID"_freqs/

cat ../Data/Parameters/Output/Allele_"$SLURM_ARRAY_TASK_ID"_freqs/Alleles_"$SLURM_ARRAY_TASK_ID"_* > ../Data/Parameters/Output/Alleles_"$SLURM_ARRAY_TASK_ID"_full_freqs.txt
sed 's/ .*//' ../Data/Parameters/Output/Alleles_"$SLURM_ARRAY_TASK_ID"_full_freqs.txt > ../Data/Parameters/Output/Alleles_"$SLURM_ARRAY_TASK_ID".txt

sort -nr -o ../Data/Parameters/Output/Alleles_"$SLURM_ARRAY_TASK_ID".txt ../Data/Parameters/Output/Alleles_"$SLURM_ARRAY_TASK_ID".txt

### Second run of PReFerSim. This takes the list of allele IDs you want trajectories for  and re-runs PReFerSim.
GSL_RNG_SEED=$RANDOM_SEED GSL_RNG_TYPE=mrg ../../PReFerSim-master/PReFerSim "../Data/Parameters/ParameterFile_"$SLURM_ARRAY_TASK_ID"_B.txt" $SLURM_ARRAY_TASK_ID

#This generates output for the Traj file.
mv ../Data/Parameters/Output/Traj_"$SLURM_ARRAY_TASK_ID".txt ../Data/Parameters/Output/Allele_"$SLURM_ARRAY_TASK_ID"_freqs/
#Breaks the Traj_ file into Traj_freq for each frequency value.
python ../../prefersim_additionals/traj_break.py $SLURM_ARRAY_TASK_ID

###################################################### Step 2) Transform the allele frequency trajectories

mkdir ../Data/Parameters/Output/matrices/tree_dump/seed_"$SLURM_ARRAY_TASK_ID"/

for f in $(seq 0.005 0.005 0.995);
do

#echo working of frequency ${f}

DerivedAlleleNumber=$(echo "($f * 200 + 0.5)/1" | bc)

CurrentTrajs="../Data/Parameters/Output/Allele_"$SLURM_ARRAY_TASK_ID"_freqs/ReducedTrajectories"$SLURM_ARRAY_TASK_ID"_"$f".txt" #Agregar identificador unico
ResampledTrajectory="../Data/Parameters/Output/Allele_"$SLURM_ARRAY_TASK_ID"_freqs/ResampledTrajs"$SLURM_ARRAY_TASK_ID"_"$f".txt"
TrajsMsselLike="../Data/Parameters/Output/Allele_"$SLURM_ARRAY_TASK_ID"_freqs/TrajMsselLike"$SLURM_ARRAY_TASK_ID"_"$f".txt"

#Ruta del archivo de demografia
LastPopSize=$( tail -n1 ../Data/Parameters/Output/DemographicHistory"$SLURM_ARRAY_TASK_ID".txt | awk '{print $1}' )

#echo "Last pop size = "$LastPopSize

AlleleCount=$( wc -l ../Data/Parameters/Output/Allele_"$SLURM_ARRAY_TASK_ID"_freqs/Alleles_${SLURM_ARRAY_TASK_ID}_"$f".txt | tail -n1 | awk '{print $1}' )
#echo Se encontraron $AlleleCount alelos en el valor de frecuencia $DerivedAlleleNumber

if [ "$DerivedAlleleNumber" -eq 1 ]; then
    SingletonCount="$AlleleCount"
fi

Reps=$( ls ../Data/Parameters/Output/Allele_"$SLURM_ARRAY_TASK_ID"_freqs/Alleles_${SLURM_ARRAY_TASK_ID}_"$f".txt | wc -l )

TimeFraction=$(head -n1 ../Data/Parameters/DemographyScales"$SLURM_ARRAY_TASK_ID".txt | awk '{print $1}')
PopFraction=$(head -n1 ../Data/Parameters/DemographyScales"$SLURM_ARRAY_TASK_ID".txt | awk '{print $2}')
Rho=1

RandFile="../Data/Parameters/DemographyScales"$SLURM_ARRAY_TASK_ID".txt"
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

#echo RandFile has this number of lines
#wc -l "$RandFile" | awk '{print $1}'
#echo popscales for this demography are $TimeFraction and $PopFraction
#echo which are being used for $AlleleCount alleles

### This script creates the trajectory in a format that mssel3 likes.
perl ../../prefersim_additionals/Traj_mssel_2.pl ../Data/Parameters/Output/Allele_"$SLURM_ARRAY_TASK_ID"_freqs/Traj_ $LastPopSize ../Data/Parameters/Output/Allele_"$SLURM_ARRAY_TASK_ID"_freqs/TrajMsselLike"$SLURM_ARRAY_TASK_ID"_"$f".txt $AlleleCount 0 $SLURM_ARRAY_TASK_ID $f #este ultimo realmente es $f
cat $TrajsMsselLike | ../../Mssel/stepftn > $CurrentTrajs

###################################################### Step 3) Simulate trees based on the allele frequency trajectory

NombreArbol="trees_ABCDemography_"${SLURM_ARRAY_TASK_ID}".txt"
NombreArbolSub="trees_ABCDemography_"${SLURM_ARRAY_TASK_ID}"_${f}.txt"
rm ../Data/Parameters/Output/matrices/tree_dump/seed_"$SLURM_ARRAY_TASK_ID"/$NombreArbolSub
rm ../Data/Parameters/Output/matrices/tree_dump/seed_"$SLURM_ARRAY_TASK_ID"/$NombreArbol

ThingsToPrint="$(( $DerivedAlleleNumber + 1))"

#Hago subcarpeta por valor de frecuencia sino voy a llenar la carpeta trees. trees > Seed_"$SLURM_ARRAY_TASK_ID" >
../../Mssel/mssel3 $ThingsToPrint $AlleleCount 1 $DerivedAlleleNumber $CurrentTrajs 1 -r 0.0 2 -t 0.0 -eN 0.0 1.0 -eN tbs tbs -seeds $RandomNumber $RandomNumber $RandomNumber -T < $RandFile | grep '(' >> ../Data/Parameters/Output/matrices/tree_dump/seed_"$SLURM_ARRAY_TASK_ID"/$NombreArbolSub

#echo $NombreArbol done

#El archivo concatenado con todos los arboles de esa semilla van al directorio trees.
cat ../Data/Parameters/Output/matrices/tree_dump/seed_"$SLURM_ARRAY_TASK_ID"/trees_ABCDemography_"${SLURM_ARRAY_TASK_ID}"_* > ../Data/Parameters/Output/matrices/tree_dump/trees_ABCDemography_"${SLURM_ARRAY_TASK_ID}".txt

done

rm $RandFile
touch $RandFile
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

### Paso 3: Generar matrices y comparar.
#Abrir arboles en R.

echo we have $SingletonCount singletons in this demography run
#echo splitting singletons from tree files and extracting distances . . .

# Genera el archivo singletones vacio y archivo temporal vacio
singleton_file="../Data/Parameters/Output/matrices/tree_dump/singletons_"$SLURM_ARRAY_TASK_ID".txt"
archivo_temporal="../Data/Parameters/Output/matrices/tree_dump/tmp_file_"$SLURM_ARRAY_TASK_ID".txt"

# Cut the desired number of lines from the original file and save them to the new file
head -n "$SingletonCount" "../Data/Parameters/Output/matrices/tree_dump/"$NombreArbol"" > "$singleton_file"

# Remove the cut lines from the original file and save the remaining lines to a temporary file
tail -n +$((SingletonCount + 1)) "../Data/Parameters/Output/matrices/tree_dump/"$NombreArbol"" > "$archivo_temporal"

# Replace the original file with the temporary file
mv "$archivo_temporal" "../Data/Parameters/Output/matrices/tree_dump/"$NombreArbol""

#Extract branch lengths from singletons
cut -d "," -f 1 "$singleton_file" | cut -b 1-3 --complement | sed 's/$/ 0/' > ../Data/Parameters/Output/matrices/tree_dump/singletons_"$SLURM_ARRAY_TASK_ID"_ready.txt

#Obtain present time from demografic history
PresentSize=$(awk 'NR==2 {print $1}' ../Data/Parameters/Output/DemographicHistory"$SLURM_ARRAY_TASK_ID".txt)
PastSize=$(awk 'NR==1 {print $1}' ../Data/Parameters/Output/DemographicHistory"$SLURM_ARRAY_TASK_ID".txt)

echo present size is $PresentSize and past size is $PastSize

#Gets demographic report for ABC stats comparison.
Rscript ../../prefersim_additionals/Matrix_Differences.R $SLURM_ARRAY_TASK_ID $PresentSize $PastSize

echo Demografic comparison for Random seed $SLURM_ARRAY_TASK_ID done
echo data written to report file "DemographyReport.txt"

rm $singleton_file
rm $archivo_temporal

rm ../Data/Parameters/Output/Alleles_"$SLURM_ARRAY_TASK_ID"_full_freqs.txt
rm ../Data/Parameters/Output/DemographicHistory"$SLURM_ARRAY_TASK_ID".txt
rm ../Data/Parameters/Output/Output."$SLURM_ARRAY_TASK_ID"*
rm ../Data/Parameters/Output/matrices/tree_dump/seed_"$SLURM_ARRAY_TASK_ID"/trees_*
rmdir ../Data/Parameters/Output/matrices/tree_dump/seed_"$SLURM_ARRAY_TASK_ID"/
rm ../Data/Parameters/Output/Allele_"$SLURM_ARRAY_TASK_ID"_freqs/Alleles_*
rm ../Data/Parameters/Output/Allele_"$SLURM_ARRAY_TASK_ID"_freqs/Reduced*
rm ../Data/Parameters/Output/Allele_"$SLURM_ARRAY_TASK_ID"_freqs/Traj*
rmdir ../Data/Parameters/Output/Allele_"$SLURM_ARRAY_TASK_ID"_freqs/
rm ../Data/Parameters/DemographyData"$SLURM_ARRAY_TASK_ID".txt


