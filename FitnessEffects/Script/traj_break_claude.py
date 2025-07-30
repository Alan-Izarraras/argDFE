import os
import numpy as np
import sys
from collections import defaultdict

def process_chunk(chunk, allele_ids, output_lines):
    for line in chunk:
        columns = line.split()
        if columns and columns[0] in allele_ids:
            output_lines[columns[0]].append(line)

if len(sys.argv) < 2:
    print("Usage: python script.py SGE_TASK_ID")
    sys.exit(1)

SGE_TASK_ID = sys.argv[1]
print("SGE_TASK_ID:", SGE_TASK_ID)

directory = f"../Data/Allele_{SGE_TASK_ID}_freqs/"

filenames = [f"Alleles_{SGE_TASK_ID}_{i:.3f}.txt" for i in np.arange(0.005, 1.0, 0.005)]
chunk_size = 100000  # Adjust this based on available memory

for filename in filenames:
    file_path = os.path.join(directory, filename)
    i = filename.split("_")[2]
    output_file_path = os.path.join(directory, f"Traj_{SGE_TASK_ID}_{i}")

    if os.stat(file_path).st_size == 0:
        print("No trajectories found for this count:", i)
        continue

    with open(file_path, 'r') as input_file:
        allele_ids = set(line.split()[0] for line in input_file if line.strip())

    traj_name = f"Traj_{SGE_TASK_ID}.txt"
    traj_path = os.path.join(directory, traj_name)

    output_lines = defaultdict(list)

    with open(traj_path, 'r') as file:
        chunk = []
        for line in file:
            chunk.append(line)
            if len(chunk) == chunk_size:
                process_chunk(chunk, allele_ids, output_lines)
                chunk = []
        if chunk:  # Process any remaining lines
            process_chunk(chunk, allele_ids, output_lines)

    with open(output_file_path, 'w') as output_file:
        for lines in output_lines.values():
            output_file.writelines(lines)

print("Process complete, output files saved.")
