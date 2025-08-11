
#Change contig/chromosome accordingly 
import tskit
import numpy as np
import stdpopsim

#Experiment chr2

species = stdpopsim.get_species("HomSap")
dfe = species.get_dfe("Gamma_K17")
contig = species.get_contig("chr2", genetic_map="HapMapII_GRCh38")
model = species.get_demographic_model("OutOfAfrica_3G09")
samples = {"YRI": 100}

exons = species.get_annotations("ensembl_havana_104_exons")
exon_intervals = exons.get_chromosome_annotations("chr2")
contig.add_dfe(intervals=exon_intervals, DFE=dfe)

###Runs the simulation
engine = stdpopsim.get_engine("slim")
ts = engine.simulate(
    model,
    contig,
    samples,
    seed=222,
    slim_scaling_factor=1,
    slim_burn_in=10,
)

ts.dump("Complete_chr2_stdpopsim_replica1.trees")
