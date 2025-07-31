### Updated python paramfile generating scripts for selection simulations
##Changes:Paramfiles are now produced per SGE_TASK_ID run in the manner similar to the ABC run.
##Just need to change SGEtaskid to slurm. 

#Code for parameter passing, in this case SGE_TASK_ID
import sys
SGE_TASK_ID = int(sys.argv[1])

u = 1.29e-08 #coding mutation rate
#l = 18614771 #Total number of non_synonimous sites in human genome
l = 6775033  #Total number of extracelular matrix non synonimous sites in human genome
l = l / 300
N_past = 16914/2 #Fixed for current estimate

theta = (N_past * 4 * u * l)
theta = str(theta)

###Generates selection coefficients.
TwoN = N_past * 2
Sel_coefs = [0]
for i in range(1, 28):  # Python uses range(n) for loops
    p = -3.00
    val = 0.25
    p = p + i * val  # Update p by adding the current value of val for each iteration
    TwoNs_val = 10 ** p
    s_coef = TwoNs_val / TwoN
    Sel_coefs.append(s_coef)

#print(Sel_coefs) #Now i have 2Ns values in a list... next I need selection coefs in a list.
#It should be 28 values long.

#hmmm lets trust my past self, that Sel_coefs stores the desired coefficients.
#And then lets call them based on SGETASKID/1000 (even though py is 0based.) so maybe
#This gives sorting of vector for sel val.
sel_seed = (SGE_TASK_ID/1000) -1
sel_seed = int(sel_seed)
i = sel_seed

print("using selection seed" + str(sel_seed) + "that corresponds to selection coeff" + str(Sel_coefs[i]))

#This formats paramfiles. note that I changed their naming.
#No named after SGE_TASK_ID.txt
OutDir = "../Data/Output"
AllelesFile = "../Data/Alleles_" + str(SGE_TASK_ID)  + ".txt" #This should be what I need
TrajFile = "../Data/Traj_" + str(SGE_TASK_ID) + ".txt"
DemHist = "YRI_MeanPosteriorDemography.txt"

#now just update paths in SGE script and we should be ready to start running tests.
ParamsFile = f"params/fixed/ParamFile_{SGE_TASK_ID}.txt"
ParamsFileB = f"params/fixed/ParamFile_B_{SGE_TASK_ID}.txt"

ABCParsFile = open (ParamsFile, 'w')
ABCParsFileB = open (ParamsFileB, 'w')

coef = Sel_coefs[i]
coef = format(coef, ".9f")
coef = str(coef)

#Cambiar directorios (Out)
String = """MutationRate  """ + theta + """
DFEType:    point
DFEPointSelectionCoefficient:   """ + coef + """
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
DFEType:        point
DFEPointSelectionCoefficient:   """ + coef + """
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
