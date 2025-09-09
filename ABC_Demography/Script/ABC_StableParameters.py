
###This script simulates the "observed" data that will be used to compute distance from the monte carlo (ABC) generations
#The only difference is that priors are fixed or stable rather than being sampled from a distribution.
#The user is still able to choose the stable parameters.  
#Just the final step that takes the trees and pulls them together and created the matrix is different. 

import random
import argparse
import os
import sys
import math

seed = os.environ.get('SLURM_ARRAY_TASK_ID')
Number=seed

#Parameters de msel
###Requiero ultimas 2 columnas de "LeftRandomNumbers" $number = SGE_TASK_ID --> paralelizar
RandomNumbersFile = "../Data/Parameters/DemographyScales" + str(Number) + ".txt"
ParamsFile = "../Data/Parameters/DemographyData" + str(Number) + ".txt"

RandFile = open (RandomNumbersFile, 'w')
ParsFile = open (ParamsFile, 'a')

# Define default values
DEFAULTS = {
    'n_past_value': (20000),
    'n_present_value': (10000),
    'time_value': (80000),
}

# Set up argument parser
parser = argparse.ArgumentParser(description="Passes fixed values for N_past, N_present, and Time.")
parser.add_argument("--use_defaults", action="store_true", help="Use default parameter values")
parser.add_argument("--n_past_value", type=int, required=False, help="N_past parameter value")
parser.add_argument("--n_present_value", type=int, required=False, help="N_present parameter value")
parser.add_argument("--time_value", type=int, required=False, help="Time in generations paramter value")
parser.add_argument("--mutation_rate", type=float, required=False, help="mutation rate")
parser.add_argument("--total_sites", type=int, required=False, help="Number of simulated sites")
parser.add_argument("--step_size", type=int, required=False, help="for paralelization")

# Parse arguments. change
args = parser.parse_args()

#pass these
N_past = args.n_past_value
N_present = args.n_present_value
Time = args.time_value
u = args.mutation_rate
l = args.total_sites
run_number = args.step_size

#### Stable parameter values review 
print(f"Ne in present time is :{N_present}")
print(f"Ne in past is :{N_past}")
print(f"Change took place at generation :{Time}\n")
print(f"using mutation rate :{u}\n")
print(f"Simulating a total of :{l} sites \n")
print(f"divided into {run_number} independent simulation runs \n")

#a ver entonces el archivo demografico es...
#pasado Time yes. past and present. where time is duration of both sizes. 
#presente Time. inference is done in first time.  

###Parametros de msel
TimeFraction = float( int(Time) / ( 4.0 * N_present))
PopFraction = float ( int (N_past) / ( 1.0 *  N_present))
Rho=1 #recombination, but prefersim assumes no recombination so =1
#Writes current drawn demography to file
String = str(N_present) + "\t" + str(N_past) + "\t" + str (Time) + "\n"
ParsFile.write(String)

###msel TimeFraction and PopFraction parameters for tree generation, this creates the file "LeftRandomNumbers"
#Why do I make a for loop here..?

for x in range(1):
   String = str(TimeFraction) + "\t" + str(PopFraction) + "\n"
   RandFile.write(String)
RandFile.close()

#Parameters subject to change depending on source data
# l is the number of sites and dictates how much a single demography run is split. Paralel running.

l = l / run_number
theta = (N_past * 4 * u * l)
theta = str(theta)

#Number identifica la corrida. #Cambia el nombre
ParamsFile =  "../Data/Parameters/ParameterFile_" + str(Number) + ".txt"
ParamsFileB = "../Data/Parameters/ParameterFile_" + str(Number) + "_B.txt"

ABCParsFile = open (ParamsFile, 'w')
ABCParsFileB = open (ParamsFileB, 'w')

#Archvis de salida Demografia, Output
DemHist = "../Data/Parameters/Output/DemographicHistory" + str(Number) + ".txt"
OutDir = "../Data/Parameters/Output/Output"
AllelesFile = "../Data/Parameters/Output/Alleles_" + str(Number) + ".txt"
TrajFile = "../Data/Parameters/Output/Traj_" + str(Number) + ".txt"

#Cambiar directorios (Out)
DemHistFile = open (DemHist,'w')
String = """MutationRate  """ + theta + """
DFEType:    point
DFEPointSelectionCoefficient:    0.0
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
#Cambiar directorios (Out,Alleles,Traj)
DemHistFile = open (DemHist,'w')
String = """MutationRate  """ + theta + """
DFEType:        point
DFEPointSelectionCoefficient:    0.0
DemographicHistory:         """ + DemHist + """
PrintSNPNumber:   0
PrintSumOfS: 0
PrintWeightedSumOfS: 0
PrintGenLoad: 0
PrintFixedSites: 0
PrintSegSiteInfo: 0
PrintSampledGenotypes: 0
PrintSFS: 0
n: 200
LastGenerationAFSamplingValue: 1
AlleleTrajsInput: """ + AllelesFile + """
AlleleTrajsOutput: """ + TrajFile + """
FilePrefix: """ + OutDir + """
"""

ABCParsFileB.write(String)

##Archivo de demografia
Ne = 2.0 * N_present
String = str(int( 2.0 * N_past +0.5)) + " " + str(int((N_past * 16)+0.5)) + "\n"
String = String + str(int(2.0 * N_present+0.5)) + " " + str(int((Time )+0.5)) + "\n"

#So first Time value is strictly the burn in for first size. 
#Second time value is what we are inferring, meaning, "generations ago that bottleneck happened". 

#Tengo que agregar TimeFraction y PopFraction
DemHistFile.write(String)

#Cerramos los archivos que escribimos.
ABCParsFile.close()
DemHistFile.close()
ABCParsFileB.close()
RandFile.close()
ParsFile.close()

#This should work. Now just change slurm. 

