argDFE software documentation
(Readme.md file)

Description

argDFE works with PReFerSim, inside the hood. Specifically, it makes use of simulating allele trajectories, which are then transformed into bi allelic trees using msel3 software. GitHub project (https://github.com/Alan-Izarraras/argDFE)

Modules/software needed:
gsl/1.15
r/4.2.1  → Necesariamente hay que descargar los paquetes en Fenix, localmente 
ape 
ggplot2


Prerequisites

Download PReFerSim: Unzip + compile to get executable. 

Run inside PReFerSim folder: “gcc -g -o PReFerSim PReFerSim.c -lm -lgsl -lgslcblas -O3”
	
Error: 

	/usr/bin/ld: cannot find -lgsl
/usr/bin/ld: cannot find -lgslcblas
collect2: error: ld returned 1 exit status

Diagnostic:

Cant find some dependencies in current gsl installation, but you can look for them and tell the system where they are. 

Workaround: 

	gcc -o PReFerSim PReFerSim.c $(pkg-config --cflags --libs gsl)


Ya doy el ejecutable en la descarga 

Download Msel3 for converting PReFerSim trajectories into trees. 

Run inside Mssel folder: “cc -o mssel3  mssel3.c  streecsel.c  rand1.c -lm” 

Ya doy el ejecutable en la descarga 

How to run

sbatch -a 1-999 ABC_Demography_reducido_update_fixedsites.slurm
