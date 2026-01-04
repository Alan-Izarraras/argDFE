#!/bin/bash
#SBATCH --job-name=vep_run
#SBATCH --output=log/vep_run_%A.o
#SBATCH --error=log/vep_run_%A.e
#SBATCH --time=05:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --mem=4G

module load vep/r106.1

vep -i /mnt/data/dortega/aizarraraz/DatosEmpiricos/chr22_YRI.recode.vcf --cache --dir_cache /mnt/data/Archives/vep/106/37 --assembly GRCh37

###Aqui para el caso no-sinonimo tambien tengo que incluir las cosnecuencias: inframe insertion + inframe deletion + protein_altering_variant + stop_gained + frameshift + stop_lost + start_lost
#En el caso sinonimo me parece que estoy bien.

#sed -n /missense_variant/p chr${SGE_TASK_ID}.cons.txt > chr${SGE_TASK_ID}.no_sinonimo.txt

#grep -E 'missense_variant|frameshift_variant|stop_gained|inframe_insertion|inframe_deletion|protein_altering_variant|frameshift|stop_lost|start_lost' chr${SGE_TASK_ID}.cons.txt > chr${SGE_TASK_ID}.no_sinonimo.txt

#sed -n /synonymous_variant/p chr${SGE_TASK_ID}.cons.txt > chr${SGE_TASK_ID}.sinonimo.txt

#Esto borra las entradas repetidas

#sort -u -k1,1 chr${SGE_TASK_ID}.no_sinonimo.txt > chr${SGE_TASK_ID}.no_sinonimo.uniq.txt
#sort -u -k1,1 chr${SGE_TASK_ID}.sinonimo.txt > chr${SGE_TASK_ID}.sinonimo.uniq.txt

#Esto me deja con la columna de coordenadas

#cut -f1 chr${SGE_TASK_ID}.no_sinonimo.uniq.txt > chr${SGE_TASK_ID}.no_sinonimo.coords.txt
#cut -f1 chr${SGE_TASK_ID}.sinonimo.uniq.txt > chr${SGE_TASK_ID}.sinonimo.coords.txt

#Esto quita el 4:  hmmm que tal que eso es info importante..?

#sed 's/[0-9]*://g' chr${SGE_TASK_ID}.no_sinonimo.coords.txt > chr${SGE_TASK_ID}.no_sinonimo.coords2.txt
#sed 's/[0-9]*://g' chr${SGE_TASK_ID}.sinonimo.coords.txt > chr${SGE_TASK_ID}.sinonimo.coords2.txt

#Elimina caso en que la coordenada tiene un dash.

#sed 's/-[0-9]\+//g' chr${SGE_TASK_ID}.no_sinonimo.coords2.txt > chr${SGE_TASK_ID}.no_sinonimo.coords3.txt
#sed 's/-[0-9]\+//g' chr${SGE_TASK_ID}.sinonimo.coords2.txt > chr${SGE_TASK_ID}.sinonimo.coords3.txt

#Sortea de menor a mayor
#sort -n chr${SGE_TASK_ID}.no_sinonimo.coords3.txt > chr${SGE_TASK_ID}.no_sinonimo.ready.txt
#sort -n chr${SGE_TASK_ID}.sinonimo.coords3.txt > chr${SGE_TASK_ID}.sinonimo.ready.txt
