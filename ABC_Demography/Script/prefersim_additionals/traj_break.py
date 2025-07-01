#Script to break traj_full into traj_ for each frequency in present.

import os
import numpy as np
import sys

# Access command-line arguments using sys.argv
if len(sys.argv) < 2:
    print("Usage: python script.py SGE_TASK_ID")
    sys.exit(1)

# Get SGE_TASK_ID from command-line argument
SGE_TASK_ID = sys.argv[1]
#SGE_TASK_ID = 5
print("SGE_TASK_ID:", SGE_TASK_ID)

#For this to work, Allele_freq files and Traj_SGE must be in the same directory and that directory given as
#path below.

#directory = f"freqs/"
#For use un cluster:
directory = f"../Data/Parameters/Output/Allele_{SGE_TASK_ID}_freqs/"

#Counts number of frequency values where no trajectories are found.
a=0

#Ahora quiero esto pero con un for para todos los archivos alelos.
filenames = [f"Alleles_{SGE_TASK_ID}_{i:.3f}.txt" for i in np.arange(0.005, 1.0, 0.005)]
for filename in filenames:
    file_path = os.path.join(directory, filename)
    i = filename.split("_")[2]
    output_file_path = os.path.join(directory, f"Traj_{SGE_TASK_ID}_{i}")

    # Check if the input file is empty
    input_file_empty = os.stat(file_path).st_size == 0

    if input_file_empty:
        a=a +1
        #print("No trajectories found for this count:", i)
    else:

        #Extracts IDs from allele freq file and places them in list.
        allele_ids = []
        with open(file_path, 'r') as input_file:
            for line in input_file:
                columns = line.split()
                if columns:
                    allele_ids.append(columns[0])

        #The list becomes the search term for the dictionary
        search_text = allele_ids

        # Specify path to Traj_ file
        traj_name = f"Traj_{SGE_TASK_ID}.txt"
        traj_path = os.path.join(directory, traj_name)

        #Opens file, searches by column, if match then outputs line.
        with open(traj_path, 'r') as file:
            with open(output_file_path, 'w') as output_file:
                # Iterate over each line in the input file
                for line_number, line in enumerate(file, start=1):
                    # Split the line into columns
                    columns = line.split()
                    # Check if there are any columns and if the first column matches any of the search_text
                    if columns and columns[0] in search_text:
                        # If found, write the line to the output file
                        output_file.write(line)

print(f"found {a} frequency values with no simulated trajectories")
print("process complete, output files saved. \n")
