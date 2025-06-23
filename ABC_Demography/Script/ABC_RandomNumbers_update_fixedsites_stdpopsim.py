
##This script generates random draws for demographic parameter distributions and writes parameter files to run
##prefersimulations under that particular demographic model. The output is trees under the simulation. 

import sys , random , math

#Why do I need 2 of the same argument??
#Arguments from broader environment 
print (sys.argv[1])
Number = int(sys.argv[1])

#uses random to generate a seed based on the slurm_id_run 
random.seed( Number )

#Parametros de msel

###Requiero ultimas 2 columnas de "LeftRandomNumbers" $number = SGE_TASK_ID --> paralelizar
RandomNumbersFile = "../Results/ABCAnalysisPopExpansion/DemographyScales" + str(Number) + ".txt"
ParamsFile = "../Results/ABCAnalysisPopExpansion/DemographyData" + str(Number) + ".txt"

RandFile = open (RandomNumbersFile, 'w')
ParsFile = open (ParamsFile, 'a')

#### Prior distributions
NeInitial = random.random() * 1.602  # 5 - 2.999 = 2.001
print("Ne Initial " + str(NeInitial))
NeInitial = int(10**(NeInitial + 2.999) + 1 + 0.5)
print("Ne Initial " + str(NeInitial))
NePast = random.random() * 14899
NePast = int(NePast + 101 + 0.5)
Time = random.random() * 13000
Time = int(Time + 0.5)

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
l = 962697 #Total number of synonimous sites found in H-like chr1 #Está mal. deberia ser 962697
l = l / 40  #this should make 3x faster without compromising much --> previous was 300 arund 26k sites per run
theta = (NePast * 4 * u * l)
theta = str(theta)

#Number identifica la corrida. #Cambia el nombre
ParamsFile =  "../Results/ABCAnalysisPopExpansion/ParameterFile_" + str(Number) + ".txt"
ParamsFileB = "../Results/ABCAnalysisPopExpansion/ParameterFile_" + str(Number) + "_B.txt"

ABCParsFile = open (ParamsFile, 'w')
ABCParsFileB = open (ParamsFileB, 'w')

#Archvis de salida Demografia, Output
DemHist = "../Results/ABCAnalysisPopExpansion/Output/DemographicHistory" + str(Number) + ".txt"
OutDir = "../Results/ABCAnalysisPopExpansion/Output/Output"
AllelesFile = "../Results/ABCAnalysisPopExpansion/Output/Alleles_" + str(Number) + ".txt"
TrajFile = "../Results/ABCAnalysisPopExpansion/Output/Traj_" + str(Number) + ".txt"

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

#WIP pending tests 
