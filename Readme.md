#argDFE software documentation

###Description

argDFE is a simulation based DFE inference software that works with PReFerSim under the hood. Specifically, it makes use of simulating allele trajectories which are then transformed into bi-allelic trees using Mssel3 software. 

GitHub project (https://github.com/Alan-Izarraras/argDFE)

###Prerequisites

argDFE is originally meant to be run on SLURM managed compute cluster system but can be easily adapted for other cluster managing systems. 
PReFerSim is a C program that requires GSL to be installed and run (https://github.com/LohmuellerLab/PReFerSim) 
Instructions for installing PReFerSim can be found on the manual at the provided github adress


###Software and modules  needed:

- gsl/1.15
- r/4.2.1  
	- ape 
	- ggplot2 
- python3 
	- random
	- argparse
	- os
	- sys


#Compiling C programs

1) Clone argDFE from its github repository: https://github.com/Alan-Izarraras/argDFE/

2) Compile PReFerSim 

Run the following command inside prefersim folder: 


	gcc -g -o PReFerSim PReFerSim.c -lm -lgsl -lgslcblas -O3

	
Error: 

	/usr/bin/ld: cannot find -lgsl
	/usr/bin/ld: cannot find -lgslcblas
	collect2: error: ld returned 1 exit status

Diagnostic:

Cant find some dependencies in current gsl installation, but you can look for them and tell the system where they are. 

Workaround: 

	gcc -o PReFerSim PReFerSim.c $(pkg-config --cflags --libs gsl)

If you are having trouble getting PReFerSim installed consult the manual over at argDFE/PReFerSim-master/PReFerSim_Manual_v2.pdf

3) Compile Msel3

Run inside Mssel folder:
 
	cc -o mssel3  mssel3.c  streecsel.c  rand1.c -lm

4) Compile stepftn 

Need to check if this needs compilation or if executable already works


##Getting started

argDFE is divided in three modules. which can be used independetly from each other. 

- ABC_Demography
- FitnessEffects
- EmpiricalData 
 
###ABC_Demography 

Is an Approximate Bayesian Computation step to infer three parameter demographic models with priors that can be selected by the user. 
This module essentially samples demographic parameters from a prior distribution and computes a statistic derived from a coalescent matrix (number of lineages at different time points) which measures 
the difference from each simulated demography according to the random draw of the parameters and an observed coalescent matrix (e.g. The coalescent matrix for a set of synonymouse sites in the genome).
The observed matrix is meant to be generated using the EmpiricalData module from data from the 1k genomes project, using Relate to infer the ARG. 

This ABC approach benefits from extensively sampling from a prior. In practice we note than around 10,000 samplings (random seeds) of the prior are enough to yield good inferences of demography. 
Although this may depend on the dataset being used. 

After the simulations are done after your target number of sampling seeds, the results of the distance statistic are stored in 
	ABC_Demography/Data/Parameters/Output/DemoRun/DemographyReport.txt"
where each line on this file corresponds to an independent sampling of the prior according to a random seed. First column is PastSize, second column is PresentSize, third column is Generations, 4th column
is the distance statistic value and the 5th column is the random seed. 

From this textfile a demographic model can be derived along with plots to visualize the posterior distribution. 

to run this module use:

	sbatch -a 1-100 ABC_Demography.slurm --N_past "100 15000" --N_present "1000 50000" --Generations "100 15000"

where we make use of SLURM_ARRAY_TASK_ID to change random seeds and the value of each parameters are chosen as random picks from a provided min and max value as showin above. 

###FitnessEffects

###EmpiricalData

























How to run

sbatch -a 1-999 ABC_Demography_reducido_update_fixedsites.slurm
