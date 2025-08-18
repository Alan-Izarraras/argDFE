###This script takes Relate inferred arg converted to the tskit treesequence format and extracts derived allele branch lengths into a distances file for matrix construction. 
#This matrix is the file used for computing inferences. 

from pyensembl import EnsemblRelease
import pandas as pd
import csv
import numpy as np
import tskit
import os 

###Pending capability to process both syn and nonsyn with the same script run. Right now input name must be implicit.

task_id = os.getenv('SLURM_ARRAY_TASK_ID')
output_tree_lengths = f"Distances/chr{task_id}_distances.txt"
vep_positions = f"vep_coordinates/chr{task_id}.sinonimo.ready.txt"
chrX=f"1kg_yoruba/chr{task_id}_yri.tskit.trees"
chrom = tskit.load(chrX)

vector_coordenadas = np.loadtxt(vep_positions)
vector_coordenadas_set = set(vector_coordenadas)  # Convert to set for faster lookup

print("number of syn coordiantes in current chromosome is:")
print(len(vector_coordenadas_set))

coordenada_encontrada = []
temp_ = []

a = 0  # Counter for singletons and doubletons
b = 0  # Counter for normal trees

with open(output_tree_lengths, 'w') as w:
    for arbol in chrom.trees():
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

#####this should work. This now works. Now I just need to build matrices from here. 
