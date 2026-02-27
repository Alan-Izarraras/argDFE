### Updated python paramfile generating scripts for selection simulations
#for DFE simulation
#pending: cli option for switching to this script inside slurm code.
#primero que funcione bare bones, luego ya lo integramos bonito con opciones cli 
#Code for parameter passing, in this case SGE_TASK_ID. SGE_TASK_ID controls selection.
import sys
import argparse
import os
import math


#pass array task id for Selecting a selection value.
SGE_TASK_ID = os.environ.get('SLURM_ARRAY_TASK_ID')
SGE_TASK_ID = int(SGE_TASK_ID)

# Define default values
DEFAULTS = {
    'n_past_value': (20000),
    'mutation_rate': (1.2e-8),
    'total_sites': (100000),
    'step_size': (100),
}

# Set up argument parser
parser = argparse.ArgumentParser(description="Passes fixed values for N_past, mutation rate, total sites and step size.")
parser.add_argument("--use_defaults", action="store_true", help="Use default parameter values")
parser.add_argument("--n_past_value", type=int, required=False, help="N_past parameter value")
parser.add_argument("--mutation_rate", type=float, required=False, help="mutation rate")
parser.add_argument("--total_sites", type=int, required=False, help="Number of simulated sites")
parser.add_argument("--step_size", type=int, required=False, help="site step size for paralelization")

# Parse arguments. change
args = parser.parse_args()

#pass these
N_past = args.n_past_value
u = args.mutation_rate
l = args.total_sites
run_number = args.step_size

#### Confirm param values
print(f"Ne in past is :{N_past}")
print(f"using mutation rate :{u}\n")
print(f"Simulating a total of :{l} sites \n")
print(f"divided into {run_number} independent simulation runs \n")

#check demography script. Here I should have that l = l / run_number. yup. 
l = l / run_number
theta = (N_past * 4 * u * l)
theta = str(theta)
#kim et al dfe based on 1kgenomes europeans 
shape = str(0.186)
scale = str(706) 

sel_seed = (SGE_TASK_ID/1000) -1
sel_seed = int(sel_seed)
i = sel_seed

print("using DFE with parameters shape = " + str(shape) + " scale = " + str(scale))

#This formats paramfiles. note that I changed their naming.
#No named after SGE_TASK_ID.txt#I
OutDir = "../Data/Output"
AllelesFile = "../Data/Alleles_" + str(SGE_TASK_ID)  + ".txt" #This should be what I need
TrajFile = "../Data/Traj_" + str(SGE_TASK_ID) + ".txt"
DemHist = "DemographyFile.txt" #Change

#now just update paths in SGE script and we should be ready to start running tests.
ParamsFile = f"params/fixed/ParamFile_{SGE_TASK_ID}.txt"
ParamsFileB = f"params/fixed/ParamFile_B_{SGE_TASK_ID}.txt"

ABCParsFile = open (ParamsFile, 'w')
ABCParsFileB = open (ParamsFileB, 'w')

#Cambiar directorios (Out)
String = """MutationRate  """ + theta + """
DFEType:    gamma
DFEParameterOne:   """ + shape + """
DFEParameterTwo:   """ + scale + """
DFEParameterThree: 1
DemographicHistory:         """ + DemHist + """
PrintSNPNumber:   0
PrintSumOfS: 0
PrintWeightedSumOfS: 0
PrintGenLoad: 0
PrintFixedSites: 1
PrintSegSiteInfo: 1
PrintSampledGenotypes: 1
PrintSFS: 0
n: 200
LastGenerationAFSamplingValue: 1
FilePrefix: """ + OutDir + """
"""

ABCParsFile.write(String)

String = """MutationRate  """ + theta + """
DFEType:        gamma
DFEParameterOne:   """ + shape + """
DFEParameterTwo:   """ + scale + """
DFEParameterThree: 1
DemographicHistory:         """ + DemHist + """
PrintSNPNumber:   0
PrintSumOfS: 0
PrintWeightedSumOfS: 0
PrintGenLoad: 0
PrintFixedSites: 0
PrintSegSiteInfo: 1
PrintSampledGenotypes: 0
PrintSFS: 0
n: 200
LastGenerationAFSamplingValue: 1
AlleleTrajsInput: """ + AllelesFile + """
AlleleTrajsOutput: """ + TrajFile + """
FilePrefix: """ + OutDir + """
"""

#Writes each file
ABCParsFileB.write(String)

#this should work... not I just need to pass SGE_TASK_ID
#Last update for inferred empirical demography.
