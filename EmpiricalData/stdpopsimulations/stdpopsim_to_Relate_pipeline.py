
import tskit
import numpy as np

###This code was used for extracting "synonymous" and coding sites from a Relate inferred stdpopsimulation.
### It first extracts a list of syn and coding sites from the ture trees and then uses those coordinates to isolate local trees on the Relate-inferred local trees.
###The final output is a list of coalescent times used to compute the coalescent matrix used for likelihood inference.
###This requires first to generate a VCF from the stdpopsimulation and infer that VCF with Relate. To then convert to treesequence/tskit format. 


#Simulated tree 
true_chr1 = tskit.load("Complete_chr1_stdpopsim_replica1.trees")
#Relate inference of same simulation 
Relate_chr1 = tskit.load("chr1_stdpopsim_replica1.relate.tskit.trees")

#Extract positions of synonymous sites from the true tree 
#Syn sites are those that have a selection coefficient lower than 1e-5

syn_pos_list=[]

for arbol in true_chr1.trees():  # Cada arbol de la secuencia de arboles
    for mutations in arbol.mutations():  # Cada mutación del arbol
        mut = getattr(mutations, 'metadata')  # Me interesa extraer los metadatos donde encuentro el tipo de mutacion
        site_id = getattr(mutations, 'site')
        mut_type = mut["mutation_list"][0]["mutation_type"]  # Hay 2 tipos de mutación, mutaciones dos son deletereas y de interes
        if mut_type == 2:  # Si es mutación 2 entonces
            mut_coef = mut["mutation_list"][0]["selection_coeff"]
            mut_coef = str(abs(mut_coef))
            if 'e' in mut_coef:
                part = mut_coef.split('e')
                exponent_part = part[1]
                exponent = int(exponent_part)
                if exponent <= -5:
                    print("mutation found")
                    sitio = true_chr1.site(site_id)
                    pos = getattr(sitio, 'position')
                    syn_pos_list.append(pos)
                    print(pos)
                    #Extraer la coordenada/posición 
#save to a list
np.savetxt('syn_positions.txt', syn_pos_list, fmt='%d', newline='\n')

#Coding sites are all sites that are found in stdpopsim DFE annotations (includes syn sites)

coding_pos_list=[]

for arbol in true_chr1.trees():  # Cada arbol de la secuencia de arboles
    for mutations in arbol.mutations():  # Cada mutación del arbol
        mut = getattr(mutations, 'metadata')  # Me interesa extraer los metadatos donde encuentro el tipo de mutacion
        site_id = getattr(mutations, 'site')
        mut_type = mut["mutation_list"][0]["mutation_type"]  # Hay 2 tipos de mutación, mutaciones dos son deletereas y de interes
        if mut_type == 2:  # Si es mutación 2 entonces
            sitio = true_chr1.site(site_id)
            pos = getattr(sitio, 'position')
            coding_pos_list.append(pos)
            print(pos)

#save to a list                    
np.savetxt('coding_positions.txt', syn_pos_list, fmt='%d', newline='\n')


###Isolate local trees from coding sites on the Relate inferred treeseq

coding_pos_list = np.loadtxt('coding_positions.txt', dtype=np.int64)  # Use int64 for integers, or float64 for floats

coding_pos_set = set(coding_pos_list)

temp_ = []

# Your loop over tree sequence
with open(f"chr1_stdpopsim_Relate_distancias_coding.txt", 'w') as w:
    for arbol in Relate_chr1.trees():
        for site in arbol.sites():
            pos = getattr(site, "position")  # Scalar position (e.g., 12345.0)
            # Check if pos is in true_pos_list
            is_in_list = pos in coding_pos_set  # O(1) lookup
            if is_in_list:
                mut = getattr(site, "mutations")
                if mut:  # Ensure mutations list is not empty
                    sub_arbol = mut[0].node  # Node ID of first mutation
                    hijo = arbol.children(sub_arbol)
                    arbolito = arbol.as_newick(root=sub_arbol)
                    distancia = arbol.branch_length(sub_arbol) #Distancia total del sub arbol
                    num_muestras = arbol.num_samples(sub_arbol)
                
                    lista_sub_arbol = [] #Aqui voy guardando las distancias
                    lista_subarbol_ordenada = [] #Aqui ordeno las distancias de arriba
                
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
                        
                #print(lista_subarbol_ordenada)
                
    ##Sortea por frecuencia
    temp = sorted(temp_, key=len)

    for i in temp:
        w.write(str(i))
        w.write("\n") 

with open(f"chr1_stdpopsim_Relate_distancias_coding.txt", "r") as input_file:
    contenido = input_file.read()
    brackets = contenido.replace("[", "").replace("]", "")
with open(f"chr1_stdpopsim_Relate_distancias_coding.txt", "w") as output_file:
    output_file.write(brackets)


###Isolate local trees from synonymous sites on the Relate inferred treeseq

syn_pos_list = np.loadtxt('syn_positions.txt', dtype=np.int64)  # Use int64 for integers, or float64 for floats
syn_pos_set = set(syn_pos_list)

a = 0

temp_ = []

# Your loop over tree sequence
with open(f"chr1_stdpopsim_Relate_distancias_sinonimas.txt", 'w') as w:
    for arbol in Relate_chr1.trees():
        for site in arbol.sites():
            pos = getattr(site, "position")  # Scalar position (e.g., 12345.0)
            # Check if pos is in true_pos_list
            is_in_list = pos in syn_pos_set  # O(1) lookup
            if is_in_list:
                mut = getattr(site, "mutations")
                if mut:  # Ensure mutations list is not empty
                    sub_arbol = mut[0].node  # Node ID of first mutation
                    distancia = arbol.branch_length(sub_arbol) #Distancia total del sub arbol
                    num_muestras = arbol.num_samples(sub_arbol)
                
                    lista_sub_arbol = [] #Aqui voy guardando las distancias
                    lista_subarbol_ordenada = [] #Aqui ordeno las distancias de arriba
                
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
                        
                a = a + 1
                
    ##Sortea por frecuencia
    temp = sorted(temp_, key=len)

    for i in temp:
        w.write(str(i))
        w.write("\n") 

with open(f"chr1_stdpopsim_Relate_distancias_sinonimas.txt", "r") as input_file:
    contenido = input_file.read()
    brackets = contenido.replace("[", "").replace("]", "")
with open(f"chr1_stdpopsim_Relate_distancias_sinonimas.txt", "w") as output_file:
    output_file.write(brackets)



