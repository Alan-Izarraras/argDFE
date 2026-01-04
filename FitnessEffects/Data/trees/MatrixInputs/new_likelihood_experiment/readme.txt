How I ran this experiment:

1) Simulation step

First I simulated trees under a range of 27 different discrete selection coefficients. I used this script (FitnessEffects/Scripts/Posterior_SelectionRuns_reducido_optimizado_update_parallel_yri.slurm)
This script can be executed the following way:

"sbatch -a 1001-1300 Posterior_SelectionRuns_reducido_optimizado_update_parallel_yri.slurm 10000 1.29e-8 19379845 100"

where, -a controls the Selection value and random seed so that the thousands correspond to the selection coefficient going from 1000 to 27000 (27 values) and the rest of the digits control 
the random seed, so that I am effectively running 300 trees/runs per selection value. The last three parameters correspond to the effective population size (N), mutation rate, target size and a step
parameter. The step parameter controls how many sites are simulated per simulation run. In this case I can simulating 300 runs with a step size of a 100 which translates to simulating 
(19379845 / 100) sites per run. I then do 300 runs of each selection coefficient taking into account that 100 runs is enough to hit the target size but that I essentially need a "search" or problem
dataset consisting of 100runs, then an "observed" or reference dataset that is independent consisting of an additional 100 runs and finally, a surplus of 100 runs for the search set
(making it a total of 200 runs for the search set) so that I can do random sampling of 100 trees in order to create replicate datasets to test the variance of my model. 

After running the 300 simulations, runs will get stored over at "/argDFE/FitnessEffects/Data/trees/MatrixInputs/" where they will be classified into folders named Sel_1/ to Sel_27/
Simulation runs are divided into two output files. Your normal tree file, containing newick trees and a singletons file, containing branch lengths of singletons. 

2) Sorting step 

After simulations are donde (make sure all tree and singleton files contain information, sometimes the compute cluster can randomly fail jobs). 
Now you must execute a short sorting step which will organanize and move your tree and singleton files into set1 (search. 001 to 200) and set2 (reference. 200 to 300) trees. 
(argDFE/FitnessEffects/Data/trees/sort_script.sh). These trees will be moved to a directory called "source_trees/"
Afterwards you can execute a "merge.sh" script to concatenate and generate a pair of tree and singleton files per selection values (27 * 2) total files. These will be found in set1 and set2 directories
In the case of set1 files, you can opt to make different sampling replicates by executing "argDFE/FitnessEffects/Data/trees/Matrix/set1/replicas_Set1_v2.slurm" script. These will be printed in set1/

3) Matrix construction 

Now we can execute "argDFE/FitnessEffects/Script/ComputeSelMatrices.slurm" script to being constructing a single coalescent matrix for every selection value (27). This executes 
ComputeProbMatrices.R which constructs probability matrices used for set2/ and count matrices used for set1/ 

This script is ran in paralel with an argument denoting the selection value it is cosntructing the matrices for. 

"sbatch -a 1-27 ComputeSelMatrices.slurm" will execute the script for all 27 matrices. 

After all matrices are constructed, we finally run "Type_2_matrices.R" to convert alternative matrices for the case where we have no information of when the ancestral and derived mutation coalesce.
(Realsitic for real data, known for simulated data). 

4) Inference step

Finally, having constructed the matries we can compute their likelihoods by running "/argDFE/FitnessEffects/Script/inference/run_alt_discrete_inference.slurm" 
Executing this script runs but the "matrix-like" and the "sfs-like" inference and you get one for every matrix dimension construct (which is parameter you can change when cosntructing matrices). 
This will yield a final file named discrete_inferences.cvs which contains the most likely matrix relationships (aka the inference). From this file you can plot as you wish or use my plotting script.
  
