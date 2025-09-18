# argDFE software documentation (https://github.com/Alan-Izarraras/argDFE)

### Description

argDFE is a DFE inference software that leverages information from the ancestral recombination graph. Specifically, it uses allele frequency trajectories simulated with PReFerSim to simulate bi-allelic trees using mssel3. Finally the DFE is inferred from the information contained in the bi-allelic trees.

### Prerequisites

argDFE requires the compilation of two different programs: PReFerSim and mssel3
PReFerSim is a C program that requires GSL to be installed and run (https://github.com/LohmuellerLab/PReFerSim)
Instructions for installing PReFerSim can be found on the manual at the provided github address.
mssel3 is a C program written and kindly provided by Richard Hudson.

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

	
Running the past command can give back the following errors:

	/usr/bin/ld: cannot find -lgsl
	/usr/bin/ld: cannot find -lgslcblas
	collect2: error: ld returned 1 exit status

These errors happen because the compiler is unable to find some libraries in the current gsl library installation. However, a workaround is to look for them and tell the system where they are:

	gcc -o PReFerSim PReFerSim.c $(pkg-config --cflags --libs gsl)

If you are having trouble getting PReFerSim installed consult the manual over at argDFE/PReFerSim-master/PReFerSim_Manual_v2.pdf. You can also contact the developer of PReFerSim (dortega at liigh dot unam dot mx).

3) Compile mssel3

Go inside the mssel folder and type:
 
	cc -o mssel3  mssel3.c  streecsel.c  rand1.c -lm

4) Compile stepftn 

Need to check if this needs compilation or if executable already works

## Getting started

argDFE is divided in three modules. which can be used independetly from each other. 
These modules can be run on a SLURM cluster management scheduling system and can be adapted to run on other cluster management scheduling systems for high performance computing environments (HPCs). EmpiricalData formats the input, ABC_Demography does demographic inference and finally argDFE runs likelihood inference on different DFEs given a demographic model. 

- EmpiricalData
- ABC_Demography
- argDFE
 
### ABC_Demography 

This module provides an ABC algorithm to infer the past demographic history of a population. The demographic history that is currently inferred consists of three parameters.

- A past population size N0
- A present day population size N1
- A time t when the population size changes from N0 to N1.

This module samples demographic parameters from a prior distribution, simulates a set of genealogies, and computes the probability of having a certain number of lineages at different time points T in those genealogies. 
Those probabilities are then compared to the probabilities observed in a certain dataset via a distance statistic (D). The probabilities observed in a particular dataset will be referred to as the “observed matrix” and will be present in a file called "observed_count_matrices.txt" and "observed_probability_matrices.txt" present in the folder 

	argDFE/ABC_Demography/Data/Parameters/Output/matrices/observed_matrices/

The observed matrix can be generated using the EmpiricalData module. We show an example of how to do this using data of genealogies inferred from the 1K genomes project via Relate. Observed data can also be simulated using stdpopsim (slim-based) or using PReFerSim to test theoretical scenarios.

ABC approaches benefit from extensive sampling from a prior. In the scenarios we tested we found that simulating around 10,000 sampled parameters (random seeds) of the prior are enough to yield reasonable inferences of demography. We also found that retaining the samplings where the distance statistic is less or equal to 0.01 is sufficient to obtain reasonable results. In the scenarios we tested we tried adjusting the priors to obtain approximately 100 sampled parameter values where the distance statistic is less or equal to 0.01. These sampled parameter values constitute the posterior distribution.

To run the ABC algorithm:
 
	cd ABC_Demography/Script              	
	
	sbatch -a 1-10 ABC_Demography.slurm "100 30000" "100 15000" "100 15000" 1.3e-8 8000000 40

Where -a 1-10 corresponds to the number of runs of the ABC algorithm. In this example we are sampling 10 parameter values and calculating ten values for the distance statistic D. Those values are also the ten random seeds to draw and simulate parameter values with. We then provide three intervals inside the “” characters. The three intervals depict the prior distributions for the past population size (N0), present day population size (N1) and time (t) when the population size changes from N0 to N1.
The three last numbers represent the mutation rate (in scientific notation), the total number of simulated sites (l = 8000000) which are devided by a step number (40) which will determine the number of sites that will result from each independent run, which is always a factor of l. 
Choosing the correct step size is a function of computational speed while maintaining statistical power. In practice the total number of simulated sites (l) comes from what was used to generate the "observed matrix" and a good target number of independent sites to run (l/step_size) is one above 30,000 sites. Because from here we find enough variation to sample the coalescent patterns that will resemble the "observed matrix". 
Independent site values above 30,000 (l/step_number) in theory provide more information but come at a computational time cost. All things considered simulating between 30,000 and 200,000 sites is reasonable but the decision will come from time/information tradeoff. 

The results from running this module can be found in: 

	ABC_Demography/Data/Parameters/Output/DemoRun/DemographyReport.txt

Where each line in this file corresponds to one independent run of the ABC module and consists of 5 columns: Past size (NO), Present size (N1), Number of Generations (t), RandomSeed and the distance statistic (D). 
 	
Finally, the results can be visualized and better inspected running the following script.
	
	cd ABC_Demography/Script

	Rscript Posterior_Calc.R

Running this script once the ABC algorithm is done will generate boxplots and density curves of the prior and posterior distributions as well as generate a demogrpahic file constructed from the posterior dsitribution needed for argDFE inference. You can then make the decision of using this demographic file for argDFE inference if you are satisfied with the performance of your posterior distribution or choose to do more simulation or even modify prior disitrubtion values.

Three aspects are particularly important to verify:

- Check that the prior distribution is not narrow for a particular parameter. You can try to extend the upper limit of the prior distribution for this parameter if the posterior distribution does not seem to fall towards zero.
- Check that the prior distribution is not too big for a particular parameter. You can try to reduce the upper and lower limit of the prior distribution if the posterior distribution values cluster on one parameter range that is very small and all of the simulations that fall outside of that range are discarded. We suggest reducing the upper and lower limits to include the area where most of the parameters are selected.
- There might not be sufficient information to estimate one particular parameter value. When the posterior distribution extends towards the upper limits of the prior, extending the prior distribution further to look for convergence might not work (it might never converge). Nevertheless, the bulk of the posterior distribution should converge to a narrow range of values. 

More information on good practices to run ABC’s can be obtained on the ABCtoolbox manual (https://www.cmpg.iee.unibe.ch/software/software/abctoolbox/index_eng.html) or in literature reviews on ABC’s (https://pmc.ncbi.nlm.nih.gov/articles/PMC4297650/ , as an example).

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
