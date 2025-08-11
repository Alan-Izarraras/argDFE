
from pyensembl import EnsemblRelease
import pandas as pd
import csv
import numpy as np
import tskit

### Code for extracting a list of genes from a GO term (accesion number)
# This can be done from website service. 


### Given a list of genes from a GO term, extract syn and non-syn coordiantes 

# Load GRCh37 (Ensembl release 75)
ensembl = EnsemblRelease(75)

# Read Gene Stable IDs from file
gene_ids = pd.read_csv("extracelular_region/extracelular_region_genes.txt", header=0, usecols=[0]).iloc[:, 0].drop_duplicates().tolist()

# Get coordinates
coordinates = []
for gene_id in gene_ids:
    try:
        gene = ensembl.gene_by_id(gene_id)
        coordinates.append({
            "ensembl_gene_id": gene_id,
            "chromosome_name": gene.contig,
            "start_position": gene.start,
            "end_position": gene.end,
            "strand": gene.strand
        })
    except ValueError:
        continue  # Skip invalid IDs
        
# Save to CSV
pd.DataFrame(coordinates).to_csv("extracelular_region/extracelular_coordinates.csv", index=False)

###Converts and makes a mapping per chromosome 

#Filter and writes file for each chromosome. 

import pandas as pd

# Read the coordinates CSV
df = pd.read_csv("extracelular_region/extracelular_coordinates.csv")

# Loop through chromosomes 1-22
for chrom in range(1, 23):
    chrom = str(chrom)  # Convert to string (e.g., "1")
    # Filter rows for this chromosome
    chrom_df = df[df['chromosome_name'] == chrom]
    if not chrom_df.empty:  # Only save if there are entries
        chrom_df.to_csv(f"extracelular_region/chrom_{chrom}_coordinates.csv", index=False)
        print(f"Saved chrom_{chrom}_coordinates.csv with {len(chrom_df)} entries")
    else:
        print(f"No entries for chromosome {chrom}")


###Curates and formats coalescent times (based on the extracted coordiantes) from tskit formatted arg reference. 
###Same process can be done for 

#Nonsynonymous sites

# Loop over chromosomes 1 to 22
for chrom in range(1, 23):
    # Define file names for the current chromosome
    txt_file = f"/Users/raymundo/Documents/Pruebitas/GeneOntology/vep_positions/chr{chrom}_no_sinonimo.txt"
    csv_file = f"/Users/raymundo/Documents/Pruebitas/GeneOntology/extracelular_region/chrom_{chrom}_coordinates.csv"
    tree_file = f"/Users/raymundo/Documents/PyBook/wgs/trees/chr{chrom}_yri.tskit.trees"
    output_nonsyn_pos = f"/Users/raymundo/Documents/Pruebitas/GeneOntology/extracelular_region/chr{chrom}_go_nonsyn_pos.txt"
    output_tree_lengths = f"/Users/raymundo/Documents/Pruebitas/GeneOntology/extracelular_region/chr{chrom}_GO_nonsyn_distances.txt"
    output_found_pos = f"/Users/raymundo/Documents/Pruebitas/GeneOntology/extracelular_region/chr{chrom}_go_succesful_nonsyn_pos.txt"

    # Step 1: Extract synonymous_positions from chrX_sinonimo.txt
    nonsynonymous_positions = []
    try:
        with open(txt_file, 'r') as file:
            for line in file:
                first_column = line.strip().split()[0]
                nonsynonymous_positions.append(int(first_column))
    except FileNotFoundError:
        print(f"Error: File {txt_file} not found. Skipping chromosome {chrom}.")
        continue

    # Step 2: Extract gene_start_pos and gene_end_pos from chrom_X_coordinates.csv
    gene_start_pos = []
    gene_end_pos = []
    try:
        with open(csv_file, 'r') as file2:
            reader = csv.reader(file2)
            next(reader)  # Skip header
            for row in reader:
                try:
                    gene_start_pos.append(int(row[2]))  # 3rd column
                    gene_end_pos.append(int(row[3]))    # 4th column
                except (IndexError, ValueError):
                    print(f"Warning: Invalid data in {csv_file} at row {reader.line_num}. Skipping row.")
                    continue
    except FileNotFoundError:
        print(f"Error: File {csv_file} not found. Skipping chromosome {chrom}.")
        continue

    # Convert to NumPy arrays for efficiency
    nonsynonymous_positions = np.array(nonsynonymous_positions)
    gene_start_pos = np.array(gene_start_pos)
    gene_end_pos = np.array(gene_end_pos)

    # Print lengths to verify
    print(f"Chromosome {chrom}:")
    print(f"  Number of non-synonymous positions: {len(nonsynonymous_positions)}")
    print(f"  Number of gene start positions: {len(gene_start_pos)}")
    print(f"  Number of gene end positions: {len(gene_end_pos)}")

    # Step 3: Check if each synonymous position is within any start-end range
    within_range_positions = []
    for nonsyn_pos in nonsynonymous_positions:
        for start, end in zip(gene_start_pos, gene_end_pos):
            if start <= nonsyn_pos <= end:
                within_range_positions.append(nonsyn_pos)
                break  # Found a range, move to next synonymous position

    # Convert to NumPy array
    within_range_positions = np.array(within_range_positions)

    # Print number of positions within ranges
    print(f"  Number of positions within ranges: {len(within_range_positions)}")

    # Write within_range_positions to chrX_go_syn_pos.txt
    with open(output_nonsyn_pos, 'w') as file:
        for pos in within_range_positions:
            file.write(f"{pos}\n")

    # Step 4: Extract subtrees from tree sequence
    try:
        chrX = tskit.load(tree_file)
    except Exception as e:
        print(f"Error: Failed to load {tree_file}. Skipping chromosome {chrom}. Error: {e}")
        continue

    vector_coordenadas = within_range_positions
    vector_coordenadas_set = set(vector_coordenadas)  # Convert to set for faster lookup
    
    coordenada_encontrada = []
    
    temp_ = []

    a = 0  # Counter for singletons and doubletons
    b = 0  # Counter for normal trees

    with open(output_tree_lengths, 'w') as w:
        for arbol in chrX.trees():
            for sitio in arbol.sites():
                tabla_mutacion = getattr(sitio, 'mutations')
                if len(tabla_mutacion) == 1:  # If there is a mutation at the site
                    sub_arbol = getattr(tabla_mutacion[0], 'node')
                    hijo = arbol.children(sub_arbol)
                    coordenada = getattr(sitio, 'position')  # Get the coordinate
                    num_muestras = arbol.num_samples(sub_arbol)

                    if coordenada in vector_coordenadas_set:
                        i = np.where(vector_coordenadas == coordenada)[0][0]  # Find index
                        coordenada_encontrada.append(coordenada)
                        
                        lista_sub_arbol = [] #Aqui voy guardando las distancias
                        lista_subarbol_ordenada = [] #Aqui ordeno las distancias de arriba
                        
                        #Si la poisicion coincide con una de la lista, ahora si procedemos

                        for muestra in arbol.samples(sub_arbol):  # Entro a los nodos del subarbol. Cada loop es la info de un nodo individual
                            if num_muestras != 1:  # Si no es singleton
                                distancia_del_nodo = arbol.branch_length(muestra)  # obtengo la distancia a cada nodo de todo el subarbol
                                lista_sub_arbol.append(distancia_del_nodo)
                                lista_subarbol_ordenada = sorted(lista_sub_arbol)  # Se tiene que sortear para ir en orden de tiempo
                            
                            else:  # Si es singleton
                                distancia_del_nodo = arbol.branch_length(muestra)
                                lista_sub_arbol.append(distancia_del_nodo)
                                lista_subarbol_ordenada = sorted(lista_sub_arbol)
                                
                        if len(lista_subarbol_ordenada) <= 200:  # Esta condición excluye mutaciones que se fijaron.
                            temp_.append(lista_subarbol_ordenada)
                            
        ##Sortea por frecuencia
        temp = sorted(temp_, key=len)
    
        for i in temp:
            w.write(str(i))
            w.write("\n") 
    
    
    with open(output_tree_lengths, "r") as input_file:
        contenido = input_file.read()
        brackets = contenido.replace("[", "").replace("]", "")
    with open(output_tree_lengths, "w") as output_file:
        output_file.write(brackets)
    with open(output_found_pos, 'w') as file:
        for coord in coordenada_encontrada:
            file.write(f"{chrom}\t{coord}\n")


### Concatenates distances per chromosome into a single whole genome file.


ensembl = EnsemblRelease(75)

# Define the output file
output_file = 'immune_system_process/wgs_immunesys_nonsyn_distances.txt'


# Open the output file in write mode
with open(output_file, 'w') as outfile:
    # Loop through files numbered 1 to 22
    for i in range(1, 23):  # 23 because range is exclusive of the upper bound
        input_file = f'immune_system_process/chr{i}_GO_nonsyn_distances.txt'  # Adjust the file name pattern as needed
        try:
            with open(input_file, 'r') as infile:
                outfile.write(infile.read())
        except FileNotFoundError:
            print(f"File {input_file} not found, skipping...")
            
output_file = 'immune_system_process/wgs_immunesys_confirmed_pos.txt'

with open(output_file, 'w') as outfile:
    for i in range(1, 23):
        filename = f"immune_system_process/chr{i}_go_succesful_nonsyn_pos.txt"
        try:
            # Open each input file
            with open(filename, 'r') as infile:
                outfile.write(infile.read())
                outfile.write('\n')
        except FileNotFoundError:
            print(f"File {filename} not found. Skipping...")

            
print("Distance file for matrix construction ready")


###Calculates the total number of nonsyn sites for this GO term. 

###From list of positions found, curate and rconstruct the coordiantes

# Initialize an empty list to store the coordinates
coordinates = []

# Open and read the tab-separated file
with open('extracelular_region/wgs_extracellularregion_confirmed_pos.txt', 'r') as file:
    for line in file:
        # Split each line by tab and strip any whitespace
        columns = line.strip().split('\t')
        # Ensure the line has exactly two columns
        if len(columns) == 2:
            # Convert to tuple with first column as string, second as integer
            second_column_float = float(columns[1])  # Handles '19137290.0'
            second_column_int = int(second_column_float)  # Converts to 19137290
            coordinates.append((columns[0], second_column_int))
            
len(coordinates)

## Retrieves a set of gene IDs corresponding to found coordiantes. 

# Initialize an empty set to store unique GeneIDs (sets ensure uniqueness)
unique_gene_ids = set()

# Iterate through the coordinates list
for chrom, pos in coordinates:
    try:
        # Query Ensembl for genes at the given chromosome and position
        genes = ensembl.genes_at_locus(contig=chrom, position=pos)
        if genes:
            # Add each gene's ID to the set
            for gene in genes:
                unique_gene_ids.add(gene.id)
        # No need to print "No gene found" unless you want to log it
    except ValueError as e:
        print(f"Chromosome: {chrom}, Position: {pos}, Error: {e}")

# Convert the set to a sorted list (vector) for consistent output
gene_id_vector = sorted(list(unique_gene_ids))

# Print the resulting vector to verify
print("Unique GeneIDs:", gene_id_vector)

### From these validated Gene IDs, find total number of base pairs from total exon counts. 





# Initialize pyensembl with Ensembl Release 75 (GRCh37/hg19)
ensembl = EnsemblRelease(release=75, species="homo_sapiens")

total_nonsyn_sites = []

for unique_id in gene_id_vector: 
    id_length = 0
    gene = ensembl.gene_by_id(unique_id)
    transcript_ids = ensembl.transcript_ids_of_gene_id(unique_id)

    total_transcript_exon_lengths = []
    transcript_exon_starts = []
    transcript_exon_ends = []
    i = 0 

    print(f"{unique_id} gene contains {len(transcript_ids)} transcripts")

    #Por cada transcrito
    for transcript_id in transcript_ids: #Para cada transcrito
        i = i +1
        transcript = ensembl.transcript_by_id(transcript_id)
        transcript_exon_length = []
    
        # Filter for protein-coding transcripts
        if transcript.biotype == "protein_coding": #Si es protein coding, procede. 
            #print(f"Transcript: {transcript.id}, Biotype: {transcript.biotype}")
            exons = transcript.exons #llama al exon. 
            print(f"This transcript contains {len(exons)} exons")
            for exon in exons: #por cada exon
                exon_length = exon.end - exon.start + 1  # Calculate length in base pairs
                #print(f"Exon start: {exon.start}. Exon end: {exon.end}")
                transcript_exon_length.append(exon_length) #Aqui pondría la longitud de cada exon. 
                transcript_exon_starts.append(exon.start) 
                transcript_exon_ends.append(exon.end)
            transcript_length = sum(transcript_exon_length)
            total_transcript_exon_lengths.append(transcript_length)
            #print(f"Lenth of this transcript is: {transcript_length}")     
        
    #print(f"Total length of exons across all transcripts is: {sum(total_transcript_exon_lengths)}")
    #print(f"ENSG00000257923 gene has {i} transcripts")

    def find_all_indices_loop(lst):
        indices = {}
        for i, num in enumerate(lst):
            if num in indices:
                indices[num].append(i)
            else:
                indices[num] = [i]
        return indices

    #ok this was the fucking bug. list musted be sorted. 
    transcript_exon_starts.sort()
    transcript_exon_ends.sort()
    result = find_all_indices_loop(transcript_exon_ends)


    effective_ranges = []

    for value in result.values():
        #print(f"Indices: {value}")
    
        if len(value) > 1:
            range_start = value[0] #start of range 
            range_end = value[-1] #end of range
            range_end_index = range_end + 1
            real_start_value = min(transcript_exon_starts[range_start:range_end_index])
            real_end_value = transcript_exon_ends[range_end]
            effective_ranges.append((real_start_value, real_end_value))
            #print(f"effective exon range is ({real_start_value} - {real_end_value})")
        else:
            real_start_value = transcript_exon_starts[value[0]]
            real_end_value = transcript_exon_ends[value[0]]
            effective_ranges.append((real_start_value, real_end_value))
            #print(f"effective exon range is ({real_start_value} - {real_end_value})")

    unique_dict = {tup[0]: tup for tup in effective_ranges}  # Dictionary keeps last tuple per first value
    effective_ranges_sorted = list(unique_dict.values())

    #print(f"effective exon ranges are: {effective_ranges_sorted}")

    differences=[]
    for ranges in effective_ranges_sorted:
        diff = ranges[1] - ranges[0]
        differences.append(diff)

    Total_exons_length = sum(differences)
    
    total_nonsyn_sites.append(Total_exons_length)
    
    print(f"Total coding bp's in this gene: {Total_exons_length}")
        
print("\n")
print(f"Total coding sites in these genes: {sum(total_nonsyn_sites)}")

    #Ok this worked for one case, but theres a bug, and it doesnt work in all cases. 
    # How I construct "effective_ranges" is wrong for this case. 

#Verifying data 
print(sum(total_nonsyn_sites))
#This is the proportion of nonsyn sites (guesstimate)
2.31/3.31
#

result = sum(total_nonsyn_sites) * (2.31/3.31)

print(result)


with open("extracelular_region/extracellular_sites.txt", "w") as file:
    file.write(f"Total nonsyn sites for extracelluar GO: {result}\n")


