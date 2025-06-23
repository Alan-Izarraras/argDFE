##Es llamado por Run_ABC.sh y genera corridas aleaotrias de una distribución de demografias.
##Code modified for stdpopsim runs. mutation rate + total num of sites is adjusted
#Further modifyied PrsentSize range from 100k to 40k max. Also l to 26k sites instead of 32k sites

import sys , random , math

###Corre con 2 valores: Number + RandomSeed (quedan igual)

###Creo que puedo comentar eso
print (sys.argv[1])
Number = int(sys.argv[1])
RandomSeed = int(sys.argv[2])
#Fraction = float(sys.argv[3])

### Poner la semilla aleatoria. Por ahora funciona siempre y cuando definas la semilla, luego la pongo automatica
#Number = 11
#RandomSeed = 11

random.seed( RandomSeed )

#Parametros de msel

###Requiero ultimas 2 columnas de "LeftRandomNumbers" $number = SGE_TASK_ID --> paralelizar
RandomNumbersFile = "../Results/ABCAnalysisPopExpansion/DemographyScales" + str(Number) + ".txt"
ParamsFile = "../Results/ABCAnalysisPopExpansion/DemographyData" + str(Number) + ".txt"

RandFile = open (RandomNumbersFile, 'w')
ParsFile = open (ParamsFile, 'a')

#### Prior distributions
#### N_pasado (101 - 5,000), N_presente (1,000 - 1,000,000), t (0 - 1,500)
### Update Run #4 N pasado se queda igual N presente (1,000 - 500,000), t(0 - 20000).

###Past from 1 to 15,000
###Present from 1,000 to 40,000
###Time 0 to 20k

NeInitial = random.random() * 1.602  # 5 - 2.999 = 2.001
print("Ne Initial " + str(NeInitial))
NeInitial = int(10**(NeInitial + 2.999) + 1 + 0.5)
print("Ne Initial " + str(NeInitial))
NePast = random.random() * 14899
NePast = int(NePast + 101 + 0.5)
Time = random.random() * 13000
Time = int(Time + 0.5)
###Parametros de msel
#Roh es para cosas de recombinación
TimeFraction = float( int(Time) / ( 4.0 * NeInitial))
PopFraction = float ( int (NePast) / ( 1.0 *  NeInitial))
Rho=1
#Parsea ParamFiles con datos de arriba.
String = str(NeInitial) + "\t" + str(NePast) + "\t" + str (Time) + "\n"
ParsFile.write(String)

###msel TimeFraction and PopFraction parameters for tree generation, this creates the file "LeftRandomNumbers"

for x in range(1):
   String = str(TimeFraction) + "\t" + str(PopFraction) + "\n"
   RandFile.write(String)
RandFile.close()

#Yeah so right here I should... use coding mutation rate. Cuz Im fairly sure I used neutral dfe sites.
#Confirm that that is the mutation rate. yh... fairly sure that is it. 

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
