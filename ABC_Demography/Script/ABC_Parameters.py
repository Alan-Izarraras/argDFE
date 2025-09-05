#python3 sample_ranges.py --use_defaults
#python3 sample_ranges.py --n_past_range "0 100" --n_present_range "0 100" --time_range "0 24"

import random
import argparse
import os
import sys
import math 

### Sets up command line arguments to choose parameter values. 
#I probably dont need the defaults anymore? Since they are setup in the bash script. 

seed = os.environ.get('SLURM_ARRAY_TASK_ID')

Number=seed
random.seed(int(Number))

#Msel Parameters
RandomNumbersFile = "../Data/Parameters/DemographyScales" + str(Number) + ".txt"
ParamsFile = "../Data/Parameters/DemographyData" + str(Number) + ".txt"

RandFile = open (RandomNumbersFile, 'w')
ParsFile = open (ParamsFile, 'a')

# Define default ranges
DEFAULTS = {
    'n_past_range': (1000, 15000),
    'n_present_range': (1000, 40000),
    'time_range': (1, 1000),
}

# Set up argument parser
parser = argparse.ArgumentParser(description="Generate random samples for N_past, N_present, and Time.")
parser.add_argument("--use_defaults", action="store_true", help="Use default parameter ranges")
parser.add_argument("--n_past_range", type=str, required=False, help="Range for N_past (e.g., '0 100')")
parser.add_argument("--n_present_range", type=str, required=False, help="Range for N_present (e.g., '0 100')")
parser.add_argument("--time_range", type=str, required=False, help="Range for Time (e.g., '0.0 24.0')")
parser.add_argument("--mutation_rate", type=float, required=False, help="mutation rate")
parser.add_argument("--total_sites", type=int, required=False, help="Number of simulated sites")
parser.add_argument("--step_size", type=int, required=False, help="for paralelization")

# Parse arguments
args = parser.parse_args()

# Function to parse range string into min, max
def parse_range(range_str, is_float=False):
    try:
        # Split the range string and convert to appropriate type
        min_val, max_val = map(float if is_float else int, range_str.split())
        return min_val, max_val
    except ValueError:
        parser.error(f"Invalid range format: '{range_str}'. Expected two numbers (e.g., '0 100').")

# Determine parameter values
if args.use_defaults:
    # Use default values
    n_past_min, n_past_max = DEFAULTS['n_past_range']
    n_present_min, n_present_max = DEFAULTS['n_present_range']
    time_min, time_max = DEFAULTS['time_range']
else:
    # Check if all required range arguments are provided
    required_args = ['n_past_range', 'n_present_range', 'time_range']
    for arg in required_args:
        if getattr(args, arg) is None:
            parser.error(f"Argument --{arg} is required when --use_defaults is not specified.")

    # Parse ranges
    n_past_min, n_past_max = parse_range(args.n_past_range)
    n_present_min, n_present_max = parse_range(args.n_present_range)
    time_min, time_max = parse_range(args.time_range)


# Validate ranges
if n_past_min > n_past_max:
    parser.error("n_past_range min must be <= max")
if n_present_min > n_present_max:
    parser.error("n_present_range min must be <= max")
if time_min > time_max:
    parser.error("time_range min must be <= max")

# Generate random samples
N_past = random.randint(int(n_past_min), int(n_past_max))
N_present = random.randint(int(n_present_min), int(n_present_max))
Time = random.randint(int(time_min), int(time_max))

#pass these
u = args.mutation_rate
l = args.total_sites
run_number = args.step_size

# Print results
print(f"N_past: {N_past}")
print(f"N_present: {N_present}")
print(f"Time: {Time}")
print(f"Seed: {seed}")

##### I can now proceed to specifying and writing the parameter files. 

###Parametros de msel
TimeFraction = float( int(Time) / ( 4.0 * N_present))
PopFraction = float ( int (N_past) / ( 1.0 *  N_present))
Rho=1 #recombination, but prefersim assumes no recombination so =1
#Writes current drawn demography to file
String = str(N_present) + "\t" + str(N_past) + "\t" + str (Time) + "\n"
ParsFile.write(String)

for x in range(1):
   String = str(TimeFraction) + "\t" + str(PopFraction) + "\n"
   RandFile.write(String)
RandFile.close()

#Population genetic parameters (that dont have to do the prior distribution of demographic parameters)
# l is the number of sites and dictates how much a single demography run is split. Paralel running.

l = l / run_number  #this should make 3x faster without compromising much --> previous was 300 arund 26k sites per run
theta = (N_past * 4 * u * l)
theta = str(theta)

#Using these parameters
print(f"Using mutation rate: {u}")
print(f"Using total number of simulated sites: {l}")
print(f"Using step size: {run_number}")

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

#Donde es AllelesFile y donde es TrajFile

ABCParsFileB.write(String)

#Construct demography output file.
Ne = 2.0 * N_present
String = str(int( 2.0 * N_past +0.5)) + " " + str(int((N_past * 16)+0.5)) + "\n"
String = String + str(int(2.0 * N_present+0.5)) + " " + str(int((Time )+0.5)) + "\n"

#Tengo que agregar TimeFraction y PopFraction
DemHistFile.write(String)

#Cerramos los archivos que escribimos.
ABCParsFile.close()
DemHistFile.close()
ABCParsFileB.close()
RandFile.close()
ParsFile.close()

















