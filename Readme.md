# argDFE software documentation

### Description

argDFE is a simulation based DFE inference software that works with PReFerSim under the hood. Specifically, it makes use of simulating allele trajectories which are then transformed into bi-allelic trees using Mssel3 software. 

GitHub project (https://github.com/Alan-Izarraras/argDFE)

### Prerequisites

argDFE is originally meant to be run on SLURM managed compute cluster system but can be easily adapted for other cluster managing systems. 
PReFerSim is a C program that requires GSL to be installed and run (https://github.com/LohmuellerLab/PReFerSim) 
Instructions for installing PReFerSim can be found on the manual at the provided github adress


### Software and modules  needed:

- gsl/1.15
- r/4.2.1  
	- ape 
	- ggplot2 
- python3 
	- random
	- argparse
	- os
	- sys


# Compiling C programs

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


## Getting started

argDFE is divided in three modules. which can be used independetly from each other. 

- ABC_Demography
- FitnessEffects
- EmpiricalData 
 
### ABC_Demography 

This module samples demographic parameters from a prior distribution and computes a statistic derived from a coalescent matrix (number of lineages at different time points) which measures 
the difference from each simulated demography according to the random draw of the parameters and an observed coalescent matrix (e.g. The coalescent matrix for a set of synonymouse sites in the genome).
The observed matrix can be generated using the EmpiricalData module, using data from the 1k genomes project via Relate to inference of the ARG. Observed data can also be simulated using 
stdpopsim (slim-based) or using PReFerSim to test theoretical scenarios. 

This ABC approach benefits from extensively sampling from a prior. In practice we note than around 10,000 samplings (random seeds) of the prior are enough to yield good inferences of demography. 
Although this may depend on the dataset being used. 

After the simulations are done after your target number of sampling seeds, the results of the distance statistic are stored in 
	ABC_Demography/Data/Parameters/Output/DemoRun/DemographyReport.txt"
where each line on this file corresponds to an independent sampling of the prior according to a random seed. First column is PastSize, second column is PresentSize, third column is Generations, 4th column
is the distance statistic value and the 5th column is the random seed. 

From this textfile a demographic model can be derived along with plots to visualize the posterior distribution. 

to run this module use:

	sbatch -a 1-10 ABC_Demography.slurm "100 30000" "100 15000" "100 15000" 1.3e-8 8000000 40

where SLURM_ARRAY_TASK_ID (the first range) corresponds to the number of iteration/runs of the ABC algorithm. The first two parameters are Past size, followed by present size, followed by the number of generations, followed by the mutation rate, followed by the total number of simulated sites, followed by a step number. 
where we make use of SLURM_ARRAY_TASK_ID to change random seeds and the value of each parameters are chosen as random picks from a provided min and max value as showin above. 

to generate a simulated observed data matrix to compare arbitrary scenarios to:

	sbatch -a 1-10 ABC_Demography_FixedParameters.slurm 20000 10000 500 1.2e-8 1000000 100

This runs a different script to put together a reference matrix to use as the observed comparison to run our ABC model. The main difference being that this script takes fixed parameter values.
The resulting matrices are outputted to 

	ABC_Demography/Data/Patameters/Output/matrices/observed_matrices/

For dividing runs into different step sizes or paraleliing schemes we recommend not to run simulations with more than 100k sites at a time. Therefore if you want to simulate lets say 100M sites 
you are better off running 1000 runs of 100k sites. Since prefersim runs on infinite sites model, mutations are independent from one another and thus can be paralelized. 

### FitnessEffects

After running ABC_Demography and converging on a demographic model, we can now simulate a series of selection coefficients given this demographic model. This process approximates selection by simulating 
28 different selection coefficients which are then integrated into different gamma distributions later used for maximum likelihood inference. 

This module can be run using 

	sbatch -a 1001-1100 FitnessEffects.slurm 20000 1.2e-8 1000000 100

where SLURM_ARRAY_TASK_ID corresponds to runs of a particular selection coefficient (2Ns value), where you can change between 28 different 2Ns values by the thousands (e.g. seeds 1000-1999) run
the first selection value while seeds 28000-28999 run the 28th selection value. The four parameters to the right correspond to Ne in the past, the mutation rate, total number of simulated sites 
and a step size. In practice if you want to simulate a targeted 1M sites then you can split this into 100 executions which means you will need to run an array job (SLURM_ARRAY_TASK_ID) of X001 to X100 
for each of the 28 selection values. We recommend not simulating more than 200k sites per step. 

After executing these simulations you then execute... 

	srun ComputeSelMatrices.slurm 

Finally, in inference directory run...

	srun gamma_inference.slurm  

	
### EmpiricalData

argDFE is designed to infer both a demographic model and a distribution of fitness effect, given this demography based on obsservations from empirical data. 
In order to input empirical data, we start of from inferred trees in tskit format. In practice these observed tree sequences can be from empirical real world populations inferred from arg inference 




How to run

sbatch -a 1-999 ABC_Demography_reducido_update_fixedsites.slurm
