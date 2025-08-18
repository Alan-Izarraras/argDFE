#!/bin/bash

# Loop through chromosome files (1 to 22)
for chr in {1..22}; do
  # Input file (adjust the naming pattern if your files differ, e.g., chromosome1.txt)
  input_file="chr${chr}.sinonimo.ready.txt"
  
  # Check if the input file exists
  if [[ -f "$input_file" ]]; then
    # Output file (e.g., chr1_mod.bed)
    output_file="chr${chr}_sinonimo.txt"
    
    # Use awk to add chromosome number as the second column
    awk -v chr="$chr" 'BEGIN {OFS="\t"} {$2=$2"\t"chr; print}' "$input_file" > "$output_file"
    
    echo "Processed $input_file -> $output_file"
  else
    echo "File $input_file not found"
  fi
done


