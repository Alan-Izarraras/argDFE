#ABC_ReferenceSimulationRun.py 

###This script is meant to be a way to simulate the "observed" data that will be used to compare against the 
# regular ABC generations. It should only be ran once. Modified from the regular script that sampled from distributions.
#oh wait. The difference will be that I wont be able to paralelize... and it will be sent as a single sim. 
#So it might not be the most comvinient setup? 
#no wait, in principle its the same thing, I just run it with what ever number of seeds I need. 
#Just the final step that takes the trees and pulls them together and created the matrix is different. 
#Ok first lets test how slow this is, with the full variation. If its incrediblu slow then lets paralelize. 

import sys , random , math

#Why do I need 2 of the same argument??
#Arguments from broader environment
print(f"Initial seed value is: {sys.argv[1]} \n")
Number = int(sys.argv[1])

#uses random to generate a seed based on the slurm_id_run
random.seed( Number )

#Parameters de msel
###Requiero ultimas 2 columnas de "LeftRandomNumbers" $number = SGE_TASK_ID --> paralelizar
RandomNumbersFile = "../Data/Parameters/DemographyScales" + str(Number) + ".txt"
ParamsFile = "../Data/Parameters/DemographyData" + str(Number) + ".txt"

RandFile = open (RandomNumbersFile, 'w')
ParsFile = open (ParamsFile, 'a')

#Parametros que me tocaron
#10k personas = 20k genomas.
#NePast = 20000 
#Gen = 16N para tener burn-in 
#10k * 16 = 160000 --> hagamos en cuello de botella en 80k
#Dijimos que hariamos esquemas de tiempo y lo demas fijo a mi me toco reduccion a la mitad.
#El tiempo es el que cambia y va en 3 esquemas... hagamos el primero que es 
#El tiempo que dura el tamaño pasado.

#### Prior distributions
NeInitial = 10000
print(f"Ne Initial is :{NeInitial}")
NePast = 20000
print(f"Ne Past is :{NePast}")
Time = 80000
print(f"Time in generations is :{Time}\n")

###Parametros de msel
TimeFraction = float( int(Time) / ( 4.0 * NeInitial))
PopFraction = float ( int (NePast) / ( 1.0 *  NeInitial))
Rho=1 #recombination, but prefersim assumes no recombination so =1
#Writes current drawn demography to file
String = str(NeInitial) + "\t" + str(NePast) + "\t" + str (Time) + "\n"
ParsFile.write(String)

###msel TimeFraction and PopFraction parameters for tree generation, this creates the file "LeftRandomNumbers"
#Why do I make a for loop here..?

for x in range(1):
   String = str(TimeFraction) + "\t" + str(PopFraction) + "\n"
   RandFile.write(String)
RandFile.close()

#Parameters subject to change depending on source data
# l is the number of sites and dictates how much a single demography run is split. Paralel running.

u = 2.35e-08 ##stdpopsim mut rate based on demography = 2.35e-8
print(f"Using mutation rate {u}")
l = 1000000 #Lets make this 1M even though in reality its 100M. What changes??? 
print(f"Using total number of sites {l}")
run_number=100
theta = (NePast * 4 * u * l)
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
Ne = 2.0 * NeInitial
String = str(int( 2.0 * NePast +0.5)) + " " + str(int((NePast * 16)+0.5)) + "\n"
String = String + str(int(2.0 * NeInitial+0.5)) + " " + str(int((Time )+0.5)) + "\n"

#Tengo que agregar TimeFraction y PopFraction
DemHistFile.write(String)

#Cerramos los archivos que escribimos.
ABCParsFile.close()
DemHistFile.close()
ABCParsFileB.close()
RandFile.close()
ParsFile.close()

#This should be it... 

