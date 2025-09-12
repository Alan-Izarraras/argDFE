#!/bin/bash
#SBATCH --job-name=Ghist_SelectionRuns
#SBATCH --output=log/SelectionRuns_%A_%a.o
#SBATCH --error=log/SelectionRuns_%A_%a.e
#SBATCH --time=10:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --mem=4G

module load r/4.2.1
module load gsl/1.15

FullAlleles="../Data/Alleles_"$SLURM_ARRAY_TASK_ID".txt"
AlleleList="../Data/Traj_"$SLURM_ARRAY_TASK_ID".txt"
touch $FullAlleles
touch $AlleleList

RandomNumber=$SLURM_ARRAY_TASK_ID

##Passing command line arguments to python script
#Default ranges
DEFAULT_N_PAST_VALUE=20000
DEFAULT_MUTATION_RATE=1.2e-8
DEFAULT_TOTAL_SITES=1000000
DEFAULT_STEP_SIZE=100

#Read parameters from commandline.
N_PAST_VALUE=${1:-$DEFAULT_N_PAST_VALUE}
MUTATION_RATE=${2:-$DEFAULT_MUTATION_RATE}
TOTAL_SITES=${3:-$DEFAULT_TOTAL_SITES}
STEP_SIZE=${4:-$DEFAULT_STEP_SIZE}

#fix float numbers in bash
MUTATION_RATE=$(echo "$MUTATION_RATE" | awk '{print $1}')

python Selection_Parameters.py --n_past_value ${N_PAST_VALUE} --mutation_rate ${MUTATION_RATE} --total_sites ${TOTAL_SITES} --step_size ${STEP_SIZE}

SeedName=$(( $SLURM_ARRAY_TASK_ID % 100000 ))
ValorSeleccion=$(( $SLURM_ARRAY_TASK_ID / 1000 ))

#echo usando valor de selección "$ValorSeleccion"

echo La semilla aleatoria es ${SeedName}
echo Simulación de seleccion para dfe

RANDOM_SEED=${SLURM_ARRAY_TASK_ID}

### This is the default sample size in PReFerSim. You can change this value if you want with the option n in the parameter file before running PReFerSim.

Sample_size=200
DerivedAlleleNumber=1
ValorFrecuencia=1

# First run of PReFerSim. You must set the PrintSegSiteInfo parameter to 1 to produce an outfile
GSL_RNG_SEED=$RANDOM_SEED GSL_RNG_TYPE=mrg ../../PReFerSim-master/PReFerSim params/fixed/ParamFile_"$SLURM_ARRAY_TASK_ID".txt $SLURM_ARRAY_TASK_ID

#Hago una carpeta de resultados exclusivo para demografía.
NombreArbol="../Data/trees/yri_trees_MeanPosterior_"${SLURM_ARRAY_TASK_ID}".txt"
rm $NombreArbol
touch $NombreArbol

#Incorporo singletones en un solo script --> Que quiere decir todo estara en un mismo archivo output
for ValorFrecuencia in $(seq 0.005 0.005 0.995);
do

perl ../../prefersim_additionals/GetList_2_update.pl $ValorFrecuencia $ValorFrecuencia ../Data/Output."$SLURM_ARRAY_TASK_ID".full_out.txt ../Data/Alleles_"$SLURM_ARRAY_TASK_ID"_"$ValorFrecuencia".txt
#Modificado para escribir info de frecuencia en la segunda columna.

done

#Ahora tengo 199 archivos Alleles_sge_freq
mkdir ../Data/Allele_"$SLURM_ARRAY_TASK_ID"_freqs
mv ../Data/Alleles_"$SLURM_ARRAY_TASK_ID"_0.* ../Data/Allele_"$SLURM_ARRAY_TASK_ID"_freqs/

#Quizas aqui cuando hago el cat, el orden importa...?
cat ../Data/Allele_"$SLURM_ARRAY_TASK_ID"_freqs/Alleles_"$SLURM_ARRAY_TASK_ID"_* > ../Data/Alleles_"$SLURM_ARRAY_TASK_ID"_full_freqs.txt
#Esto corta la segunda columna
sed 's/ .*//' ../Data/Alleles_"$SLURM_ARRAY_TASK_ID"_full_freqs.txt > ../Data/Alleles_"$RandomNumber".txt

#Sorting step
sort -nr -o ../Data/Alleles_"$SLURM_ARRAY_TASK_ID".txt ../Data/Alleles_"$SLURM_ARRAY_TASK_ID".txt

# Second run of PReFerSim. This takes the list of allele IDs you want trajectories for  and re-runs PReFerSim.
GSL_RNG_SEED=$RANDOM_SEED GSL_RNG_TYPE=mrg ../../PReFerSim-master/PReFerSim params/fixed/ParamFile_B_"$SLURM_ARRAY_TASK_ID".txt $SLURM_ARRAY_TASK_ID

mv ../Data/Traj_"$RandomNumber".txt ../Data/Allele_"$RandomNumber"_freqs/

python traj_break_claude.py $RandomNumber
###################################################### Step 2) Transform the allele frequency trajectories

#I should have a way so that each Selection value goes on same folder.

mkdir ../Data/trees/Sel_"$ValorSeleccion"/ #So maybe reutilize this.

for f in $(seq 0.005 0.005 0.995);
do

echo working of frequency ${f}

DerivedAlleleNumber=$(echo "($f * 200 + 0.5)/1" | bc)

#Si quiero remover estos archivos intermedios tendré que guardar su ruta en variable y al final eliminar la variable.

#Hacer directorios nuevos para guardar estos outputs.
CurrentTrajs="../Data/Allele_"$SLURM_ARRAY_TASK_ID"_freqs/ReducedTrajectories"$SLURM_ARRAY_TASK_ID"_"$f".txt" #Agregar identificador unico
ResampledTrajectory="../Data/Allele_"$SLURM_ARRAY_TASK_ID"_freqs/ResampledTrajs"$SLURM_ARRAY_TASK_ID"_"$f".txt"
TrajsMsselLike="../Data/Allele_"$SLURM_ARRAY_TASK_ID"_freqs/TrajMsselLike"$SLURM_ARRAY_TASK_ID"_"$f".txt"

#Ruta del archivo de demografia --> MeanPosterior
LastPopSize=$( tail -n1 YRI_MeanPosteriorDemography.txt | awk '{print $1}' )

echo "Last pop size = "$LastPopSize

AlleleCount=$( wc -l ../Data/Allele_"$SLURM_ARRAY_TASK_ID"_freqs/Alleles_${SLURM_ARRAY_TASK_ID}_"$f".txt | tail -n1 | awk '{print $1}' )
echo Se encontraron $AlleleCount alelos en el valor de frecuencia $DerivedAlleleNumber

if [ "$DerivedAlleleNumber" -eq 1 ]; then
    SingletonCount="$AlleleCount"
fi

Reps=$( ls ../Data/Allele_"$SLURM_ARRAY_TASK_ID"_freqs/Alleles_${SLURM_ARRAY_TASK_ID}_"$f".txt | wc -l )


TimeFraction=$(head -n1 YRI_DemographyScales_MeanPosterior.txt | awk '{print $1}')
PopFraction=$(head -n1 YRI_DemographyScales_MeanPosterior.txt | awk '{print $2}')
Rho=1

RandFile="YRI_DemographyScales_MeanPosterior_"$SLURM_ARRAY_TASK_ID".txt"
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
perl ../../prefersim_additionals/Traj_mssel_2.pl ../Data/Allele_"$SLURM_ARRAY_TASK_ID"_freqs/Traj_ $LastPopSize ../Data/Allele_"$SLURM_ARRAY_TASK_ID"_freqs/TrajMsselLike"$SLURM_ARRAY_TASK_ID"_"$f".txt $AlleleCount 0 $SLURM_ARRAY_TASK_ID $f

### stepftn discretizes the allele frequency trajectories according to a set of frequency bounds defined in freqints.h .This helps to reduce the computing time. If you want to change this, change the bounds in freqints.h and
cat $TrajsMsselLike | ../../Mssel/stepftn > $CurrentTrajs

#Genera ReducedTrajectories

###################################################### Step 3) Simulate trees based on the allele frequency trajectory

NombreArbol="yri_trees_MeanPosterior_"${SLURM_ARRAY_TASK_ID}"_Sel"${ValorSeleccion}".txt"
NombreArbolSub="yri_trees_MeanPosterior_"${SLURM_ARRAY_TASK_ID}"_${f}.txt"
NombreIntermedio="yri_trees_MeanPosterior_"${SLURM_ARRAY_TASK_ID}"_0"
rm ../Data/trees/Sel_"$ValorSeleccion"/$NombreArbolSub
rm ../Data/trees/$NombreArbol

ThingsToPrint="$(( $DerivedAlleleNumber + 1))"

###adaptado
#tbs quiere decir to be seen y es una opcion que toma desde standar input entonces por eso la < para indicar que la variabl es stdinput.
#Esto debería estar masomenos bien, solo falta confirmar con el manual. Algo que podria estar mal es el orden de -T y RandomNumberFile.
../../Mssel/mssel3 $ThingsToPrint $AlleleCount 1 $DerivedAlleleNumber $CurrentTrajs 1 -r 0.0 2 -t 0.0 -eN 0.0 1.0 -eN tbs tbs -seeds $RandomNumber $RandomNumber $RandomNumber -T < $RandFile | grep '(' >> ../Data/trees/Sel_"$ValorSeleccion"/$NombreArbolSub

echo $NombreArbolSub done

done

cat ../Data/trees/Sel_"$ValorSeleccion"/yri_trees_MeanPosterior_"${SLURM_ARRAY_TASK_ID}"_* > ../Data/trees/yri_trees_MeanPosterior_"${SLURM_ARRAY_TASK_ID}"_Sel"$ValorSeleccion".txt

rm $RandFile

### Code for formating trees

echo we have $SingletonCount singletons in this demography run
echo splitting singletons from tree files and extracting distances . . .

#Make files
singleton_file="../Data/trees/singleton/singletons_"$SLURM_ARRAY_TASK_ID".txt"
archivo_temporal="../Data/trees/tmp_file_"$SLURM_ARRAY_TASK_ID".txt"

#Cut singletons only from treefile
head -n "$SingletonCount" "../Data/trees/"$NombreArbol"" > "$singleton_file"

# Remove the cut lines from the original file and save the remaining lines to a temporary file then rename to original
tail -n +$((SingletonCount + 1)) "../Data/trees/"$NombreArbol"" > "$archivo_temporal"
mv "$archivo_temporal" "../Data/trees/"$NombreArbol""

#Format Newick singletons to have distances only.
cut -d "," -f 1 "$singleton_file" | cut -b 1-3 --complement | sed 's/$/ 0/' > "../Data/trees/singleton/singletons_"$SLURM_ARRAY_TASK_ID"_Sel"$ValorSeleccion"_ready.txt"

#Esto lo está interpretando como guardarlo con el nombre "" y no en el directorio de ese nombre porque le falta la ruta...
mv "../Data/trees/singleton/singletons_"$SLURM_ARRAY_TASK_ID"_Sel"$ValorSeleccion"_ready.txt" "../Data/trees/Sel_${ValorSeleccion}/"
mv "../Data/trees/${NombreArbol}" "../Data/trees/Sel_${ValorSeleccion}/"

rm ../Data/trees/yri_trees*

echo "Files moved successfully to Sel_${ValorSeleccion}"
echo "Trees for selection value ${ValorSeleccion} done."
#todo bien.

#This might have bugs but lets test it out.

## Borrar archivos temporales
rm ../Data/Alleles_"$SLURM_ARRAY_TASK_ID"_full_freqs.txt
rm ../Data/Alleles_"$SLURM_ARRAY_TASK_ID"*
rm ../Data/Output."$SLURM_ARRAY_TASK_ID"*

rm ../Data/Allele_"$SLURM_ARRAY_TASK_ID"_freqs/Alleles_*
rm ../Data/Allele_"$SLURM_ARRAY_TASK_ID"_freqs/Reduced*
rm ../Data/Allele_"$SLURM_ARRAY_TASK_ID"_freqs/Traj*
rmdir ../Data/Allele_"$SLURM_ARRAY_TASK_ID"_freqs/
rm ../Data/trees/Sel_"$ValorSeleccion"/"$NombreIntermedio"*.txt 

#This should work. Try a random seed. sbatch -a 16001 scriptname.slurm 20000 1.4e-8 1000000 100
