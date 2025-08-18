rm: cannot remove '../Data/Parameters/DemographyData226.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/Alleles_226.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/Traj_226.txt': No such file or directory
GSL_RNG_TYPE=mrg
GSL_RNG_SEED=226
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/trees_ABCDemography_226.txt': No such file or directory
GSL_RNG_TYPE=mrg
GSL_RNG_SEED=226
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.005.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.010.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.015.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.020.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.025.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.030.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.035.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.040.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.045.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.050.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.055.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.060.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.065.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
NO! at ../../prefersim_additionals/Traj_mssel_2.pl line 21.
 file format error.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.070.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
Second argument error. howmany <= 0. 
usage: mssel nsam howmany nanc nder selfilename selspot -r rho nsites [options] 
  Options: 
	 -t theta   (this option and/or the next must be used. Theta = 4*N0*u )
	 -s segsites   ( fixed number of segregating sites)
	 -T          (Output gene tree.)
	 -F minfreq     Output only sites with freq of minor allele >= minfreq.
	 -r rho nsites     (rho here is 4Nc)
		 -c f track_len   (f = ratio of conversion rate to rec rate. tracklen is mean length.) 
			 if rho = 0.,  f = 4*N0*g, with g the gene conversion rate.
	 -G alpha  ( N(t) = N0*exp(-alpha*t) .  alpha = -log(Np/Nr)/t
	 -I npop n1 n2 ... [mig_rate] (all elements of mig matrix set to mig_rate/(npop-1) 
		 -m i j m_ij    (i,j-th element of mig matrix set to m_ij.)
		 -ma m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
		 -n i size_i   (popi has size set to size_i*N0 
		 -g i alpha_i  (If used must appear after -M option.)
	   The following options modify parameters at the time 't' specified as the first argument:
	 -eG t alpha  (Modify growth rate of all pop's.)
	 -eg t i alpha_i  (Modify growth rate of pop i.) 
	 -eM t mig_rate   (Modify the mig matrix so all elements are mig_rate/(npop-1)
	 -em t i j m_ij    (i,j-th element of mig matrix set to m_ij at time t )
	 -ema t npop  m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
	 -eN t size  (Modify pop sizes. New sizes = size*N0 ) 
	 -en t i size_i  (Modify pop size of pop i.  New size of popi = size_i*N0 .)
	 -es t i proportion  (Split: pop i -> pop-i + pop-npop, npop increases by 1.
		 proportion is probability that each lineage stays in pop-i. (p, 1-p are admixt. proport.
		 Size of pop npop is set to N0 and alpha = 0.0 , size and alpha of pop i are unchanged.
	 -ej t i j   ( Join lineages in pop i and pop j into pop j
		  size, alpha and M are unchanged.
	  -f filename     ( Read command line arguments from file filename.)
 See msdoc.pdf for explanation of these parameters.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.075.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.080.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.085.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.090.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.095.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
NO! at ../../prefersim_additionals/Traj_mssel_2.pl line 21.
 file format error.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.100.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
Second argument error. howmany <= 0. 
usage: mssel nsam howmany nanc nder selfilename selspot -r rho nsites [options] 
  Options: 
	 -t theta   (this option and/or the next must be used. Theta = 4*N0*u )
	 -s segsites   ( fixed number of segregating sites)
	 -T          (Output gene tree.)
	 -F minfreq     Output only sites with freq of minor allele >= minfreq.
	 -r rho nsites     (rho here is 4Nc)
		 -c f track_len   (f = ratio of conversion rate to rec rate. tracklen is mean length.) 
			 if rho = 0.,  f = 4*N0*g, with g the gene conversion rate.
	 -G alpha  ( N(t) = N0*exp(-alpha*t) .  alpha = -log(Np/Nr)/t
	 -I npop n1 n2 ... [mig_rate] (all elements of mig matrix set to mig_rate/(npop-1) 
		 -m i j m_ij    (i,j-th element of mig matrix set to m_ij.)
		 -ma m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
		 -n i size_i   (popi has size set to size_i*N0 
		 -g i alpha_i  (If used must appear after -M option.)
	   The following options modify parameters at the time 't' specified as the first argument:
	 -eG t alpha  (Modify growth rate of all pop's.)
	 -eg t i alpha_i  (Modify growth rate of pop i.) 
	 -eM t mig_rate   (Modify the mig matrix so all elements are mig_rate/(npop-1)
	 -em t i j m_ij    (i,j-th element of mig matrix set to m_ij at time t )
	 -ema t npop  m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
	 -eN t size  (Modify pop sizes. New sizes = size*N0 ) 
	 -en t i size_i  (Modify pop size of pop i.  New size of popi = size_i*N0 .)
	 -es t i proportion  (Split: pop i -> pop-i + pop-npop, npop increases by 1.
		 proportion is probability that each lineage stays in pop-i. (p, 1-p are admixt. proport.
		 Size of pop npop is set to N0 and alpha = 0.0 , size and alpha of pop i are unchanged.
	 -ej t i j   ( Join lineages in pop i and pop j into pop j
		  size, alpha and M are unchanged.
	  -f filename     ( Read command line arguments from file filename.)
 See msdoc.pdf for explanation of these parameters.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.105.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.110.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.115.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
NO! at ../../prefersim_additionals/Traj_mssel_2.pl line 21.
 file format error.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.120.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
Second argument error. howmany <= 0. 
usage: mssel nsam howmany nanc nder selfilename selspot -r rho nsites [options] 
  Options: 
	 -t theta   (this option and/or the next must be used. Theta = 4*N0*u )
	 -s segsites   ( fixed number of segregating sites)
	 -T          (Output gene tree.)
	 -F minfreq     Output only sites with freq of minor allele >= minfreq.
	 -r rho nsites     (rho here is 4Nc)
		 -c f track_len   (f = ratio of conversion rate to rec rate. tracklen is mean length.) 
			 if rho = 0.,  f = 4*N0*g, with g the gene conversion rate.
	 -G alpha  ( N(t) = N0*exp(-alpha*t) .  alpha = -log(Np/Nr)/t
	 -I npop n1 n2 ... [mig_rate] (all elements of mig matrix set to mig_rate/(npop-1) 
		 -m i j m_ij    (i,j-th element of mig matrix set to m_ij.)
		 -ma m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
		 -n i size_i   (popi has size set to size_i*N0 
		 -g i alpha_i  (If used must appear after -M option.)
	   The following options modify parameters at the time 't' specified as the first argument:
	 -eG t alpha  (Modify growth rate of all pop's.)
	 -eg t i alpha_i  (Modify growth rate of pop i.) 
	 -eM t mig_rate   (Modify the mig matrix so all elements are mig_rate/(npop-1)
	 -em t i j m_ij    (i,j-th element of mig matrix set to m_ij at time t )
	 -ema t npop  m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
	 -eN t size  (Modify pop sizes. New sizes = size*N0 ) 
	 -en t i size_i  (Modify pop size of pop i.  New size of popi = size_i*N0 .)
	 -es t i proportion  (Split: pop i -> pop-i + pop-npop, npop increases by 1.
		 proportion is probability that each lineage stays in pop-i. (p, 1-p are admixt. proport.
		 Size of pop npop is set to N0 and alpha = 0.0 , size and alpha of pop i are unchanged.
	 -ej t i j   ( Join lineages in pop i and pop j into pop j
		  size, alpha and M are unchanged.
	  -f filename     ( Read command line arguments from file filename.)
 See msdoc.pdf for explanation of these parameters.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.125.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.130.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
NO! at ../../prefersim_additionals/Traj_mssel_2.pl line 21.
 file format error.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.135.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
Second argument error. howmany <= 0. 
usage: mssel nsam howmany nanc nder selfilename selspot -r rho nsites [options] 
  Options: 
	 -t theta   (this option and/or the next must be used. Theta = 4*N0*u )
	 -s segsites   ( fixed number of segregating sites)
	 -T          (Output gene tree.)
	 -F minfreq     Output only sites with freq of minor allele >= minfreq.
	 -r rho nsites     (rho here is 4Nc)
		 -c f track_len   (f = ratio of conversion rate to rec rate. tracklen is mean length.) 
			 if rho = 0.,  f = 4*N0*g, with g the gene conversion rate.
	 -G alpha  ( N(t) = N0*exp(-alpha*t) .  alpha = -log(Np/Nr)/t
	 -I npop n1 n2 ... [mig_rate] (all elements of mig matrix set to mig_rate/(npop-1) 
		 -m i j m_ij    (i,j-th element of mig matrix set to m_ij.)
		 -ma m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
		 -n i size_i   (popi has size set to size_i*N0 
		 -g i alpha_i  (If used must appear after -M option.)
	   The following options modify parameters at the time 't' specified as the first argument:
	 -eG t alpha  (Modify growth rate of all pop's.)
	 -eg t i alpha_i  (Modify growth rate of pop i.) 
	 -eM t mig_rate   (Modify the mig matrix so all elements are mig_rate/(npop-1)
	 -em t i j m_ij    (i,j-th element of mig matrix set to m_ij at time t )
	 -ema t npop  m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
	 -eN t size  (Modify pop sizes. New sizes = size*N0 ) 
	 -en t i size_i  (Modify pop size of pop i.  New size of popi = size_i*N0 .)
	 -es t i proportion  (Split: pop i -> pop-i + pop-npop, npop increases by 1.
		 proportion is probability that each lineage stays in pop-i. (p, 1-p are admixt. proport.
		 Size of pop npop is set to N0 and alpha = 0.0 , size and alpha of pop i are unchanged.
	 -ej t i j   ( Join lineages in pop i and pop j into pop j
		  size, alpha and M are unchanged.
	  -f filename     ( Read command line arguments from file filename.)
 See msdoc.pdf for explanation of these parameters.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.140.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
NO! at ../../prefersim_additionals/Traj_mssel_2.pl line 21.
 file format error.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.145.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
Second argument error. howmany <= 0. 
usage: mssel nsam howmany nanc nder selfilename selspot -r rho nsites [options] 
  Options: 
	 -t theta   (this option and/or the next must be used. Theta = 4*N0*u )
	 -s segsites   ( fixed number of segregating sites)
	 -T          (Output gene tree.)
	 -F minfreq     Output only sites with freq of minor allele >= minfreq.
	 -r rho nsites     (rho here is 4Nc)
		 -c f track_len   (f = ratio of conversion rate to rec rate. tracklen is mean length.) 
			 if rho = 0.,  f = 4*N0*g, with g the gene conversion rate.
	 -G alpha  ( N(t) = N0*exp(-alpha*t) .  alpha = -log(Np/Nr)/t
	 -I npop n1 n2 ... [mig_rate] (all elements of mig matrix set to mig_rate/(npop-1) 
		 -m i j m_ij    (i,j-th element of mig matrix set to m_ij.)
		 -ma m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
		 -n i size_i   (popi has size set to size_i*N0 
		 -g i alpha_i  (If used must appear after -M option.)
	   The following options modify parameters at the time 't' specified as the first argument:
	 -eG t alpha  (Modify growth rate of all pop's.)
	 -eg t i alpha_i  (Modify growth rate of pop i.) 
	 -eM t mig_rate   (Modify the mig matrix so all elements are mig_rate/(npop-1)
	 -em t i j m_ij    (i,j-th element of mig matrix set to m_ij at time t )
	 -ema t npop  m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
	 -eN t size  (Modify pop sizes. New sizes = size*N0 ) 
	 -en t i size_i  (Modify pop size of pop i.  New size of popi = size_i*N0 .)
	 -es t i proportion  (Split: pop i -> pop-i + pop-npop, npop increases by 1.
		 proportion is probability that each lineage stays in pop-i. (p, 1-p are admixt. proport.
		 Size of pop npop is set to N0 and alpha = 0.0 , size and alpha of pop i are unchanged.
	 -ej t i j   ( Join lineages in pop i and pop j into pop j
		  size, alpha and M are unchanged.
	  -f filename     ( Read command line arguments from file filename.)
 See msdoc.pdf for explanation of these parameters.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.150.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
NO! at ../../prefersim_additionals/Traj_mssel_2.pl line 21.
 file format error.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.155.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
Second argument error. howmany <= 0. 
usage: mssel nsam howmany nanc nder selfilename selspot -r rho nsites [options] 
  Options: 
	 -t theta   (this option and/or the next must be used. Theta = 4*N0*u )
	 -s segsites   ( fixed number of segregating sites)
	 -T          (Output gene tree.)
	 -F minfreq     Output only sites with freq of minor allele >= minfreq.
	 -r rho nsites     (rho here is 4Nc)
		 -c f track_len   (f = ratio of conversion rate to rec rate. tracklen is mean length.) 
			 if rho = 0.,  f = 4*N0*g, with g the gene conversion rate.
	 -G alpha  ( N(t) = N0*exp(-alpha*t) .  alpha = -log(Np/Nr)/t
	 -I npop n1 n2 ... [mig_rate] (all elements of mig matrix set to mig_rate/(npop-1) 
		 -m i j m_ij    (i,j-th element of mig matrix set to m_ij.)
		 -ma m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
		 -n i size_i   (popi has size set to size_i*N0 
		 -g i alpha_i  (If used must appear after -M option.)
	   The following options modify parameters at the time 't' specified as the first argument:
	 -eG t alpha  (Modify growth rate of all pop's.)
	 -eg t i alpha_i  (Modify growth rate of pop i.) 
	 -eM t mig_rate   (Modify the mig matrix so all elements are mig_rate/(npop-1)
	 -em t i j m_ij    (i,j-th element of mig matrix set to m_ij at time t )
	 -ema t npop  m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
	 -eN t size  (Modify pop sizes. New sizes = size*N0 ) 
	 -en t i size_i  (Modify pop size of pop i.  New size of popi = size_i*N0 .)
	 -es t i proportion  (Split: pop i -> pop-i + pop-npop, npop increases by 1.
		 proportion is probability that each lineage stays in pop-i. (p, 1-p are admixt. proport.
		 Size of pop npop is set to N0 and alpha = 0.0 , size and alpha of pop i are unchanged.
	 -ej t i j   ( Join lineages in pop i and pop j into pop j
		  size, alpha and M are unchanged.
	  -f filename     ( Read command line arguments from file filename.)
 See msdoc.pdf for explanation of these parameters.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.160.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.165.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
NO! at ../../prefersim_additionals/Traj_mssel_2.pl line 21.
 file format error.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.170.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
Second argument error. howmany <= 0. 
usage: mssel nsam howmany nanc nder selfilename selspot -r rho nsites [options] 
  Options: 
	 -t theta   (this option and/or the next must be used. Theta = 4*N0*u )
	 -s segsites   ( fixed number of segregating sites)
	 -T          (Output gene tree.)
	 -F minfreq     Output only sites with freq of minor allele >= minfreq.
	 -r rho nsites     (rho here is 4Nc)
		 -c f track_len   (f = ratio of conversion rate to rec rate. tracklen is mean length.) 
			 if rho = 0.,  f = 4*N0*g, with g the gene conversion rate.
	 -G alpha  ( N(t) = N0*exp(-alpha*t) .  alpha = -log(Np/Nr)/t
	 -I npop n1 n2 ... [mig_rate] (all elements of mig matrix set to mig_rate/(npop-1) 
		 -m i j m_ij    (i,j-th element of mig matrix set to m_ij.)
		 -ma m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
		 -n i size_i   (popi has size set to size_i*N0 
		 -g i alpha_i  (If used must appear after -M option.)
	   The following options modify parameters at the time 't' specified as the first argument:
	 -eG t alpha  (Modify growth rate of all pop's.)
	 -eg t i alpha_i  (Modify growth rate of pop i.) 
	 -eM t mig_rate   (Modify the mig matrix so all elements are mig_rate/(npop-1)
	 -em t i j m_ij    (i,j-th element of mig matrix set to m_ij at time t )
	 -ema t npop  m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
	 -eN t size  (Modify pop sizes. New sizes = size*N0 ) 
	 -en t i size_i  (Modify pop size of pop i.  New size of popi = size_i*N0 .)
	 -es t i proportion  (Split: pop i -> pop-i + pop-npop, npop increases by 1.
		 proportion is probability that each lineage stays in pop-i. (p, 1-p are admixt. proport.
		 Size of pop npop is set to N0 and alpha = 0.0 , size and alpha of pop i are unchanged.
	 -ej t i j   ( Join lineages in pop i and pop j into pop j
		  size, alpha and M are unchanged.
	  -f filename     ( Read command line arguments from file filename.)
 See msdoc.pdf for explanation of these parameters.
NO! at ../../prefersim_additionals/Traj_mssel_2.pl line 21.
 file format error.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.175.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
Second argument error. howmany <= 0. 
usage: mssel nsam howmany nanc nder selfilename selspot -r rho nsites [options] 
  Options: 
	 -t theta   (this option and/or the next must be used. Theta = 4*N0*u )
	 -s segsites   ( fixed number of segregating sites)
	 -T          (Output gene tree.)
	 -F minfreq     Output only sites with freq of minor allele >= minfreq.
	 -r rho nsites     (rho here is 4Nc)
		 -c f track_len   (f = ratio of conversion rate to rec rate. tracklen is mean length.) 
			 if rho = 0.,  f = 4*N0*g, with g the gene conversion rate.
	 -G alpha  ( N(t) = N0*exp(-alpha*t) .  alpha = -log(Np/Nr)/t
	 -I npop n1 n2 ... [mig_rate] (all elements of mig matrix set to mig_rate/(npop-1) 
		 -m i j m_ij    (i,j-th element of mig matrix set to m_ij.)
		 -ma m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
		 -n i size_i   (popi has size set to size_i*N0 
		 -g i alpha_i  (If used must appear after -M option.)
	   The following options modify parameters at the time 't' specified as the first argument:
	 -eG t alpha  (Modify growth rate of all pop's.)
	 -eg t i alpha_i  (Modify growth rate of pop i.) 
	 -eM t mig_rate   (Modify the mig matrix so all elements are mig_rate/(npop-1)
	 -em t i j m_ij    (i,j-th element of mig matrix set to m_ij at time t )
	 -ema t npop  m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
	 -eN t size  (Modify pop sizes. New sizes = size*N0 ) 
	 -en t i size_i  (Modify pop size of pop i.  New size of popi = size_i*N0 .)
	 -es t i proportion  (Split: pop i -> pop-i + pop-npop, npop increases by 1.
		 proportion is probability that each lineage stays in pop-i. (p, 1-p are admixt. proport.
		 Size of pop npop is set to N0 and alpha = 0.0 , size and alpha of pop i are unchanged.
	 -ej t i j   ( Join lineages in pop i and pop j into pop j
		  size, alpha and M are unchanged.
	  -f filename     ( Read command line arguments from file filename.)
 See msdoc.pdf for explanation of these parameters.
NO! at ../../prefersim_additionals/Traj_mssel_2.pl line 21.
 file format error.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.180.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
Second argument error. howmany <= 0. 
usage: mssel nsam howmany nanc nder selfilename selspot -r rho nsites [options] 
  Options: 
	 -t theta   (this option and/or the next must be used. Theta = 4*N0*u )
	 -s segsites   ( fixed number of segregating sites)
	 -T          (Output gene tree.)
	 -F minfreq     Output only sites with freq of minor allele >= minfreq.
	 -r rho nsites     (rho here is 4Nc)
		 -c f track_len   (f = ratio of conversion rate to rec rate. tracklen is mean length.) 
			 if rho = 0.,  f = 4*N0*g, with g the gene conversion rate.
	 -G alpha  ( N(t) = N0*exp(-alpha*t) .  alpha = -log(Np/Nr)/t
	 -I npop n1 n2 ... [mig_rate] (all elements of mig matrix set to mig_rate/(npop-1) 
		 -m i j m_ij    (i,j-th element of mig matrix set to m_ij.)
		 -ma m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
		 -n i size_i   (popi has size set to size_i*N0 
		 -g i alpha_i  (If used must appear after -M option.)
	   The following options modify parameters at the time 't' specified as the first argument:
	 -eG t alpha  (Modify growth rate of all pop's.)
	 -eg t i alpha_i  (Modify growth rate of pop i.) 
	 -eM t mig_rate   (Modify the mig matrix so all elements are mig_rate/(npop-1)
	 -em t i j m_ij    (i,j-th element of mig matrix set to m_ij at time t )
	 -ema t npop  m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
	 -eN t size  (Modify pop sizes. New sizes = size*N0 ) 
	 -en t i size_i  (Modify pop size of pop i.  New size of popi = size_i*N0 .)
	 -es t i proportion  (Split: pop i -> pop-i + pop-npop, npop increases by 1.
		 proportion is probability that each lineage stays in pop-i. (p, 1-p are admixt. proport.
		 Size of pop npop is set to N0 and alpha = 0.0 , size and alpha of pop i are unchanged.
	 -ej t i j   ( Join lineages in pop i and pop j into pop j
		  size, alpha and M are unchanged.
	  -f filename     ( Read command line arguments from file filename.)
 See msdoc.pdf for explanation of these parameters.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.185.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.190.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
NO! at ../../prefersim_additionals/Traj_mssel_2.pl line 21.
 file format error.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.195.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
Second argument error. howmany <= 0. 
usage: mssel nsam howmany nanc nder selfilename selspot -r rho nsites [options] 
  Options: 
	 -t theta   (this option and/or the next must be used. Theta = 4*N0*u )
	 -s segsites   ( fixed number of segregating sites)
	 -T          (Output gene tree.)
	 -F minfreq     Output only sites with freq of minor allele >= minfreq.
	 -r rho nsites     (rho here is 4Nc)
		 -c f track_len   (f = ratio of conversion rate to rec rate. tracklen is mean length.) 
			 if rho = 0.,  f = 4*N0*g, with g the gene conversion rate.
	 -G alpha  ( N(t) = N0*exp(-alpha*t) .  alpha = -log(Np/Nr)/t
	 -I npop n1 n2 ... [mig_rate] (all elements of mig matrix set to mig_rate/(npop-1) 
		 -m i j m_ij    (i,j-th element of mig matrix set to m_ij.)
		 -ma m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
		 -n i size_i   (popi has size set to size_i*N0 
		 -g i alpha_i  (If used must appear after -M option.)
	   The following options modify parameters at the time 't' specified as the first argument:
	 -eG t alpha  (Modify growth rate of all pop's.)
	 -eg t i alpha_i  (Modify growth rate of pop i.) 
	 -eM t mig_rate   (Modify the mig matrix so all elements are mig_rate/(npop-1)
	 -em t i j m_ij    (i,j-th element of mig matrix set to m_ij at time t )
	 -ema t npop  m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
	 -eN t size  (Modify pop sizes. New sizes = size*N0 ) 
	 -en t i size_i  (Modify pop size of pop i.  New size of popi = size_i*N0 .)
	 -es t i proportion  (Split: pop i -> pop-i + pop-npop, npop increases by 1.
		 proportion is probability that each lineage stays in pop-i. (p, 1-p are admixt. proport.
		 Size of pop npop is set to N0 and alpha = 0.0 , size and alpha of pop i are unchanged.
	 -ej t i j   ( Join lineages in pop i and pop j into pop j
		  size, alpha and M are unchanged.
	  -f filename     ( Read command line arguments from file filename.)
 See msdoc.pdf for explanation of these parameters.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.200.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
NO! at ../../prefersim_additionals/Traj_mssel_2.pl line 21.
 file format error.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.205.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
Second argument error. howmany <= 0. 
usage: mssel nsam howmany nanc nder selfilename selspot -r rho nsites [options] 
  Options: 
	 -t theta   (this option and/or the next must be used. Theta = 4*N0*u )
	 -s segsites   ( fixed number of segregating sites)
	 -T          (Output gene tree.)
	 -F minfreq     Output only sites with freq of minor allele >= minfreq.
	 -r rho nsites     (rho here is 4Nc)
		 -c f track_len   (f = ratio of conversion rate to rec rate. tracklen is mean length.) 
			 if rho = 0.,  f = 4*N0*g, with g the gene conversion rate.
	 -G alpha  ( N(t) = N0*exp(-alpha*t) .  alpha = -log(Np/Nr)/t
	 -I npop n1 n2 ... [mig_rate] (all elements of mig matrix set to mig_rate/(npop-1) 
		 -m i j m_ij    (i,j-th element of mig matrix set to m_ij.)
		 -ma m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
		 -n i size_i   (popi has size set to size_i*N0 
		 -g i alpha_i  (If used must appear after -M option.)
	   The following options modify parameters at the time 't' specified as the first argument:
	 -eG t alpha  (Modify growth rate of all pop's.)
	 -eg t i alpha_i  (Modify growth rate of pop i.) 
	 -eM t mig_rate   (Modify the mig matrix so all elements are mig_rate/(npop-1)
	 -em t i j m_ij    (i,j-th element of mig matrix set to m_ij at time t )
	 -ema t npop  m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
	 -eN t size  (Modify pop sizes. New sizes = size*N0 ) 
	 -en t i size_i  (Modify pop size of pop i.  New size of popi = size_i*N0 .)
	 -es t i proportion  (Split: pop i -> pop-i + pop-npop, npop increases by 1.
		 proportion is probability that each lineage stays in pop-i. (p, 1-p are admixt. proport.
		 Size of pop npop is set to N0 and alpha = 0.0 , size and alpha of pop i are unchanged.
	 -ej t i j   ( Join lineages in pop i and pop j into pop j
		  size, alpha and M are unchanged.
	  -f filename     ( Read command line arguments from file filename.)
 See msdoc.pdf for explanation of these parameters.
NO! at ../../prefersim_additionals/Traj_mssel_2.pl line 21.
 file format error.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.210.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
Second argument error. howmany <= 0. 
usage: mssel nsam howmany nanc nder selfilename selspot -r rho nsites [options] 
  Options: 
	 -t theta   (this option and/or the next must be used. Theta = 4*N0*u )
	 -s segsites   ( fixed number of segregating sites)
	 -T          (Output gene tree.)
	 -F minfreq     Output only sites with freq of minor allele >= minfreq.
	 -r rho nsites     (rho here is 4Nc)
		 -c f track_len   (f = ratio of conversion rate to rec rate. tracklen is mean length.) 
			 if rho = 0.,  f = 4*N0*g, with g the gene conversion rate.
	 -G alpha  ( N(t) = N0*exp(-alpha*t) .  alpha = -log(Np/Nr)/t
	 -I npop n1 n2 ... [mig_rate] (all elements of mig matrix set to mig_rate/(npop-1) 
		 -m i j m_ij    (i,j-th element of mig matrix set to m_ij.)
		 -ma m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
		 -n i size_i   (popi has size set to size_i*N0 
		 -g i alpha_i  (If used must appear after -M option.)
	   The following options modify parameters at the time 't' specified as the first argument:
	 -eG t alpha  (Modify growth rate of all pop's.)
	 -eg t i alpha_i  (Modify growth rate of pop i.) 
	 -eM t mig_rate   (Modify the mig matrix so all elements are mig_rate/(npop-1)
	 -em t i j m_ij    (i,j-th element of mig matrix set to m_ij at time t )
	 -ema t npop  m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
	 -eN t size  (Modify pop sizes. New sizes = size*N0 ) 
	 -en t i size_i  (Modify pop size of pop i.  New size of popi = size_i*N0 .)
	 -es t i proportion  (Split: pop i -> pop-i + pop-npop, npop increases by 1.
		 proportion is probability that each lineage stays in pop-i. (p, 1-p are admixt. proport.
		 Size of pop npop is set to N0 and alpha = 0.0 , size and alpha of pop i are unchanged.
	 -ej t i j   ( Join lineages in pop i and pop j into pop j
		  size, alpha and M are unchanged.
	  -f filename     ( Read command line arguments from file filename.)
 See msdoc.pdf for explanation of these parameters.
NO! at ../../prefersim_additionals/Traj_mssel_2.pl line 21.
 file format error.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.215.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
Second argument error. howmany <= 0. 
usage: mssel nsam howmany nanc nder selfilename selspot -r rho nsites [options] 
  Options: 
	 -t theta   (this option and/or the next must be used. Theta = 4*N0*u )
	 -s segsites   ( fixed number of segregating sites)
	 -T          (Output gene tree.)
	 -F minfreq     Output only sites with freq of minor allele >= minfreq.
	 -r rho nsites     (rho here is 4Nc)
		 -c f track_len   (f = ratio of conversion rate to rec rate. tracklen is mean length.) 
			 if rho = 0.,  f = 4*N0*g, with g the gene conversion rate.
	 -G alpha  ( N(t) = N0*exp(-alpha*t) .  alpha = -log(Np/Nr)/t
	 -I npop n1 n2 ... [mig_rate] (all elements of mig matrix set to mig_rate/(npop-1) 
		 -m i j m_ij    (i,j-th element of mig matrix set to m_ij.)
		 -ma m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
		 -n i size_i   (popi has size set to size_i*N0 
		 -g i alpha_i  (If used must appear after -M option.)
	   The following options modify parameters at the time 't' specified as the first argument:
	 -eG t alpha  (Modify growth rate of all pop's.)
	 -eg t i alpha_i  (Modify growth rate of pop i.) 
	 -eM t mig_rate   (Modify the mig matrix so all elements are mig_rate/(npop-1)
	 -em t i j m_ij    (i,j-th element of mig matrix set to m_ij at time t )
	 -ema t npop  m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
	 -eN t size  (Modify pop sizes. New sizes = size*N0 ) 
	 -en t i size_i  (Modify pop size of pop i.  New size of popi = size_i*N0 .)
	 -es t i proportion  (Split: pop i -> pop-i + pop-npop, npop increases by 1.
		 proportion is probability that each lineage stays in pop-i. (p, 1-p are admixt. proport.
		 Size of pop npop is set to N0 and alpha = 0.0 , size and alpha of pop i are unchanged.
	 -ej t i j   ( Join lineages in pop i and pop j into pop j
		  size, alpha and M are unchanged.
	  -f filename     ( Read command line arguments from file filename.)
 See msdoc.pdf for explanation of these parameters.
NO! at ../../prefersim_additionals/Traj_mssel_2.pl line 21.
 file format error.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.220.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
Second argument error. howmany <= 0. 
usage: mssel nsam howmany nanc nder selfilename selspot -r rho nsites [options] 
  Options: 
	 -t theta   (this option and/or the next must be used. Theta = 4*N0*u )
	 -s segsites   ( fixed number of segregating sites)
	 -T          (Output gene tree.)
	 -F minfreq     Output only sites with freq of minor allele >= minfreq.
	 -r rho nsites     (rho here is 4Nc)
		 -c f track_len   (f = ratio of conversion rate to rec rate. tracklen is mean length.) 
			 if rho = 0.,  f = 4*N0*g, with g the gene conversion rate.
	 -G alpha  ( N(t) = N0*exp(-alpha*t) .  alpha = -log(Np/Nr)/t
	 -I npop n1 n2 ... [mig_rate] (all elements of mig matrix set to mig_rate/(npop-1) 
		 -m i j m_ij    (i,j-th element of mig matrix set to m_ij.)
		 -ma m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
		 -n i size_i   (popi has size set to size_i*N0 
		 -g i alpha_i  (If used must appear after -M option.)
	   The following options modify parameters at the time 't' specified as the first argument:
	 -eG t alpha  (Modify growth rate of all pop's.)
	 -eg t i alpha_i  (Modify growth rate of pop i.) 
	 -eM t mig_rate   (Modify the mig matrix so all elements are mig_rate/(npop-1)
	 -em t i j m_ij    (i,j-th element of mig matrix set to m_ij at time t )
	 -ema t npop  m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
	 -eN t size  (Modify pop sizes. New sizes = size*N0 ) 
	 -en t i size_i  (Modify pop size of pop i.  New size of popi = size_i*N0 .)
	 -es t i proportion  (Split: pop i -> pop-i + pop-npop, npop increases by 1.
		 proportion is probability that each lineage stays in pop-i. (p, 1-p are admixt. proport.
		 Size of pop npop is set to N0 and alpha = 0.0 , size and alpha of pop i are unchanged.
	 -ej t i j   ( Join lineages in pop i and pop j into pop j
		  size, alpha and M are unchanged.
	  -f filename     ( Read command line arguments from file filename.)
 See msdoc.pdf for explanation of these parameters.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.225.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.230.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
NO! at ../../prefersim_additionals/Traj_mssel_2.pl line 21.
 file format error.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.235.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
Second argument error. howmany <= 0. 
usage: mssel nsam howmany nanc nder selfilename selspot -r rho nsites [options] 
  Options: 
	 -t theta   (this option and/or the next must be used. Theta = 4*N0*u )
	 -s segsites   ( fixed number of segregating sites)
	 -T          (Output gene tree.)
	 -F minfreq     Output only sites with freq of minor allele >= minfreq.
	 -r rho nsites     (rho here is 4Nc)
		 -c f track_len   (f = ratio of conversion rate to rec rate. tracklen is mean length.) 
			 if rho = 0.,  f = 4*N0*g, with g the gene conversion rate.
	 -G alpha  ( N(t) = N0*exp(-alpha*t) .  alpha = -log(Np/Nr)/t
	 -I npop n1 n2 ... [mig_rate] (all elements of mig matrix set to mig_rate/(npop-1) 
		 -m i j m_ij    (i,j-th element of mig matrix set to m_ij.)
		 -ma m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
		 -n i size_i   (popi has size set to size_i*N0 
		 -g i alpha_i  (If used must appear after -M option.)
	   The following options modify parameters at the time 't' specified as the first argument:
	 -eG t alpha  (Modify growth rate of all pop's.)
	 -eg t i alpha_i  (Modify growth rate of pop i.) 
	 -eM t mig_rate   (Modify the mig matrix so all elements are mig_rate/(npop-1)
	 -em t i j m_ij    (i,j-th element of mig matrix set to m_ij at time t )
	 -ema t npop  m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
	 -eN t size  (Modify pop sizes. New sizes = size*N0 ) 
	 -en t i size_i  (Modify pop size of pop i.  New size of popi = size_i*N0 .)
	 -es t i proportion  (Split: pop i -> pop-i + pop-npop, npop increases by 1.
		 proportion is probability that each lineage stays in pop-i. (p, 1-p are admixt. proport.
		 Size of pop npop is set to N0 and alpha = 0.0 , size and alpha of pop i are unchanged.
	 -ej t i j   ( Join lineages in pop i and pop j into pop j
		  size, alpha and M are unchanged.
	  -f filename     ( Read command line arguments from file filename.)
 See msdoc.pdf for explanation of these parameters.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.240.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.245.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
NO! at ../../prefersim_additionals/Traj_mssel_2.pl line 21.
 file format error.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.250.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
Second argument error. howmany <= 0. 
usage: mssel nsam howmany nanc nder selfilename selspot -r rho nsites [options] 
  Options: 
	 -t theta   (this option and/or the next must be used. Theta = 4*N0*u )
	 -s segsites   ( fixed number of segregating sites)
	 -T          (Output gene tree.)
	 -F minfreq     Output only sites with freq of minor allele >= minfreq.
	 -r rho nsites     (rho here is 4Nc)
		 -c f track_len   (f = ratio of conversion rate to rec rate. tracklen is mean length.) 
			 if rho = 0.,  f = 4*N0*g, with g the gene conversion rate.
	 -G alpha  ( N(t) = N0*exp(-alpha*t) .  alpha = -log(Np/Nr)/t
	 -I npop n1 n2 ... [mig_rate] (all elements of mig matrix set to mig_rate/(npop-1) 
		 -m i j m_ij    (i,j-th element of mig matrix set to m_ij.)
		 -ma m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
		 -n i size_i   (popi has size set to size_i*N0 
		 -g i alpha_i  (If used must appear after -M option.)
	   The following options modify parameters at the time 't' specified as the first argument:
	 -eG t alpha  (Modify growth rate of all pop's.)
	 -eg t i alpha_i  (Modify growth rate of pop i.) 
	 -eM t mig_rate   (Modify the mig matrix so all elements are mig_rate/(npop-1)
	 -em t i j m_ij    (i,j-th element of mig matrix set to m_ij at time t )
	 -ema t npop  m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
	 -eN t size  (Modify pop sizes. New sizes = size*N0 ) 
	 -en t i size_i  (Modify pop size of pop i.  New size of popi = size_i*N0 .)
	 -es t i proportion  (Split: pop i -> pop-i + pop-npop, npop increases by 1.
		 proportion is probability that each lineage stays in pop-i. (p, 1-p are admixt. proport.
		 Size of pop npop is set to N0 and alpha = 0.0 , size and alpha of pop i are unchanged.
	 -ej t i j   ( Join lineages in pop i and pop j into pop j
		  size, alpha and M are unchanged.
	  -f filename     ( Read command line arguments from file filename.)
 See msdoc.pdf for explanation of these parameters.
NO! at ../../prefersim_additionals/Traj_mssel_2.pl line 21.
 file format error.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.255.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
Second argument error. howmany <= 0. 
usage: mssel nsam howmany nanc nder selfilename selspot -r rho nsites [options] 
  Options: 
	 -t theta   (this option and/or the next must be used. Theta = 4*N0*u )
	 -s segsites   ( fixed number of segregating sites)
	 -T          (Output gene tree.)
	 -F minfreq     Output only sites with freq of minor allele >= minfreq.
	 -r rho nsites     (rho here is 4Nc)
		 -c f track_len   (f = ratio of conversion rate to rec rate. tracklen is mean length.) 
			 if rho = 0.,  f = 4*N0*g, with g the gene conversion rate.
	 -G alpha  ( N(t) = N0*exp(-alpha*t) .  alpha = -log(Np/Nr)/t
	 -I npop n1 n2 ... [mig_rate] (all elements of mig matrix set to mig_rate/(npop-1) 
		 -m i j m_ij    (i,j-th element of mig matrix set to m_ij.)
		 -ma m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
		 -n i size_i   (popi has size set to size_i*N0 
		 -g i alpha_i  (If used must appear after -M option.)
	   The following options modify parameters at the time 't' specified as the first argument:
	 -eG t alpha  (Modify growth rate of all pop's.)
	 -eg t i alpha_i  (Modify growth rate of pop i.) 
	 -eM t mig_rate   (Modify the mig matrix so all elements are mig_rate/(npop-1)
	 -em t i j m_ij    (i,j-th element of mig matrix set to m_ij at time t )
	 -ema t npop  m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
	 -eN t size  (Modify pop sizes. New sizes = size*N0 ) 
	 -en t i size_i  (Modify pop size of pop i.  New size of popi = size_i*N0 .)
	 -es t i proportion  (Split: pop i -> pop-i + pop-npop, npop increases by 1.
		 proportion is probability that each lineage stays in pop-i. (p, 1-p are admixt. proport.
		 Size of pop npop is set to N0 and alpha = 0.0 , size and alpha of pop i are unchanged.
	 -ej t i j   ( Join lineages in pop i and pop j into pop j
		  size, alpha and M are unchanged.
	  -f filename     ( Read command line arguments from file filename.)
 See msdoc.pdf for explanation of these parameters.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.260.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
NO! at ../../prefersim_additionals/Traj_mssel_2.pl line 21.
 file format error.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.265.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
Second argument error. howmany <= 0. 
usage: mssel nsam howmany nanc nder selfilename selspot -r rho nsites [options] 
  Options: 
	 -t theta   (this option and/or the next must be used. Theta = 4*N0*u )
	 -s segsites   ( fixed number of segregating sites)
	 -T          (Output gene tree.)
	 -F minfreq     Output only sites with freq of minor allele >= minfreq.
	 -r rho nsites     (rho here is 4Nc)
		 -c f track_len   (f = ratio of conversion rate to rec rate. tracklen is mean length.) 
			 if rho = 0.,  f = 4*N0*g, with g the gene conversion rate.
	 -G alpha  ( N(t) = N0*exp(-alpha*t) .  alpha = -log(Np/Nr)/t
	 -I npop n1 n2 ... [mig_rate] (all elements of mig matrix set to mig_rate/(npop-1) 
		 -m i j m_ij    (i,j-th element of mig matrix set to m_ij.)
		 -ma m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
		 -n i size_i   (popi has size set to size_i*N0 
		 -g i alpha_i  (If used must appear after -M option.)
	   The following options modify parameters at the time 't' specified as the first argument:
	 -eG t alpha  (Modify growth rate of all pop's.)
	 -eg t i alpha_i  (Modify growth rate of pop i.) 
	 -eM t mig_rate   (Modify the mig matrix so all elements are mig_rate/(npop-1)
	 -em t i j m_ij    (i,j-th element of mig matrix set to m_ij at time t )
	 -ema t npop  m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
	 -eN t size  (Modify pop sizes. New sizes = size*N0 ) 
	 -en t i size_i  (Modify pop size of pop i.  New size of popi = size_i*N0 .)
	 -es t i proportion  (Split: pop i -> pop-i + pop-npop, npop increases by 1.
		 proportion is probability that each lineage stays in pop-i. (p, 1-p are admixt. proport.
		 Size of pop npop is set to N0 and alpha = 0.0 , size and alpha of pop i are unchanged.
	 -ej t i j   ( Join lineages in pop i and pop j into pop j
		  size, alpha and M are unchanged.
	  -f filename     ( Read command line arguments from file filename.)
 See msdoc.pdf for explanation of these parameters.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.270.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
NO! at ../../prefersim_additionals/Traj_mssel_2.pl line 21.
 file format error.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.275.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
Second argument error. howmany <= 0. 
usage: mssel nsam howmany nanc nder selfilename selspot -r rho nsites [options] 
  Options: 
	 -t theta   (this option and/or the next must be used. Theta = 4*N0*u )
	 -s segsites   ( fixed number of segregating sites)
	 -T          (Output gene tree.)
	 -F minfreq     Output only sites with freq of minor allele >= minfreq.
	 -r rho nsites     (rho here is 4Nc)
		 -c f track_len   (f = ratio of conversion rate to rec rate. tracklen is mean length.) 
			 if rho = 0.,  f = 4*N0*g, with g the gene conversion rate.
	 -G alpha  ( N(t) = N0*exp(-alpha*t) .  alpha = -log(Np/Nr)/t
	 -I npop n1 n2 ... [mig_rate] (all elements of mig matrix set to mig_rate/(npop-1) 
		 -m i j m_ij    (i,j-th element of mig matrix set to m_ij.)
		 -ma m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
		 -n i size_i   (popi has size set to size_i*N0 
		 -g i alpha_i  (If used must appear after -M option.)
	   The following options modify parameters at the time 't' specified as the first argument:
	 -eG t alpha  (Modify growth rate of all pop's.)
	 -eg t i alpha_i  (Modify growth rate of pop i.) 
	 -eM t mig_rate   (Modify the mig matrix so all elements are mig_rate/(npop-1)
	 -em t i j m_ij    (i,j-th element of mig matrix set to m_ij at time t )
	 -ema t npop  m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
	 -eN t size  (Modify pop sizes. New sizes = size*N0 ) 
	 -en t i size_i  (Modify pop size of pop i.  New size of popi = size_i*N0 .)
	 -es t i proportion  (Split: pop i -> pop-i + pop-npop, npop increases by 1.
		 proportion is probability that each lineage stays in pop-i. (p, 1-p are admixt. proport.
		 Size of pop npop is set to N0 and alpha = 0.0 , size and alpha of pop i are unchanged.
	 -ej t i j   ( Join lineages in pop i and pop j into pop j
		  size, alpha and M are unchanged.
	  -f filename     ( Read command line arguments from file filename.)
 See msdoc.pdf for explanation of these parameters.
NO! at ../../prefersim_additionals/Traj_mssel_2.pl line 21.
 file format error.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.280.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
Second argument error. howmany <= 0. 
usage: mssel nsam howmany nanc nder selfilename selspot -r rho nsites [options] 
  Options: 
	 -t theta   (this option and/or the next must be used. Theta = 4*N0*u )
	 -s segsites   ( fixed number of segregating sites)
	 -T          (Output gene tree.)
	 -F minfreq     Output only sites with freq of minor allele >= minfreq.
	 -r rho nsites     (rho here is 4Nc)
		 -c f track_len   (f = ratio of conversion rate to rec rate. tracklen is mean length.) 
			 if rho = 0.,  f = 4*N0*g, with g the gene conversion rate.
	 -G alpha  ( N(t) = N0*exp(-alpha*t) .  alpha = -log(Np/Nr)/t
	 -I npop n1 n2 ... [mig_rate] (all elements of mig matrix set to mig_rate/(npop-1) 
		 -m i j m_ij    (i,j-th element of mig matrix set to m_ij.)
		 -ma m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
		 -n i size_i   (popi has size set to size_i*N0 
		 -g i alpha_i  (If used must appear after -M option.)
	   The following options modify parameters at the time 't' specified as the first argument:
	 -eG t alpha  (Modify growth rate of all pop's.)
	 -eg t i alpha_i  (Modify growth rate of pop i.) 
	 -eM t mig_rate   (Modify the mig matrix so all elements are mig_rate/(npop-1)
	 -em t i j m_ij    (i,j-th element of mig matrix set to m_ij at time t )
	 -ema t npop  m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
	 -eN t size  (Modify pop sizes. New sizes = size*N0 ) 
	 -en t i size_i  (Modify pop size of pop i.  New size of popi = size_i*N0 .)
	 -es t i proportion  (Split: pop i -> pop-i + pop-npop, npop increases by 1.
		 proportion is probability that each lineage stays in pop-i. (p, 1-p are admixt. proport.
		 Size of pop npop is set to N0 and alpha = 0.0 , size and alpha of pop i are unchanged.
	 -ej t i j   ( Join lineages in pop i and pop j into pop j
		  size, alpha and M are unchanged.
	  -f filename     ( Read command line arguments from file filename.)
 See msdoc.pdf for explanation of these parameters.
NO! at ../../prefersim_additionals/Traj_mssel_2.pl line 21.
 file format error.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.285.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
Second argument error. howmany <= 0. 
usage: mssel nsam howmany nanc nder selfilename selspot -r rho nsites [options] 
  Options: 
	 -t theta   (this option and/or the next must be used. Theta = 4*N0*u )
	 -s segsites   ( fixed number of segregating sites)
	 -T          (Output gene tree.)
	 -F minfreq     Output only sites with freq of minor allele >= minfreq.
	 -r rho nsites     (rho here is 4Nc)
		 -c f track_len   (f = ratio of conversion rate to rec rate. tracklen is mean length.) 
			 if rho = 0.,  f = 4*N0*g, with g the gene conversion rate.
	 -G alpha  ( N(t) = N0*exp(-alpha*t) .  alpha = -log(Np/Nr)/t
	 -I npop n1 n2 ... [mig_rate] (all elements of mig matrix set to mig_rate/(npop-1) 
		 -m i j m_ij    (i,j-th element of mig matrix set to m_ij.)
		 -ma m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
		 -n i size_i   (popi has size set to size_i*N0 
		 -g i alpha_i  (If used must appear after -M option.)
	   The following options modify parameters at the time 't' specified as the first argument:
	 -eG t alpha  (Modify growth rate of all pop's.)
	 -eg t i alpha_i  (Modify growth rate of pop i.) 
	 -eM t mig_rate   (Modify the mig matrix so all elements are mig_rate/(npop-1)
	 -em t i j m_ij    (i,j-th element of mig matrix set to m_ij at time t )
	 -ema t npop  m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
	 -eN t size  (Modify pop sizes. New sizes = size*N0 ) 
	 -en t i size_i  (Modify pop size of pop i.  New size of popi = size_i*N0 .)
	 -es t i proportion  (Split: pop i -> pop-i + pop-npop, npop increases by 1.
		 proportion is probability that each lineage stays in pop-i. (p, 1-p are admixt. proport.
		 Size of pop npop is set to N0 and alpha = 0.0 , size and alpha of pop i are unchanged.
	 -ej t i j   ( Join lineages in pop i and pop j into pop j
		  size, alpha and M are unchanged.
	  -f filename     ( Read command line arguments from file filename.)
 See msdoc.pdf for explanation of these parameters.
NO! at ../../prefersim_additionals/Traj_mssel_2.pl line 21.
 file format error.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.290.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
Second argument error. howmany <= 0. 
usage: mssel nsam howmany nanc nder selfilename selspot -r rho nsites [options] 
  Options: 
	 -t theta   (this option and/or the next must be used. Theta = 4*N0*u )
	 -s segsites   ( fixed number of segregating sites)
	 -T          (Output gene tree.)
	 -F minfreq     Output only sites with freq of minor allele >= minfreq.
	 -r rho nsites     (rho here is 4Nc)
		 -c f track_len   (f = ratio of conversion rate to rec rate. tracklen is mean length.) 
			 if rho = 0.,  f = 4*N0*g, with g the gene conversion rate.
	 -G alpha  ( N(t) = N0*exp(-alpha*t) .  alpha = -log(Np/Nr)/t
	 -I npop n1 n2 ... [mig_rate] (all elements of mig matrix set to mig_rate/(npop-1) 
		 -m i j m_ij    (i,j-th element of mig matrix set to m_ij.)
		 -ma m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
		 -n i size_i   (popi has size set to size_i*N0 
		 -g i alpha_i  (If used must appear after -M option.)
	   The following options modify parameters at the time 't' specified as the first argument:
	 -eG t alpha  (Modify growth rate of all pop's.)
	 -eg t i alpha_i  (Modify growth rate of pop i.) 
	 -eM t mig_rate   (Modify the mig matrix so all elements are mig_rate/(npop-1)
	 -em t i j m_ij    (i,j-th element of mig matrix set to m_ij at time t )
	 -ema t npop  m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
	 -eN t size  (Modify pop sizes. New sizes = size*N0 ) 
	 -en t i size_i  (Modify pop size of pop i.  New size of popi = size_i*N0 .)
	 -es t i proportion  (Split: pop i -> pop-i + pop-npop, npop increases by 1.
		 proportion is probability that each lineage stays in pop-i. (p, 1-p are admixt. proport.
		 Size of pop npop is set to N0 and alpha = 0.0 , size and alpha of pop i are unchanged.
	 -ej t i j   ( Join lineages in pop i and pop j into pop j
		  size, alpha and M are unchanged.
	  -f filename     ( Read command line arguments from file filename.)
 See msdoc.pdf for explanation of these parameters.
NO! at ../../prefersim_additionals/Traj_mssel_2.pl line 21.
 file format error.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.295.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
Second argument error. howmany <= 0. 
usage: mssel nsam howmany nanc nder selfilename selspot -r rho nsites [options] 
  Options: 
	 -t theta   (this option and/or the next must be used. Theta = 4*N0*u )
	 -s segsites   ( fixed number of segregating sites)
	 -T          (Output gene tree.)
	 -F minfreq     Output only sites with freq of minor allele >= minfreq.
	 -r rho nsites     (rho here is 4Nc)
		 -c f track_len   (f = ratio of conversion rate to rec rate. tracklen is mean length.) 
			 if rho = 0.,  f = 4*N0*g, with g the gene conversion rate.
	 -G alpha  ( N(t) = N0*exp(-alpha*t) .  alpha = -log(Np/Nr)/t
	 -I npop n1 n2 ... [mig_rate] (all elements of mig matrix set to mig_rate/(npop-1) 
		 -m i j m_ij    (i,j-th element of mig matrix set to m_ij.)
		 -ma m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
		 -n i size_i   (popi has size set to size_i*N0 
		 -g i alpha_i  (If used must appear after -M option.)
	   The following options modify parameters at the time 't' specified as the first argument:
	 -eG t alpha  (Modify growth rate of all pop's.)
	 -eg t i alpha_i  (Modify growth rate of pop i.) 
	 -eM t mig_rate   (Modify the mig matrix so all elements are mig_rate/(npop-1)
	 -em t i j m_ij    (i,j-th element of mig matrix set to m_ij at time t )
	 -ema t npop  m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
	 -eN t size  (Modify pop sizes. New sizes = size*N0 ) 
	 -en t i size_i  (Modify pop size of pop i.  New size of popi = size_i*N0 .)
	 -es t i proportion  (Split: pop i -> pop-i + pop-npop, npop increases by 1.
		 proportion is probability that each lineage stays in pop-i. (p, 1-p are admixt. proport.
		 Size of pop npop is set to N0 and alpha = 0.0 , size and alpha of pop i are unchanged.
	 -ej t i j   ( Join lineages in pop i and pop j into pop j
		  size, alpha and M are unchanged.
	  -f filename     ( Read command line arguments from file filename.)
 See msdoc.pdf for explanation of these parameters.
NO! at ../../prefersim_additionals/Traj_mssel_2.pl line 21.
 file format error.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.300.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
Second argument error. howmany <= 0. 
usage: mssel nsam howmany nanc nder selfilename selspot -r rho nsites [options] 
  Options: 
	 -t theta   (this option and/or the next must be used. Theta = 4*N0*u )
	 -s segsites   ( fixed number of segregating sites)
	 -T          (Output gene tree.)
	 -F minfreq     Output only sites with freq of minor allele >= minfreq.
	 -r rho nsites     (rho here is 4Nc)
		 -c f track_len   (f = ratio of conversion rate to rec rate. tracklen is mean length.) 
			 if rho = 0.,  f = 4*N0*g, with g the gene conversion rate.
	 -G alpha  ( N(t) = N0*exp(-alpha*t) .  alpha = -log(Np/Nr)/t
	 -I npop n1 n2 ... [mig_rate] (all elements of mig matrix set to mig_rate/(npop-1) 
		 -m i j m_ij    (i,j-th element of mig matrix set to m_ij.)
		 -ma m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
		 -n i size_i   (popi has size set to size_i*N0 
		 -g i alpha_i  (If used must appear after -M option.)
	   The following options modify parameters at the time 't' specified as the first argument:
	 -eG t alpha  (Modify growth rate of all pop's.)
	 -eg t i alpha_i  (Modify growth rate of pop i.) 
	 -eM t mig_rate   (Modify the mig matrix so all elements are mig_rate/(npop-1)
	 -em t i j m_ij    (i,j-th element of mig matrix set to m_ij at time t )
	 -ema t npop  m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
	 -eN t size  (Modify pop sizes. New sizes = size*N0 ) 
	 -en t i size_i  (Modify pop size of pop i.  New size of popi = size_i*N0 .)
	 -es t i proportion  (Split: pop i -> pop-i + pop-npop, npop increases by 1.
		 proportion is probability that each lineage stays in pop-i. (p, 1-p are admixt. proport.
		 Size of pop npop is set to N0 and alpha = 0.0 , size and alpha of pop i are unchanged.
	 -ej t i j   ( Join lineages in pop i and pop j into pop j
		  size, alpha and M are unchanged.
	  -f filename     ( Read command line arguments from file filename.)
 See msdoc.pdf for explanation of these parameters.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.305.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.310.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
NO! at ../../prefersim_additionals/Traj_mssel_2.pl line 21.
 file format error.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.315.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
Second argument error. howmany <= 0. 
usage: mssel nsam howmany nanc nder selfilename selspot -r rho nsites [options] 
  Options: 
	 -t theta   (this option and/or the next must be used. Theta = 4*N0*u )
	 -s segsites   ( fixed number of segregating sites)
	 -T          (Output gene tree.)
	 -F minfreq     Output only sites with freq of minor allele >= minfreq.
	 -r rho nsites     (rho here is 4Nc)
		 -c f track_len   (f = ratio of conversion rate to rec rate. tracklen is mean length.) 
			 if rho = 0.,  f = 4*N0*g, with g the gene conversion rate.
	 -G alpha  ( N(t) = N0*exp(-alpha*t) .  alpha = -log(Np/Nr)/t
	 -I npop n1 n2 ... [mig_rate] (all elements of mig matrix set to mig_rate/(npop-1) 
		 -m i j m_ij    (i,j-th element of mig matrix set to m_ij.)
		 -ma m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
		 -n i size_i   (popi has size set to size_i*N0 
		 -g i alpha_i  (If used must appear after -M option.)
	   The following options modify parameters at the time 't' specified as the first argument:
	 -eG t alpha  (Modify growth rate of all pop's.)
	 -eg t i alpha_i  (Modify growth rate of pop i.) 
	 -eM t mig_rate   (Modify the mig matrix so all elements are mig_rate/(npop-1)
	 -em t i j m_ij    (i,j-th element of mig matrix set to m_ij at time t )
	 -ema t npop  m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
	 -eN t size  (Modify pop sizes. New sizes = size*N0 ) 
	 -en t i size_i  (Modify pop size of pop i.  New size of popi = size_i*N0 .)
	 -es t i proportion  (Split: pop i -> pop-i + pop-npop, npop increases by 1.
		 proportion is probability that each lineage stays in pop-i. (p, 1-p are admixt. proport.
		 Size of pop npop is set to N0 and alpha = 0.0 , size and alpha of pop i are unchanged.
	 -ej t i j   ( Join lineages in pop i and pop j into pop j
		  size, alpha and M are unchanged.
	  -f filename     ( Read command line arguments from file filename.)
 See msdoc.pdf for explanation of these parameters.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.320.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
NO! at ../../prefersim_additionals/Traj_mssel_2.pl line 21.
 file format error.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.325.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
Second argument error. howmany <= 0. 
usage: mssel nsam howmany nanc nder selfilename selspot -r rho nsites [options] 
  Options: 
	 -t theta   (this option and/or the next must be used. Theta = 4*N0*u )
	 -s segsites   ( fixed number of segregating sites)
	 -T          (Output gene tree.)
	 -F minfreq     Output only sites with freq of minor allele >= minfreq.
	 -r rho nsites     (rho here is 4Nc)
		 -c f track_len   (f = ratio of conversion rate to rec rate. tracklen is mean length.) 
			 if rho = 0.,  f = 4*N0*g, with g the gene conversion rate.
	 -G alpha  ( N(t) = N0*exp(-alpha*t) .  alpha = -log(Np/Nr)/t
	 -I npop n1 n2 ... [mig_rate] (all elements of mig matrix set to mig_rate/(npop-1) 
		 -m i j m_ij    (i,j-th element of mig matrix set to m_ij.)
		 -ma m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
		 -n i size_i   (popi has size set to size_i*N0 
		 -g i alpha_i  (If used must appear after -M option.)
	   The following options modify parameters at the time 't' specified as the first argument:
	 -eG t alpha  (Modify growth rate of all pop's.)
	 -eg t i alpha_i  (Modify growth rate of pop i.) 
	 -eM t mig_rate   (Modify the mig matrix so all elements are mig_rate/(npop-1)
	 -em t i j m_ij    (i,j-th element of mig matrix set to m_ij at time t )
	 -ema t npop  m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
	 -eN t size  (Modify pop sizes. New sizes = size*N0 ) 
	 -en t i size_i  (Modify pop size of pop i.  New size of popi = size_i*N0 .)
	 -es t i proportion  (Split: pop i -> pop-i + pop-npop, npop increases by 1.
		 proportion is probability that each lineage stays in pop-i. (p, 1-p are admixt. proport.
		 Size of pop npop is set to N0 and alpha = 0.0 , size and alpha of pop i are unchanged.
	 -ej t i j   ( Join lineages in pop i and pop j into pop j
		  size, alpha and M are unchanged.
	  -f filename     ( Read command line arguments from file filename.)
 See msdoc.pdf for explanation of these parameters.
NO! at ../../prefersim_additionals/Traj_mssel_2.pl line 21.
 file format error.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.330.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
Second argument error. howmany <= 0. 
usage: mssel nsam howmany nanc nder selfilename selspot -r rho nsites [options] 
  Options: 
	 -t theta   (this option and/or the next must be used. Theta = 4*N0*u )
	 -s segsites   ( fixed number of segregating sites)
	 -T          (Output gene tree.)
	 -F minfreq     Output only sites with freq of minor allele >= minfreq.
	 -r rho nsites     (rho here is 4Nc)
		 -c f track_len   (f = ratio of conversion rate to rec rate. tracklen is mean length.) 
			 if rho = 0.,  f = 4*N0*g, with g the gene conversion rate.
	 -G alpha  ( N(t) = N0*exp(-alpha*t) .  alpha = -log(Np/Nr)/t
	 -I npop n1 n2 ... [mig_rate] (all elements of mig matrix set to mig_rate/(npop-1) 
		 -m i j m_ij    (i,j-th element of mig matrix set to m_ij.)
		 -ma m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
		 -n i size_i   (popi has size set to size_i*N0 
		 -g i alpha_i  (If used must appear after -M option.)
	   The following options modify parameters at the time 't' specified as the first argument:
	 -eG t alpha  (Modify growth rate of all pop's.)
	 -eg t i alpha_i  (Modify growth rate of pop i.) 
	 -eM t mig_rate   (Modify the mig matrix so all elements are mig_rate/(npop-1)
	 -em t i j m_ij    (i,j-th element of mig matrix set to m_ij at time t )
	 -ema t npop  m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
	 -eN t size  (Modify pop sizes. New sizes = size*N0 ) 
	 -en t i size_i  (Modify pop size of pop i.  New size of popi = size_i*N0 .)
	 -es t i proportion  (Split: pop i -> pop-i + pop-npop, npop increases by 1.
		 proportion is probability that each lineage stays in pop-i. (p, 1-p are admixt. proport.
		 Size of pop npop is set to N0 and alpha = 0.0 , size and alpha of pop i are unchanged.
	 -ej t i j   ( Join lineages in pop i and pop j into pop j
		  size, alpha and M are unchanged.
	  -f filename     ( Read command line arguments from file filename.)
 See msdoc.pdf for explanation of these parameters.
NO! at ../../prefersim_additionals/Traj_mssel_2.pl line 21.
 file format error.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.335.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
Second argument error. howmany <= 0. 
usage: mssel nsam howmany nanc nder selfilename selspot -r rho nsites [options] 
  Options: 
	 -t theta   (this option and/or the next must be used. Theta = 4*N0*u )
	 -s segsites   ( fixed number of segregating sites)
	 -T          (Output gene tree.)
	 -F minfreq     Output only sites with freq of minor allele >= minfreq.
	 -r rho nsites     (rho here is 4Nc)
		 -c f track_len   (f = ratio of conversion rate to rec rate. tracklen is mean length.) 
			 if rho = 0.,  f = 4*N0*g, with g the gene conversion rate.
	 -G alpha  ( N(t) = N0*exp(-alpha*t) .  alpha = -log(Np/Nr)/t
	 -I npop n1 n2 ... [mig_rate] (all elements of mig matrix set to mig_rate/(npop-1) 
		 -m i j m_ij    (i,j-th element of mig matrix set to m_ij.)
		 -ma m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
		 -n i size_i   (popi has size set to size_i*N0 
		 -g i alpha_i  (If used must appear after -M option.)
	   The following options modify parameters at the time 't' specified as the first argument:
	 -eG t alpha  (Modify growth rate of all pop's.)
	 -eg t i alpha_i  (Modify growth rate of pop i.) 
	 -eM t mig_rate   (Modify the mig matrix so all elements are mig_rate/(npop-1)
	 -em t i j m_ij    (i,j-th element of mig matrix set to m_ij at time t )
	 -ema t npop  m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
	 -eN t size  (Modify pop sizes. New sizes = size*N0 ) 
	 -en t i size_i  (Modify pop size of pop i.  New size of popi = size_i*N0 .)
	 -es t i proportion  (Split: pop i -> pop-i + pop-npop, npop increases by 1.
		 proportion is probability that each lineage stays in pop-i. (p, 1-p are admixt. proport.
		 Size of pop npop is set to N0 and alpha = 0.0 , size and alpha of pop i are unchanged.
	 -ej t i j   ( Join lineages in pop i and pop j into pop j
		  size, alpha and M are unchanged.
	  -f filename     ( Read command line arguments from file filename.)
 See msdoc.pdf for explanation of these parameters.
NO! at ../../prefersim_additionals/Traj_mssel_2.pl line 21.
 file format error.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.340.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
Second argument error. howmany <= 0. 
usage: mssel nsam howmany nanc nder selfilename selspot -r rho nsites [options] 
  Options: 
	 -t theta   (this option and/or the next must be used. Theta = 4*N0*u )
	 -s segsites   ( fixed number of segregating sites)
	 -T          (Output gene tree.)
	 -F minfreq     Output only sites with freq of minor allele >= minfreq.
	 -r rho nsites     (rho here is 4Nc)
		 -c f track_len   (f = ratio of conversion rate to rec rate. tracklen is mean length.) 
			 if rho = 0.,  f = 4*N0*g, with g the gene conversion rate.
	 -G alpha  ( N(t) = N0*exp(-alpha*t) .  alpha = -log(Np/Nr)/t
	 -I npop n1 n2 ... [mig_rate] (all elements of mig matrix set to mig_rate/(npop-1) 
		 -m i j m_ij    (i,j-th element of mig matrix set to m_ij.)
		 -ma m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
		 -n i size_i   (popi has size set to size_i*N0 
		 -g i alpha_i  (If used must appear after -M option.)
	   The following options modify parameters at the time 't' specified as the first argument:
	 -eG t alpha  (Modify growth rate of all pop's.)
	 -eg t i alpha_i  (Modify growth rate of pop i.) 
	 -eM t mig_rate   (Modify the mig matrix so all elements are mig_rate/(npop-1)
	 -em t i j m_ij    (i,j-th element of mig matrix set to m_ij at time t )
	 -ema t npop  m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
	 -eN t size  (Modify pop sizes. New sizes = size*N0 ) 
	 -en t i size_i  (Modify pop size of pop i.  New size of popi = size_i*N0 .)
	 -es t i proportion  (Split: pop i -> pop-i + pop-npop, npop increases by 1.
		 proportion is probability that each lineage stays in pop-i. (p, 1-p are admixt. proport.
		 Size of pop npop is set to N0 and alpha = 0.0 , size and alpha of pop i are unchanged.
	 -ej t i j   ( Join lineages in pop i and pop j into pop j
		  size, alpha and M are unchanged.
	  -f filename     ( Read command line arguments from file filename.)
 See msdoc.pdf for explanation of these parameters.
NO! at ../../prefersim_additionals/Traj_mssel_2.pl line 21.
 file format error.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.345.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
Second argument error. howmany <= 0. 
usage: mssel nsam howmany nanc nder selfilename selspot -r rho nsites [options] 
  Options: 
	 -t theta   (this option and/or the next must be used. Theta = 4*N0*u )
	 -s segsites   ( fixed number of segregating sites)
	 -T          (Output gene tree.)
	 -F minfreq     Output only sites with freq of minor allele >= minfreq.
	 -r rho nsites     (rho here is 4Nc)
		 -c f track_len   (f = ratio of conversion rate to rec rate. tracklen is mean length.) 
			 if rho = 0.,  f = 4*N0*g, with g the gene conversion rate.
	 -G alpha  ( N(t) = N0*exp(-alpha*t) .  alpha = -log(Np/Nr)/t
	 -I npop n1 n2 ... [mig_rate] (all elements of mig matrix set to mig_rate/(npop-1) 
		 -m i j m_ij    (i,j-th element of mig matrix set to m_ij.)
		 -ma m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
		 -n i size_i   (popi has size set to size_i*N0 
		 -g i alpha_i  (If used must appear after -M option.)
	   The following options modify parameters at the time 't' specified as the first argument:
	 -eG t alpha  (Modify growth rate of all pop's.)
	 -eg t i alpha_i  (Modify growth rate of pop i.) 
	 -eM t mig_rate   (Modify the mig matrix so all elements are mig_rate/(npop-1)
	 -em t i j m_ij    (i,j-th element of mig matrix set to m_ij at time t )
	 -ema t npop  m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
	 -eN t size  (Modify pop sizes. New sizes = size*N0 ) 
	 -en t i size_i  (Modify pop size of pop i.  New size of popi = size_i*N0 .)
	 -es t i proportion  (Split: pop i -> pop-i + pop-npop, npop increases by 1.
		 proportion is probability that each lineage stays in pop-i. (p, 1-p are admixt. proport.
		 Size of pop npop is set to N0 and alpha = 0.0 , size and alpha of pop i are unchanged.
	 -ej t i j   ( Join lineages in pop i and pop j into pop j
		  size, alpha and M are unchanged.
	  -f filename     ( Read command line arguments from file filename.)
 See msdoc.pdf for explanation of these parameters.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.350.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
NO! at ../../prefersim_additionals/Traj_mssel_2.pl line 21.
 file format error.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.355.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
Second argument error. howmany <= 0. 
usage: mssel nsam howmany nanc nder selfilename selspot -r rho nsites [options] 
  Options: 
	 -t theta   (this option and/or the next must be used. Theta = 4*N0*u )
	 -s segsites   ( fixed number of segregating sites)
	 -T          (Output gene tree.)
	 -F minfreq     Output only sites with freq of minor allele >= minfreq.
	 -r rho nsites     (rho here is 4Nc)
		 -c f track_len   (f = ratio of conversion rate to rec rate. tracklen is mean length.) 
			 if rho = 0.,  f = 4*N0*g, with g the gene conversion rate.
	 -G alpha  ( N(t) = N0*exp(-alpha*t) .  alpha = -log(Np/Nr)/t
	 -I npop n1 n2 ... [mig_rate] (all elements of mig matrix set to mig_rate/(npop-1) 
		 -m i j m_ij    (i,j-th element of mig matrix set to m_ij.)
		 -ma m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
		 -n i size_i   (popi has size set to size_i*N0 
		 -g i alpha_i  (If used must appear after -M option.)
	   The following options modify parameters at the time 't' specified as the first argument:
	 -eG t alpha  (Modify growth rate of all pop's.)
	 -eg t i alpha_i  (Modify growth rate of pop i.) 
	 -eM t mig_rate   (Modify the mig matrix so all elements are mig_rate/(npop-1)
	 -em t i j m_ij    (i,j-th element of mig matrix set to m_ij at time t )
	 -ema t npop  m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
	 -eN t size  (Modify pop sizes. New sizes = size*N0 ) 
	 -en t i size_i  (Modify pop size of pop i.  New size of popi = size_i*N0 .)
	 -es t i proportion  (Split: pop i -> pop-i + pop-npop, npop increases by 1.
		 proportion is probability that each lineage stays in pop-i. (p, 1-p are admixt. proport.
		 Size of pop npop is set to N0 and alpha = 0.0 , size and alpha of pop i are unchanged.
	 -ej t i j   ( Join lineages in pop i and pop j into pop j
		  size, alpha and M are unchanged.
	  -f filename     ( Read command line arguments from file filename.)
 See msdoc.pdf for explanation of these parameters.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.360.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.365.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
NO! at ../../prefersim_additionals/Traj_mssel_2.pl line 21.
 file format error.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.370.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
Second argument error. howmany <= 0. 
usage: mssel nsam howmany nanc nder selfilename selspot -r rho nsites [options] 
  Options: 
	 -t theta   (this option and/or the next must be used. Theta = 4*N0*u )
	 -s segsites   ( fixed number of segregating sites)
	 -T          (Output gene tree.)
	 -F minfreq     Output only sites with freq of minor allele >= minfreq.
	 -r rho nsites     (rho here is 4Nc)
		 -c f track_len   (f = ratio of conversion rate to rec rate. tracklen is mean length.) 
			 if rho = 0.,  f = 4*N0*g, with g the gene conversion rate.
	 -G alpha  ( N(t) = N0*exp(-alpha*t) .  alpha = -log(Np/Nr)/t
	 -I npop n1 n2 ... [mig_rate] (all elements of mig matrix set to mig_rate/(npop-1) 
		 -m i j m_ij    (i,j-th element of mig matrix set to m_ij.)
		 -ma m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
		 -n i size_i   (popi has size set to size_i*N0 
		 -g i alpha_i  (If used must appear after -M option.)
	   The following options modify parameters at the time 't' specified as the first argument:
	 -eG t alpha  (Modify growth rate of all pop's.)
	 -eg t i alpha_i  (Modify growth rate of pop i.) 
	 -eM t mig_rate   (Modify the mig matrix so all elements are mig_rate/(npop-1)
	 -em t i j m_ij    (i,j-th element of mig matrix set to m_ij at time t )
	 -ema t npop  m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
	 -eN t size  (Modify pop sizes. New sizes = size*N0 ) 
	 -en t i size_i  (Modify pop size of pop i.  New size of popi = size_i*N0 .)
	 -es t i proportion  (Split: pop i -> pop-i + pop-npop, npop increases by 1.
		 proportion is probability that each lineage stays in pop-i. (p, 1-p are admixt. proport.
		 Size of pop npop is set to N0 and alpha = 0.0 , size and alpha of pop i are unchanged.
	 -ej t i j   ( Join lineages in pop i and pop j into pop j
		  size, alpha and M are unchanged.
	  -f filename     ( Read command line arguments from file filename.)
 See msdoc.pdf for explanation of these parameters.
NO! at ../../prefersim_additionals/Traj_mssel_2.pl line 21.
 file format error.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.375.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
Second argument error. howmany <= 0. 
usage: mssel nsam howmany nanc nder selfilename selspot -r rho nsites [options] 
  Options: 
	 -t theta   (this option and/or the next must be used. Theta = 4*N0*u )
	 -s segsites   ( fixed number of segregating sites)
	 -T          (Output gene tree.)
	 -F minfreq     Output only sites with freq of minor allele >= minfreq.
	 -r rho nsites     (rho here is 4Nc)
		 -c f track_len   (f = ratio of conversion rate to rec rate. tracklen is mean length.) 
			 if rho = 0.,  f = 4*N0*g, with g the gene conversion rate.
	 -G alpha  ( N(t) = N0*exp(-alpha*t) .  alpha = -log(Np/Nr)/t
	 -I npop n1 n2 ... [mig_rate] (all elements of mig matrix set to mig_rate/(npop-1) 
		 -m i j m_ij    (i,j-th element of mig matrix set to m_ij.)
		 -ma m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
		 -n i size_i   (popi has size set to size_i*N0 
		 -g i alpha_i  (If used must appear after -M option.)
	   The following options modify parameters at the time 't' specified as the first argument:
	 -eG t alpha  (Modify growth rate of all pop's.)
	 -eg t i alpha_i  (Modify growth rate of pop i.) 
	 -eM t mig_rate   (Modify the mig matrix so all elements are mig_rate/(npop-1)
	 -em t i j m_ij    (i,j-th element of mig matrix set to m_ij at time t )
	 -ema t npop  m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
	 -eN t size  (Modify pop sizes. New sizes = size*N0 ) 
	 -en t i size_i  (Modify pop size of pop i.  New size of popi = size_i*N0 .)
	 -es t i proportion  (Split: pop i -> pop-i + pop-npop, npop increases by 1.
		 proportion is probability that each lineage stays in pop-i. (p, 1-p are admixt. proport.
		 Size of pop npop is set to N0 and alpha = 0.0 , size and alpha of pop i are unchanged.
	 -ej t i j   ( Join lineages in pop i and pop j into pop j
		  size, alpha and M are unchanged.
	  -f filename     ( Read command line arguments from file filename.)
 See msdoc.pdf for explanation of these parameters.
NO! at ../../prefersim_additionals/Traj_mssel_2.pl line 21.
 file format error.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.380.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
Second argument error. howmany <= 0. 
usage: mssel nsam howmany nanc nder selfilename selspot -r rho nsites [options] 
  Options: 
	 -t theta   (this option and/or the next must be used. Theta = 4*N0*u )
	 -s segsites   ( fixed number of segregating sites)
	 -T          (Output gene tree.)
	 -F minfreq     Output only sites with freq of minor allele >= minfreq.
	 -r rho nsites     (rho here is 4Nc)
		 -c f track_len   (f = ratio of conversion rate to rec rate. tracklen is mean length.) 
			 if rho = 0.,  f = 4*N0*g, with g the gene conversion rate.
	 -G alpha  ( N(t) = N0*exp(-alpha*t) .  alpha = -log(Np/Nr)/t
	 -I npop n1 n2 ... [mig_rate] (all elements of mig matrix set to mig_rate/(npop-1) 
		 -m i j m_ij    (i,j-th element of mig matrix set to m_ij.)
		 -ma m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
		 -n i size_i   (popi has size set to size_i*N0 
		 -g i alpha_i  (If used must appear after -M option.)
	   The following options modify parameters at the time 't' specified as the first argument:
	 -eG t alpha  (Modify growth rate of all pop's.)
	 -eg t i alpha_i  (Modify growth rate of pop i.) 
	 -eM t mig_rate   (Modify the mig matrix so all elements are mig_rate/(npop-1)
	 -em t i j m_ij    (i,j-th element of mig matrix set to m_ij at time t )
	 -ema t npop  m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
	 -eN t size  (Modify pop sizes. New sizes = size*N0 ) 
	 -en t i size_i  (Modify pop size of pop i.  New size of popi = size_i*N0 .)
	 -es t i proportion  (Split: pop i -> pop-i + pop-npop, npop increases by 1.
		 proportion is probability that each lineage stays in pop-i. (p, 1-p are admixt. proport.
		 Size of pop npop is set to N0 and alpha = 0.0 , size and alpha of pop i are unchanged.
	 -ej t i j   ( Join lineages in pop i and pop j into pop j
		  size, alpha and M are unchanged.
	  -f filename     ( Read command line arguments from file filename.)
 See msdoc.pdf for explanation of these parameters.
NO! at ../../prefersim_additionals/Traj_mssel_2.pl line 21.
 file format error.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.385.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
Second argument error. howmany <= 0. 
usage: mssel nsam howmany nanc nder selfilename selspot -r rho nsites [options] 
  Options: 
	 -t theta   (this option and/or the next must be used. Theta = 4*N0*u )
	 -s segsites   ( fixed number of segregating sites)
	 -T          (Output gene tree.)
	 -F minfreq     Output only sites with freq of minor allele >= minfreq.
	 -r rho nsites     (rho here is 4Nc)
		 -c f track_len   (f = ratio of conversion rate to rec rate. tracklen is mean length.) 
			 if rho = 0.,  f = 4*N0*g, with g the gene conversion rate.
	 -G alpha  ( N(t) = N0*exp(-alpha*t) .  alpha = -log(Np/Nr)/t
	 -I npop n1 n2 ... [mig_rate] (all elements of mig matrix set to mig_rate/(npop-1) 
		 -m i j m_ij    (i,j-th element of mig matrix set to m_ij.)
		 -ma m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
		 -n i size_i   (popi has size set to size_i*N0 
		 -g i alpha_i  (If used must appear after -M option.)
	   The following options modify parameters at the time 't' specified as the first argument:
	 -eG t alpha  (Modify growth rate of all pop's.)
	 -eg t i alpha_i  (Modify growth rate of pop i.) 
	 -eM t mig_rate   (Modify the mig matrix so all elements are mig_rate/(npop-1)
	 -em t i j m_ij    (i,j-th element of mig matrix set to m_ij at time t )
	 -ema t npop  m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
	 -eN t size  (Modify pop sizes. New sizes = size*N0 ) 
	 -en t i size_i  (Modify pop size of pop i.  New size of popi = size_i*N0 .)
	 -es t i proportion  (Split: pop i -> pop-i + pop-npop, npop increases by 1.
		 proportion is probability that each lineage stays in pop-i. (p, 1-p are admixt. proport.
		 Size of pop npop is set to N0 and alpha = 0.0 , size and alpha of pop i are unchanged.
	 -ej t i j   ( Join lineages in pop i and pop j into pop j
		  size, alpha and M are unchanged.
	  -f filename     ( Read command line arguments from file filename.)
 See msdoc.pdf for explanation of these parameters.
NO! at ../../prefersim_additionals/Traj_mssel_2.pl line 21.
 file format error.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.390.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
Second argument error. howmany <= 0. 
usage: mssel nsam howmany nanc nder selfilename selspot -r rho nsites [options] 
  Options: 
	 -t theta   (this option and/or the next must be used. Theta = 4*N0*u )
	 -s segsites   ( fixed number of segregating sites)
	 -T          (Output gene tree.)
	 -F minfreq     Output only sites with freq of minor allele >= minfreq.
	 -r rho nsites     (rho here is 4Nc)
		 -c f track_len   (f = ratio of conversion rate to rec rate. tracklen is mean length.) 
			 if rho = 0.,  f = 4*N0*g, with g the gene conversion rate.
	 -G alpha  ( N(t) = N0*exp(-alpha*t) .  alpha = -log(Np/Nr)/t
	 -I npop n1 n2 ... [mig_rate] (all elements of mig matrix set to mig_rate/(npop-1) 
		 -m i j m_ij    (i,j-th element of mig matrix set to m_ij.)
		 -ma m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
		 -n i size_i   (popi has size set to size_i*N0 
		 -g i alpha_i  (If used must appear after -M option.)
	   The following options modify parameters at the time 't' specified as the first argument:
	 -eG t alpha  (Modify growth rate of all pop's.)
	 -eg t i alpha_i  (Modify growth rate of pop i.) 
	 -eM t mig_rate   (Modify the mig matrix so all elements are mig_rate/(npop-1)
	 -em t i j m_ij    (i,j-th element of mig matrix set to m_ij at time t )
	 -ema t npop  m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
	 -eN t size  (Modify pop sizes. New sizes = size*N0 ) 
	 -en t i size_i  (Modify pop size of pop i.  New size of popi = size_i*N0 .)
	 -es t i proportion  (Split: pop i -> pop-i + pop-npop, npop increases by 1.
		 proportion is probability that each lineage stays in pop-i. (p, 1-p are admixt. proport.
		 Size of pop npop is set to N0 and alpha = 0.0 , size and alpha of pop i are unchanged.
	 -ej t i j   ( Join lineages in pop i and pop j into pop j
		  size, alpha and M are unchanged.
	  -f filename     ( Read command line arguments from file filename.)
 See msdoc.pdf for explanation of these parameters.
NO! at ../../prefersim_additionals/Traj_mssel_2.pl line 21.
 file format error.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.395.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
Second argument error. howmany <= 0. 
usage: mssel nsam howmany nanc nder selfilename selspot -r rho nsites [options] 
  Options: 
	 -t theta   (this option and/or the next must be used. Theta = 4*N0*u )
	 -s segsites   ( fixed number of segregating sites)
	 -T          (Output gene tree.)
	 -F minfreq     Output only sites with freq of minor allele >= minfreq.
	 -r rho nsites     (rho here is 4Nc)
		 -c f track_len   (f = ratio of conversion rate to rec rate. tracklen is mean length.) 
			 if rho = 0.,  f = 4*N0*g, with g the gene conversion rate.
	 -G alpha  ( N(t) = N0*exp(-alpha*t) .  alpha = -log(Np/Nr)/t
	 -I npop n1 n2 ... [mig_rate] (all elements of mig matrix set to mig_rate/(npop-1) 
		 -m i j m_ij    (i,j-th element of mig matrix set to m_ij.)
		 -ma m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
		 -n i size_i   (popi has size set to size_i*N0 
		 -g i alpha_i  (If used must appear after -M option.)
	   The following options modify parameters at the time 't' specified as the first argument:
	 -eG t alpha  (Modify growth rate of all pop's.)
	 -eg t i alpha_i  (Modify growth rate of pop i.) 
	 -eM t mig_rate   (Modify the mig matrix so all elements are mig_rate/(npop-1)
	 -em t i j m_ij    (i,j-th element of mig matrix set to m_ij at time t )
	 -ema t npop  m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
	 -eN t size  (Modify pop sizes. New sizes = size*N0 ) 
	 -en t i size_i  (Modify pop size of pop i.  New size of popi = size_i*N0 .)
	 -es t i proportion  (Split: pop i -> pop-i + pop-npop, npop increases by 1.
		 proportion is probability that each lineage stays in pop-i. (p, 1-p are admixt. proport.
		 Size of pop npop is set to N0 and alpha = 0.0 , size and alpha of pop i are unchanged.
	 -ej t i j   ( Join lineages in pop i and pop j into pop j
		  size, alpha and M are unchanged.
	  -f filename     ( Read command line arguments from file filename.)
 See msdoc.pdf for explanation of these parameters.
NO! at ../../prefersim_additionals/Traj_mssel_2.pl line 21.
 file format error.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.400.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
Second argument error. howmany <= 0. 
usage: mssel nsam howmany nanc nder selfilename selspot -r rho nsites [options] 
  Options: 
	 -t theta   (this option and/or the next must be used. Theta = 4*N0*u )
	 -s segsites   ( fixed number of segregating sites)
	 -T          (Output gene tree.)
	 -F minfreq     Output only sites with freq of minor allele >= minfreq.
	 -r rho nsites     (rho here is 4Nc)
		 -c f track_len   (f = ratio of conversion rate to rec rate. tracklen is mean length.) 
			 if rho = 0.,  f = 4*N0*g, with g the gene conversion rate.
	 -G alpha  ( N(t) = N0*exp(-alpha*t) .  alpha = -log(Np/Nr)/t
	 -I npop n1 n2 ... [mig_rate] (all elements of mig matrix set to mig_rate/(npop-1) 
		 -m i j m_ij    (i,j-th element of mig matrix set to m_ij.)
		 -ma m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
		 -n i size_i   (popi has size set to size_i*N0 
		 -g i alpha_i  (If used must appear after -M option.)
	   The following options modify parameters at the time 't' specified as the first argument:
	 -eG t alpha  (Modify growth rate of all pop's.)
	 -eg t i alpha_i  (Modify growth rate of pop i.) 
	 -eM t mig_rate   (Modify the mig matrix so all elements are mig_rate/(npop-1)
	 -em t i j m_ij    (i,j-th element of mig matrix set to m_ij at time t )
	 -ema t npop  m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
	 -eN t size  (Modify pop sizes. New sizes = size*N0 ) 
	 -en t i size_i  (Modify pop size of pop i.  New size of popi = size_i*N0 .)
	 -es t i proportion  (Split: pop i -> pop-i + pop-npop, npop increases by 1.
		 proportion is probability that each lineage stays in pop-i. (p, 1-p are admixt. proport.
		 Size of pop npop is set to N0 and alpha = 0.0 , size and alpha of pop i are unchanged.
	 -ej t i j   ( Join lineages in pop i and pop j into pop j
		  size, alpha and M are unchanged.
	  -f filename     ( Read command line arguments from file filename.)
 See msdoc.pdf for explanation of these parameters.
NO! at ../../prefersim_additionals/Traj_mssel_2.pl line 21.
 file format error.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.405.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
Second argument error. howmany <= 0. 
usage: mssel nsam howmany nanc nder selfilename selspot -r rho nsites [options] 
  Options: 
	 -t theta   (this option and/or the next must be used. Theta = 4*N0*u )
	 -s segsites   ( fixed number of segregating sites)
	 -T          (Output gene tree.)
	 -F minfreq     Output only sites with freq of minor allele >= minfreq.
	 -r rho nsites     (rho here is 4Nc)
		 -c f track_len   (f = ratio of conversion rate to rec rate. tracklen is mean length.) 
			 if rho = 0.,  f = 4*N0*g, with g the gene conversion rate.
	 -G alpha  ( N(t) = N0*exp(-alpha*t) .  alpha = -log(Np/Nr)/t
	 -I npop n1 n2 ... [mig_rate] (all elements of mig matrix set to mig_rate/(npop-1) 
		 -m i j m_ij    (i,j-th element of mig matrix set to m_ij.)
		 -ma m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
		 -n i size_i   (popi has size set to size_i*N0 
		 -g i alpha_i  (If used must appear after -M option.)
	   The following options modify parameters at the time 't' specified as the first argument:
	 -eG t alpha  (Modify growth rate of all pop's.)
	 -eg t i alpha_i  (Modify growth rate of pop i.) 
	 -eM t mig_rate   (Modify the mig matrix so all elements are mig_rate/(npop-1)
	 -em t i j m_ij    (i,j-th element of mig matrix set to m_ij at time t )
	 -ema t npop  m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
	 -eN t size  (Modify pop sizes. New sizes = size*N0 ) 
	 -en t i size_i  (Modify pop size of pop i.  New size of popi = size_i*N0 .)
	 -es t i proportion  (Split: pop i -> pop-i + pop-npop, npop increases by 1.
		 proportion is probability that each lineage stays in pop-i. (p, 1-p are admixt. proport.
		 Size of pop npop is set to N0 and alpha = 0.0 , size and alpha of pop i are unchanged.
	 -ej t i j   ( Join lineages in pop i and pop j into pop j
		  size, alpha and M are unchanged.
	  -f filename     ( Read command line arguments from file filename.)
 See msdoc.pdf for explanation of these parameters.
NO! at ../../prefersim_additionals/Traj_mssel_2.pl line 21.
 file format error.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.410.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
Second argument error. howmany <= 0. 
usage: mssel nsam howmany nanc nder selfilename selspot -r rho nsites [options] 
  Options: 
	 -t theta   (this option and/or the next must be used. Theta = 4*N0*u )
	 -s segsites   ( fixed number of segregating sites)
	 -T          (Output gene tree.)
	 -F minfreq     Output only sites with freq of minor allele >= minfreq.
	 -r rho nsites     (rho here is 4Nc)
		 -c f track_len   (f = ratio of conversion rate to rec rate. tracklen is mean length.) 
			 if rho = 0.,  f = 4*N0*g, with g the gene conversion rate.
	 -G alpha  ( N(t) = N0*exp(-alpha*t) .  alpha = -log(Np/Nr)/t
	 -I npop n1 n2 ... [mig_rate] (all elements of mig matrix set to mig_rate/(npop-1) 
		 -m i j m_ij    (i,j-th element of mig matrix set to m_ij.)
		 -ma m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
		 -n i size_i   (popi has size set to size_i*N0 
		 -g i alpha_i  (If used must appear after -M option.)
	   The following options modify parameters at the time 't' specified as the first argument:
	 -eG t alpha  (Modify growth rate of all pop's.)
	 -eg t i alpha_i  (Modify growth rate of pop i.) 
	 -eM t mig_rate   (Modify the mig matrix so all elements are mig_rate/(npop-1)
	 -em t i j m_ij    (i,j-th element of mig matrix set to m_ij at time t )
	 -ema t npop  m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
	 -eN t size  (Modify pop sizes. New sizes = size*N0 ) 
	 -en t i size_i  (Modify pop size of pop i.  New size of popi = size_i*N0 .)
	 -es t i proportion  (Split: pop i -> pop-i + pop-npop, npop increases by 1.
		 proportion is probability that each lineage stays in pop-i. (p, 1-p are admixt. proport.
		 Size of pop npop is set to N0 and alpha = 0.0 , size and alpha of pop i are unchanged.
	 -ej t i j   ( Join lineages in pop i and pop j into pop j
		  size, alpha and M are unchanged.
	  -f filename     ( Read command line arguments from file filename.)
 See msdoc.pdf for explanation of these parameters.
NO! at ../../prefersim_additionals/Traj_mssel_2.pl line 21.
 file format error.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.415.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
Second argument error. howmany <= 0. 
usage: mssel nsam howmany nanc nder selfilename selspot -r rho nsites [options] 
  Options: 
	 -t theta   (this option and/or the next must be used. Theta = 4*N0*u )
	 -s segsites   ( fixed number of segregating sites)
	 -T          (Output gene tree.)
	 -F minfreq     Output only sites with freq of minor allele >= minfreq.
	 -r rho nsites     (rho here is 4Nc)
		 -c f track_len   (f = ratio of conversion rate to rec rate. tracklen is mean length.) 
			 if rho = 0.,  f = 4*N0*g, with g the gene conversion rate.
	 -G alpha  ( N(t) = N0*exp(-alpha*t) .  alpha = -log(Np/Nr)/t
	 -I npop n1 n2 ... [mig_rate] (all elements of mig matrix set to mig_rate/(npop-1) 
		 -m i j m_ij    (i,j-th element of mig matrix set to m_ij.)
		 -ma m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
		 -n i size_i   (popi has size set to size_i*N0 
		 -g i alpha_i  (If used must appear after -M option.)
	   The following options modify parameters at the time 't' specified as the first argument:
	 -eG t alpha  (Modify growth rate of all pop's.)
	 -eg t i alpha_i  (Modify growth rate of pop i.) 
	 -eM t mig_rate   (Modify the mig matrix so all elements are mig_rate/(npop-1)
	 -em t i j m_ij    (i,j-th element of mig matrix set to m_ij at time t )
	 -ema t npop  m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
	 -eN t size  (Modify pop sizes. New sizes = size*N0 ) 
	 -en t i size_i  (Modify pop size of pop i.  New size of popi = size_i*N0 .)
	 -es t i proportion  (Split: pop i -> pop-i + pop-npop, npop increases by 1.
		 proportion is probability that each lineage stays in pop-i. (p, 1-p are admixt. proport.
		 Size of pop npop is set to N0 and alpha = 0.0 , size and alpha of pop i are unchanged.
	 -ej t i j   ( Join lineages in pop i and pop j into pop j
		  size, alpha and M are unchanged.
	  -f filename     ( Read command line arguments from file filename.)
 See msdoc.pdf for explanation of these parameters.
NO! at ../../prefersim_additionals/Traj_mssel_2.pl line 21.
 file format error.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.420.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
Second argument error. howmany <= 0. 
usage: mssel nsam howmany nanc nder selfilename selspot -r rho nsites [options] 
  Options: 
	 -t theta   (this option and/or the next must be used. Theta = 4*N0*u )
	 -s segsites   ( fixed number of segregating sites)
	 -T          (Output gene tree.)
	 -F minfreq     Output only sites with freq of minor allele >= minfreq.
	 -r rho nsites     (rho here is 4Nc)
		 -c f track_len   (f = ratio of conversion rate to rec rate. tracklen is mean length.) 
			 if rho = 0.,  f = 4*N0*g, with g the gene conversion rate.
	 -G alpha  ( N(t) = N0*exp(-alpha*t) .  alpha = -log(Np/Nr)/t
	 -I npop n1 n2 ... [mig_rate] (all elements of mig matrix set to mig_rate/(npop-1) 
		 -m i j m_ij    (i,j-th element of mig matrix set to m_ij.)
		 -ma m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
		 -n i size_i   (popi has size set to size_i*N0 
		 -g i alpha_i  (If used must appear after -M option.)
	   The following options modify parameters at the time 't' specified as the first argument:
	 -eG t alpha  (Modify growth rate of all pop's.)
	 -eg t i alpha_i  (Modify growth rate of pop i.) 
	 -eM t mig_rate   (Modify the mig matrix so all elements are mig_rate/(npop-1)
	 -em t i j m_ij    (i,j-th element of mig matrix set to m_ij at time t )
	 -ema t npop  m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
	 -eN t size  (Modify pop sizes. New sizes = size*N0 ) 
	 -en t i size_i  (Modify pop size of pop i.  New size of popi = size_i*N0 .)
	 -es t i proportion  (Split: pop i -> pop-i + pop-npop, npop increases by 1.
		 proportion is probability that each lineage stays in pop-i. (p, 1-p are admixt. proport.
		 Size of pop npop is set to N0 and alpha = 0.0 , size and alpha of pop i are unchanged.
	 -ej t i j   ( Join lineages in pop i and pop j into pop j
		  size, alpha and M are unchanged.
	  -f filename     ( Read command line arguments from file filename.)
 See msdoc.pdf for explanation of these parameters.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.425.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
NO! at ../../prefersim_additionals/Traj_mssel_2.pl line 21.
 file format error.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.430.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
Second argument error. howmany <= 0. 
usage: mssel nsam howmany nanc nder selfilename selspot -r rho nsites [options] 
  Options: 
	 -t theta   (this option and/or the next must be used. Theta = 4*N0*u )
	 -s segsites   ( fixed number of segregating sites)
	 -T          (Output gene tree.)
	 -F minfreq     Output only sites with freq of minor allele >= minfreq.
	 -r rho nsites     (rho here is 4Nc)
		 -c f track_len   (f = ratio of conversion rate to rec rate. tracklen is mean length.) 
			 if rho = 0.,  f = 4*N0*g, with g the gene conversion rate.
	 -G alpha  ( N(t) = N0*exp(-alpha*t) .  alpha = -log(Np/Nr)/t
	 -I npop n1 n2 ... [mig_rate] (all elements of mig matrix set to mig_rate/(npop-1) 
		 -m i j m_ij    (i,j-th element of mig matrix set to m_ij.)
		 -ma m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
		 -n i size_i   (popi has size set to size_i*N0 
		 -g i alpha_i  (If used must appear after -M option.)
	   The following options modify parameters at the time 't' specified as the first argument:
	 -eG t alpha  (Modify growth rate of all pop's.)
	 -eg t i alpha_i  (Modify growth rate of pop i.) 
	 -eM t mig_rate   (Modify the mig matrix so all elements are mig_rate/(npop-1)
	 -em t i j m_ij    (i,j-th element of mig matrix set to m_ij at time t )
	 -ema t npop  m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
	 -eN t size  (Modify pop sizes. New sizes = size*N0 ) 
	 -en t i size_i  (Modify pop size of pop i.  New size of popi = size_i*N0 .)
	 -es t i proportion  (Split: pop i -> pop-i + pop-npop, npop increases by 1.
		 proportion is probability that each lineage stays in pop-i. (p, 1-p are admixt. proport.
		 Size of pop npop is set to N0 and alpha = 0.0 , size and alpha of pop i are unchanged.
	 -ej t i j   ( Join lineages in pop i and pop j into pop j
		  size, alpha and M are unchanged.
	  -f filename     ( Read command line arguments from file filename.)
 See msdoc.pdf for explanation of these parameters.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.435.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
NO! at ../../prefersim_additionals/Traj_mssel_2.pl line 21.
 file format error.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.440.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
Second argument error. howmany <= 0. 
usage: mssel nsam howmany nanc nder selfilename selspot -r rho nsites [options] 
  Options: 
	 -t theta   (this option and/or the next must be used. Theta = 4*N0*u )
	 -s segsites   ( fixed number of segregating sites)
	 -T          (Output gene tree.)
	 -F minfreq     Output only sites with freq of minor allele >= minfreq.
	 -r rho nsites     (rho here is 4Nc)
		 -c f track_len   (f = ratio of conversion rate to rec rate. tracklen is mean length.) 
			 if rho = 0.,  f = 4*N0*g, with g the gene conversion rate.
	 -G alpha  ( N(t) = N0*exp(-alpha*t) .  alpha = -log(Np/Nr)/t
	 -I npop n1 n2 ... [mig_rate] (all elements of mig matrix set to mig_rate/(npop-1) 
		 -m i j m_ij    (i,j-th element of mig matrix set to m_ij.)
		 -ma m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
		 -n i size_i   (popi has size set to size_i*N0 
		 -g i alpha_i  (If used must appear after -M option.)
	   The following options modify parameters at the time 't' specified as the first argument:
	 -eG t alpha  (Modify growth rate of all pop's.)
	 -eg t i alpha_i  (Modify growth rate of pop i.) 
	 -eM t mig_rate   (Modify the mig matrix so all elements are mig_rate/(npop-1)
	 -em t i j m_ij    (i,j-th element of mig matrix set to m_ij at time t )
	 -ema t npop  m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
	 -eN t size  (Modify pop sizes. New sizes = size*N0 ) 
	 -en t i size_i  (Modify pop size of pop i.  New size of popi = size_i*N0 .)
	 -es t i proportion  (Split: pop i -> pop-i + pop-npop, npop increases by 1.
		 proportion is probability that each lineage stays in pop-i. (p, 1-p are admixt. proport.
		 Size of pop npop is set to N0 and alpha = 0.0 , size and alpha of pop i are unchanged.
	 -ej t i j   ( Join lineages in pop i and pop j into pop j
		  size, alpha and M are unchanged.
	  -f filename     ( Read command line arguments from file filename.)
 See msdoc.pdf for explanation of these parameters.
NO! at ../../prefersim_additionals/Traj_mssel_2.pl line 21.
 file format error.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.445.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
Second argument error. howmany <= 0. 
usage: mssel nsam howmany nanc nder selfilename selspot -r rho nsites [options] 
  Options: 
	 -t theta   (this option and/or the next must be used. Theta = 4*N0*u )
	 -s segsites   ( fixed number of segregating sites)
	 -T          (Output gene tree.)
	 -F minfreq     Output only sites with freq of minor allele >= minfreq.
	 -r rho nsites     (rho here is 4Nc)
		 -c f track_len   (f = ratio of conversion rate to rec rate. tracklen is mean length.) 
			 if rho = 0.,  f = 4*N0*g, with g the gene conversion rate.
	 -G alpha  ( N(t) = N0*exp(-alpha*t) .  alpha = -log(Np/Nr)/t
	 -I npop n1 n2 ... [mig_rate] (all elements of mig matrix set to mig_rate/(npop-1) 
		 -m i j m_ij    (i,j-th element of mig matrix set to m_ij.)
		 -ma m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
		 -n i size_i   (popi has size set to size_i*N0 
		 -g i alpha_i  (If used must appear after -M option.)
	   The following options modify parameters at the time 't' specified as the first argument:
	 -eG t alpha  (Modify growth rate of all pop's.)
	 -eg t i alpha_i  (Modify growth rate of pop i.) 
	 -eM t mig_rate   (Modify the mig matrix so all elements are mig_rate/(npop-1)
	 -em t i j m_ij    (i,j-th element of mig matrix set to m_ij at time t )
	 -ema t npop  m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
	 -eN t size  (Modify pop sizes. New sizes = size*N0 ) 
	 -en t i size_i  (Modify pop size of pop i.  New size of popi = size_i*N0 .)
	 -es t i proportion  (Split: pop i -> pop-i + pop-npop, npop increases by 1.
		 proportion is probability that each lineage stays in pop-i. (p, 1-p are admixt. proport.
		 Size of pop npop is set to N0 and alpha = 0.0 , size and alpha of pop i are unchanged.
	 -ej t i j   ( Join lineages in pop i and pop j into pop j
		  size, alpha and M are unchanged.
	  -f filename     ( Read command line arguments from file filename.)
 See msdoc.pdf for explanation of these parameters.
NO! at ../../prefersim_additionals/Traj_mssel_2.pl line 21.
 file format error.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.450.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
Second argument error. howmany <= 0. 
usage: mssel nsam howmany nanc nder selfilename selspot -r rho nsites [options] 
  Options: 
	 -t theta   (this option and/or the next must be used. Theta = 4*N0*u )
	 -s segsites   ( fixed number of segregating sites)
	 -T          (Output gene tree.)
	 -F minfreq     Output only sites with freq of minor allele >= minfreq.
	 -r rho nsites     (rho here is 4Nc)
		 -c f track_len   (f = ratio of conversion rate to rec rate. tracklen is mean length.) 
			 if rho = 0.,  f = 4*N0*g, with g the gene conversion rate.
	 -G alpha  ( N(t) = N0*exp(-alpha*t) .  alpha = -log(Np/Nr)/t
	 -I npop n1 n2 ... [mig_rate] (all elements of mig matrix set to mig_rate/(npop-1) 
		 -m i j m_ij    (i,j-th element of mig matrix set to m_ij.)
		 -ma m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
		 -n i size_i   (popi has size set to size_i*N0 
		 -g i alpha_i  (If used must appear after -M option.)
	   The following options modify parameters at the time 't' specified as the first argument:
	 -eG t alpha  (Modify growth rate of all pop's.)
	 -eg t i alpha_i  (Modify growth rate of pop i.) 
	 -eM t mig_rate   (Modify the mig matrix so all elements are mig_rate/(npop-1)
	 -em t i j m_ij    (i,j-th element of mig matrix set to m_ij at time t )
	 -ema t npop  m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
	 -eN t size  (Modify pop sizes. New sizes = size*N0 ) 
	 -en t i size_i  (Modify pop size of pop i.  New size of popi = size_i*N0 .)
	 -es t i proportion  (Split: pop i -> pop-i + pop-npop, npop increases by 1.
		 proportion is probability that each lineage stays in pop-i. (p, 1-p are admixt. proport.
		 Size of pop npop is set to N0 and alpha = 0.0 , size and alpha of pop i are unchanged.
	 -ej t i j   ( Join lineages in pop i and pop j into pop j
		  size, alpha and M are unchanged.
	  -f filename     ( Read command line arguments from file filename.)
 See msdoc.pdf for explanation of these parameters.
NO! at ../../prefersim_additionals/Traj_mssel_2.pl line 21.
 file format error.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.455.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
Second argument error. howmany <= 0. 
usage: mssel nsam howmany nanc nder selfilename selspot -r rho nsites [options] 
  Options: 
	 -t theta   (this option and/or the next must be used. Theta = 4*N0*u )
	 -s segsites   ( fixed number of segregating sites)
	 -T          (Output gene tree.)
	 -F minfreq     Output only sites with freq of minor allele >= minfreq.
	 -r rho nsites     (rho here is 4Nc)
		 -c f track_len   (f = ratio of conversion rate to rec rate. tracklen is mean length.) 
			 if rho = 0.,  f = 4*N0*g, with g the gene conversion rate.
	 -G alpha  ( N(t) = N0*exp(-alpha*t) .  alpha = -log(Np/Nr)/t
	 -I npop n1 n2 ... [mig_rate] (all elements of mig matrix set to mig_rate/(npop-1) 
		 -m i j m_ij    (i,j-th element of mig matrix set to m_ij.)
		 -ma m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
		 -n i size_i   (popi has size set to size_i*N0 
		 -g i alpha_i  (If used must appear after -M option.)
	   The following options modify parameters at the time 't' specified as the first argument:
	 -eG t alpha  (Modify growth rate of all pop's.)
	 -eg t i alpha_i  (Modify growth rate of pop i.) 
	 -eM t mig_rate   (Modify the mig matrix so all elements are mig_rate/(npop-1)
	 -em t i j m_ij    (i,j-th element of mig matrix set to m_ij at time t )
	 -ema t npop  m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
	 -eN t size  (Modify pop sizes. New sizes = size*N0 ) 
	 -en t i size_i  (Modify pop size of pop i.  New size of popi = size_i*N0 .)
	 -es t i proportion  (Split: pop i -> pop-i + pop-npop, npop increases by 1.
		 proportion is probability that each lineage stays in pop-i. (p, 1-p are admixt. proport.
		 Size of pop npop is set to N0 and alpha = 0.0 , size and alpha of pop i are unchanged.
	 -ej t i j   ( Join lineages in pop i and pop j into pop j
		  size, alpha and M are unchanged.
	  -f filename     ( Read command line arguments from file filename.)
 See msdoc.pdf for explanation of these parameters.
NO! at ../../prefersim_additionals/Traj_mssel_2.pl line 21.
 file format error.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.460.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
Second argument error. howmany <= 0. 
usage: mssel nsam howmany nanc nder selfilename selspot -r rho nsites [options] 
  Options: 
	 -t theta   (this option and/or the next must be used. Theta = 4*N0*u )
	 -s segsites   ( fixed number of segregating sites)
	 -T          (Output gene tree.)
	 -F minfreq     Output only sites with freq of minor allele >= minfreq.
	 -r rho nsites     (rho here is 4Nc)
		 -c f track_len   (f = ratio of conversion rate to rec rate. tracklen is mean length.) 
			 if rho = 0.,  f = 4*N0*g, with g the gene conversion rate.
	 -G alpha  ( N(t) = N0*exp(-alpha*t) .  alpha = -log(Np/Nr)/t
	 -I npop n1 n2 ... [mig_rate] (all elements of mig matrix set to mig_rate/(npop-1) 
		 -m i j m_ij    (i,j-th element of mig matrix set to m_ij.)
		 -ma m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
		 -n i size_i   (popi has size set to size_i*N0 
		 -g i alpha_i  (If used must appear after -M option.)
	   The following options modify parameters at the time 't' specified as the first argument:
	 -eG t alpha  (Modify growth rate of all pop's.)
	 -eg t i alpha_i  (Modify growth rate of pop i.) 
	 -eM t mig_rate   (Modify the mig matrix so all elements are mig_rate/(npop-1)
	 -em t i j m_ij    (i,j-th element of mig matrix set to m_ij at time t )
	 -ema t npop  m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
	 -eN t size  (Modify pop sizes. New sizes = size*N0 ) 
	 -en t i size_i  (Modify pop size of pop i.  New size of popi = size_i*N0 .)
	 -es t i proportion  (Split: pop i -> pop-i + pop-npop, npop increases by 1.
		 proportion is probability that each lineage stays in pop-i. (p, 1-p are admixt. proport.
		 Size of pop npop is set to N0 and alpha = 0.0 , size and alpha of pop i are unchanged.
	 -ej t i j   ( Join lineages in pop i and pop j into pop j
		  size, alpha and M are unchanged.
	  -f filename     ( Read command line arguments from file filename.)
 See msdoc.pdf for explanation of these parameters.
NO! at ../../prefersim_additionals/Traj_mssel_2.pl line 21.
 file format error.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.465.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
Second argument error. howmany <= 0. 
usage: mssel nsam howmany nanc nder selfilename selspot -r rho nsites [options] 
  Options: 
	 -t theta   (this option and/or the next must be used. Theta = 4*N0*u )
	 -s segsites   ( fixed number of segregating sites)
	 -T          (Output gene tree.)
	 -F minfreq     Output only sites with freq of minor allele >= minfreq.
	 -r rho nsites     (rho here is 4Nc)
		 -c f track_len   (f = ratio of conversion rate to rec rate. tracklen is mean length.) 
			 if rho = 0.,  f = 4*N0*g, with g the gene conversion rate.
	 -G alpha  ( N(t) = N0*exp(-alpha*t) .  alpha = -log(Np/Nr)/t
	 -I npop n1 n2 ... [mig_rate] (all elements of mig matrix set to mig_rate/(npop-1) 
		 -m i j m_ij    (i,j-th element of mig matrix set to m_ij.)
		 -ma m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
		 -n i size_i   (popi has size set to size_i*N0 
		 -g i alpha_i  (If used must appear after -M option.)
	   The following options modify parameters at the time 't' specified as the first argument:
	 -eG t alpha  (Modify growth rate of all pop's.)
	 -eg t i alpha_i  (Modify growth rate of pop i.) 
	 -eM t mig_rate   (Modify the mig matrix so all elements are mig_rate/(npop-1)
	 -em t i j m_ij    (i,j-th element of mig matrix set to m_ij at time t )
	 -ema t npop  m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
	 -eN t size  (Modify pop sizes. New sizes = size*N0 ) 
	 -en t i size_i  (Modify pop size of pop i.  New size of popi = size_i*N0 .)
	 -es t i proportion  (Split: pop i -> pop-i + pop-npop, npop increases by 1.
		 proportion is probability that each lineage stays in pop-i. (p, 1-p are admixt. proport.
		 Size of pop npop is set to N0 and alpha = 0.0 , size and alpha of pop i are unchanged.
	 -ej t i j   ( Join lineages in pop i and pop j into pop j
		  size, alpha and M are unchanged.
	  -f filename     ( Read command line arguments from file filename.)
 See msdoc.pdf for explanation of these parameters.
NO! at ../../prefersim_additionals/Traj_mssel_2.pl line 21.
 file format error.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.470.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
Second argument error. howmany <= 0. 
usage: mssel nsam howmany nanc nder selfilename selspot -r rho nsites [options] 
  Options: 
	 -t theta   (this option and/or the next must be used. Theta = 4*N0*u )
	 -s segsites   ( fixed number of segregating sites)
	 -T          (Output gene tree.)
	 -F minfreq     Output only sites with freq of minor allele >= minfreq.
	 -r rho nsites     (rho here is 4Nc)
		 -c f track_len   (f = ratio of conversion rate to rec rate. tracklen is mean length.) 
			 if rho = 0.,  f = 4*N0*g, with g the gene conversion rate.
	 -G alpha  ( N(t) = N0*exp(-alpha*t) .  alpha = -log(Np/Nr)/t
	 -I npop n1 n2 ... [mig_rate] (all elements of mig matrix set to mig_rate/(npop-1) 
		 -m i j m_ij    (i,j-th element of mig matrix set to m_ij.)
		 -ma m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
		 -n i size_i   (popi has size set to size_i*N0 
		 -g i alpha_i  (If used must appear after -M option.)
	   The following options modify parameters at the time 't' specified as the first argument:
	 -eG t alpha  (Modify growth rate of all pop's.)
	 -eg t i alpha_i  (Modify growth rate of pop i.) 
	 -eM t mig_rate   (Modify the mig matrix so all elements are mig_rate/(npop-1)
	 -em t i j m_ij    (i,j-th element of mig matrix set to m_ij at time t )
	 -ema t npop  m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
	 -eN t size  (Modify pop sizes. New sizes = size*N0 ) 
	 -en t i size_i  (Modify pop size of pop i.  New size of popi = size_i*N0 .)
	 -es t i proportion  (Split: pop i -> pop-i + pop-npop, npop increases by 1.
		 proportion is probability that each lineage stays in pop-i. (p, 1-p are admixt. proport.
		 Size of pop npop is set to N0 and alpha = 0.0 , size and alpha of pop i are unchanged.
	 -ej t i j   ( Join lineages in pop i and pop j into pop j
		  size, alpha and M are unchanged.
	  -f filename     ( Read command line arguments from file filename.)
 See msdoc.pdf for explanation of these parameters.
NO! at ../../prefersim_additionals/Traj_mssel_2.pl line 21.
 file format error.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.475.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
Second argument error. howmany <= 0. 
usage: mssel nsam howmany nanc nder selfilename selspot -r rho nsites [options] 
  Options: 
	 -t theta   (this option and/or the next must be used. Theta = 4*N0*u )
	 -s segsites   ( fixed number of segregating sites)
	 -T          (Output gene tree.)
	 -F minfreq     Output only sites with freq of minor allele >= minfreq.
	 -r rho nsites     (rho here is 4Nc)
		 -c f track_len   (f = ratio of conversion rate to rec rate. tracklen is mean length.) 
			 if rho = 0.,  f = 4*N0*g, with g the gene conversion rate.
	 -G alpha  ( N(t) = N0*exp(-alpha*t) .  alpha = -log(Np/Nr)/t
	 -I npop n1 n2 ... [mig_rate] (all elements of mig matrix set to mig_rate/(npop-1) 
		 -m i j m_ij    (i,j-th element of mig matrix set to m_ij.)
		 -ma m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
		 -n i size_i   (popi has size set to size_i*N0 
		 -g i alpha_i  (If used must appear after -M option.)
	   The following options modify parameters at the time 't' specified as the first argument:
	 -eG t alpha  (Modify growth rate of all pop's.)
	 -eg t i alpha_i  (Modify growth rate of pop i.) 
	 -eM t mig_rate   (Modify the mig matrix so all elements are mig_rate/(npop-1)
	 -em t i j m_ij    (i,j-th element of mig matrix set to m_ij at time t )
	 -ema t npop  m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
	 -eN t size  (Modify pop sizes. New sizes = size*N0 ) 
	 -en t i size_i  (Modify pop size of pop i.  New size of popi = size_i*N0 .)
	 -es t i proportion  (Split: pop i -> pop-i + pop-npop, npop increases by 1.
		 proportion is probability that each lineage stays in pop-i. (p, 1-p are admixt. proport.
		 Size of pop npop is set to N0 and alpha = 0.0 , size and alpha of pop i are unchanged.
	 -ej t i j   ( Join lineages in pop i and pop j into pop j
		  size, alpha and M are unchanged.
	  -f filename     ( Read command line arguments from file filename.)
 See msdoc.pdf for explanation of these parameters.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.480.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
NO! at ../../prefersim_additionals/Traj_mssel_2.pl line 21.
 file format error.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.485.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
Second argument error. howmany <= 0. 
usage: mssel nsam howmany nanc nder selfilename selspot -r rho nsites [options] 
  Options: 
	 -t theta   (this option and/or the next must be used. Theta = 4*N0*u )
	 -s segsites   ( fixed number of segregating sites)
	 -T          (Output gene tree.)
	 -F minfreq     Output only sites with freq of minor allele >= minfreq.
	 -r rho nsites     (rho here is 4Nc)
		 -c f track_len   (f = ratio of conversion rate to rec rate. tracklen is mean length.) 
			 if rho = 0.,  f = 4*N0*g, with g the gene conversion rate.
	 -G alpha  ( N(t) = N0*exp(-alpha*t) .  alpha = -log(Np/Nr)/t
	 -I npop n1 n2 ... [mig_rate] (all elements of mig matrix set to mig_rate/(npop-1) 
		 -m i j m_ij    (i,j-th element of mig matrix set to m_ij.)
		 -ma m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
		 -n i size_i   (popi has size set to size_i*N0 
		 -g i alpha_i  (If used must appear after -M option.)
	   The following options modify parameters at the time 't' specified as the first argument:
	 -eG t alpha  (Modify growth rate of all pop's.)
	 -eg t i alpha_i  (Modify growth rate of pop i.) 
	 -eM t mig_rate   (Modify the mig matrix so all elements are mig_rate/(npop-1)
	 -em t i j m_ij    (i,j-th element of mig matrix set to m_ij at time t )
	 -ema t npop  m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
	 -eN t size  (Modify pop sizes. New sizes = size*N0 ) 
	 -en t i size_i  (Modify pop size of pop i.  New size of popi = size_i*N0 .)
	 -es t i proportion  (Split: pop i -> pop-i + pop-npop, npop increases by 1.
		 proportion is probability that each lineage stays in pop-i. (p, 1-p are admixt. proport.
		 Size of pop npop is set to N0 and alpha = 0.0 , size and alpha of pop i are unchanged.
	 -ej t i j   ( Join lineages in pop i and pop j into pop j
		  size, alpha and M are unchanged.
	  -f filename     ( Read command line arguments from file filename.)
 See msdoc.pdf for explanation of these parameters.
NO! at ../../prefersim_additionals/Traj_mssel_2.pl line 21.
 file format error.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.490.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
Second argument error. howmany <= 0. 
usage: mssel nsam howmany nanc nder selfilename selspot -r rho nsites [options] 
  Options: 
	 -t theta   (this option and/or the next must be used. Theta = 4*N0*u )
	 -s segsites   ( fixed number of segregating sites)
	 -T          (Output gene tree.)
	 -F minfreq     Output only sites with freq of minor allele >= minfreq.
	 -r rho nsites     (rho here is 4Nc)
		 -c f track_len   (f = ratio of conversion rate to rec rate. tracklen is mean length.) 
			 if rho = 0.,  f = 4*N0*g, with g the gene conversion rate.
	 -G alpha  ( N(t) = N0*exp(-alpha*t) .  alpha = -log(Np/Nr)/t
	 -I npop n1 n2 ... [mig_rate] (all elements of mig matrix set to mig_rate/(npop-1) 
		 -m i j m_ij    (i,j-th element of mig matrix set to m_ij.)
		 -ma m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
		 -n i size_i   (popi has size set to size_i*N0 
		 -g i alpha_i  (If used must appear after -M option.)
	   The following options modify parameters at the time 't' specified as the first argument:
	 -eG t alpha  (Modify growth rate of all pop's.)
	 -eg t i alpha_i  (Modify growth rate of pop i.) 
	 -eM t mig_rate   (Modify the mig matrix so all elements are mig_rate/(npop-1)
	 -em t i j m_ij    (i,j-th element of mig matrix set to m_ij at time t )
	 -ema t npop  m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
	 -eN t size  (Modify pop sizes. New sizes = size*N0 ) 
	 -en t i size_i  (Modify pop size of pop i.  New size of popi = size_i*N0 .)
	 -es t i proportion  (Split: pop i -> pop-i + pop-npop, npop increases by 1.
		 proportion is probability that each lineage stays in pop-i. (p, 1-p are admixt. proport.
		 Size of pop npop is set to N0 and alpha = 0.0 , size and alpha of pop i are unchanged.
	 -ej t i j   ( Join lineages in pop i and pop j into pop j
		  size, alpha and M are unchanged.
	  -f filename     ( Read command line arguments from file filename.)
 See msdoc.pdf for explanation of these parameters.
NO! at ../../prefersim_additionals/Traj_mssel_2.pl line 21.
 file format error.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.495.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
Second argument error. howmany <= 0. 
usage: mssel nsam howmany nanc nder selfilename selspot -r rho nsites [options] 
  Options: 
	 -t theta   (this option and/or the next must be used. Theta = 4*N0*u )
	 -s segsites   ( fixed number of segregating sites)
	 -T          (Output gene tree.)
	 -F minfreq     Output only sites with freq of minor allele >= minfreq.
	 -r rho nsites     (rho here is 4Nc)
		 -c f track_len   (f = ratio of conversion rate to rec rate. tracklen is mean length.) 
			 if rho = 0.,  f = 4*N0*g, with g the gene conversion rate.
	 -G alpha  ( N(t) = N0*exp(-alpha*t) .  alpha = -log(Np/Nr)/t
	 -I npop n1 n2 ... [mig_rate] (all elements of mig matrix set to mig_rate/(npop-1) 
		 -m i j m_ij    (i,j-th element of mig matrix set to m_ij.)
		 -ma m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
		 -n i size_i   (popi has size set to size_i*N0 
		 -g i alpha_i  (If used must appear after -M option.)
	   The following options modify parameters at the time 't' specified as the first argument:
	 -eG t alpha  (Modify growth rate of all pop's.)
	 -eg t i alpha_i  (Modify growth rate of pop i.) 
	 -eM t mig_rate   (Modify the mig matrix so all elements are mig_rate/(npop-1)
	 -em t i j m_ij    (i,j-th element of mig matrix set to m_ij at time t )
	 -ema t npop  m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
	 -eN t size  (Modify pop sizes. New sizes = size*N0 ) 
	 -en t i size_i  (Modify pop size of pop i.  New size of popi = size_i*N0 .)
	 -es t i proportion  (Split: pop i -> pop-i + pop-npop, npop increases by 1.
		 proportion is probability that each lineage stays in pop-i. (p, 1-p are admixt. proport.
		 Size of pop npop is set to N0 and alpha = 0.0 , size and alpha of pop i are unchanged.
	 -ej t i j   ( Join lineages in pop i and pop j into pop j
		  size, alpha and M are unchanged.
	  -f filename     ( Read command line arguments from file filename.)
 See msdoc.pdf for explanation of these parameters.
NO! at ../../prefersim_additionals/Traj_mssel_2.pl line 21.
 file format error.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.500.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
Second argument error. howmany <= 0. 
usage: mssel nsam howmany nanc nder selfilename selspot -r rho nsites [options] 
  Options: 
	 -t theta   (this option and/or the next must be used. Theta = 4*N0*u )
	 -s segsites   ( fixed number of segregating sites)
	 -T          (Output gene tree.)
	 -F minfreq     Output only sites with freq of minor allele >= minfreq.
	 -r rho nsites     (rho here is 4Nc)
		 -c f track_len   (f = ratio of conversion rate to rec rate. tracklen is mean length.) 
			 if rho = 0.,  f = 4*N0*g, with g the gene conversion rate.
	 -G alpha  ( N(t) = N0*exp(-alpha*t) .  alpha = -log(Np/Nr)/t
	 -I npop n1 n2 ... [mig_rate] (all elements of mig matrix set to mig_rate/(npop-1) 
		 -m i j m_ij    (i,j-th element of mig matrix set to m_ij.)
		 -ma m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
		 -n i size_i   (popi has size set to size_i*N0 
		 -g i alpha_i  (If used must appear after -M option.)
	   The following options modify parameters at the time 't' specified as the first argument:
	 -eG t alpha  (Modify growth rate of all pop's.)
	 -eg t i alpha_i  (Modify growth rate of pop i.) 
	 -eM t mig_rate   (Modify the mig matrix so all elements are mig_rate/(npop-1)
	 -em t i j m_ij    (i,j-th element of mig matrix set to m_ij at time t )
	 -ema t npop  m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
	 -eN t size  (Modify pop sizes. New sizes = size*N0 ) 
	 -en t i size_i  (Modify pop size of pop i.  New size of popi = size_i*N0 .)
	 -es t i proportion  (Split: pop i -> pop-i + pop-npop, npop increases by 1.
		 proportion is probability that each lineage stays in pop-i. (p, 1-p are admixt. proport.
		 Size of pop npop is set to N0 and alpha = 0.0 , size and alpha of pop i are unchanged.
	 -ej t i j   ( Join lineages in pop i and pop j into pop j
		  size, alpha and M are unchanged.
	  -f filename     ( Read command line arguments from file filename.)
 See msdoc.pdf for explanation of these parameters.
NO! at ../../prefersim_additionals/Traj_mssel_2.pl line 21.
 file format error.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.505.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
Second argument error. howmany <= 0. 
usage: mssel nsam howmany nanc nder selfilename selspot -r rho nsites [options] 
  Options: 
	 -t theta   (this option and/or the next must be used. Theta = 4*N0*u )
	 -s segsites   ( fixed number of segregating sites)
	 -T          (Output gene tree.)
	 -F minfreq     Output only sites with freq of minor allele >= minfreq.
	 -r rho nsites     (rho here is 4Nc)
		 -c f track_len   (f = ratio of conversion rate to rec rate. tracklen is mean length.) 
			 if rho = 0.,  f = 4*N0*g, with g the gene conversion rate.
	 -G alpha  ( N(t) = N0*exp(-alpha*t) .  alpha = -log(Np/Nr)/t
	 -I npop n1 n2 ... [mig_rate] (all elements of mig matrix set to mig_rate/(npop-1) 
		 -m i j m_ij    (i,j-th element of mig matrix set to m_ij.)
		 -ma m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
		 -n i size_i   (popi has size set to size_i*N0 
		 -g i alpha_i  (If used must appear after -M option.)
	   The following options modify parameters at the time 't' specified as the first argument:
	 -eG t alpha  (Modify growth rate of all pop's.)
	 -eg t i alpha_i  (Modify growth rate of pop i.) 
	 -eM t mig_rate   (Modify the mig matrix so all elements are mig_rate/(npop-1)
	 -em t i j m_ij    (i,j-th element of mig matrix set to m_ij at time t )
	 -ema t npop  m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
	 -eN t size  (Modify pop sizes. New sizes = size*N0 ) 
	 -en t i size_i  (Modify pop size of pop i.  New size of popi = size_i*N0 .)
	 -es t i proportion  (Split: pop i -> pop-i + pop-npop, npop increases by 1.
		 proportion is probability that each lineage stays in pop-i. (p, 1-p are admixt. proport.
		 Size of pop npop is set to N0 and alpha = 0.0 , size and alpha of pop i are unchanged.
	 -ej t i j   ( Join lineages in pop i and pop j into pop j
		  size, alpha and M are unchanged.
	  -f filename     ( Read command line arguments from file filename.)
 See msdoc.pdf for explanation of these parameters.
NO! at ../../prefersim_additionals/Traj_mssel_2.pl line 21.
 file format error.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.510.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
Second argument error. howmany <= 0. 
usage: mssel nsam howmany nanc nder selfilename selspot -r rho nsites [options] 
  Options: 
	 -t theta   (this option and/or the next must be used. Theta = 4*N0*u )
	 -s segsites   ( fixed number of segregating sites)
	 -T          (Output gene tree.)
	 -F minfreq     Output only sites with freq of minor allele >= minfreq.
	 -r rho nsites     (rho here is 4Nc)
		 -c f track_len   (f = ratio of conversion rate to rec rate. tracklen is mean length.) 
			 if rho = 0.,  f = 4*N0*g, with g the gene conversion rate.
	 -G alpha  ( N(t) = N0*exp(-alpha*t) .  alpha = -log(Np/Nr)/t
	 -I npop n1 n2 ... [mig_rate] (all elements of mig matrix set to mig_rate/(npop-1) 
		 -m i j m_ij    (i,j-th element of mig matrix set to m_ij.)
		 -ma m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
		 -n i size_i   (popi has size set to size_i*N0 
		 -g i alpha_i  (If used must appear after -M option.)
	   The following options modify parameters at the time 't' specified as the first argument:
	 -eG t alpha  (Modify growth rate of all pop's.)
	 -eg t i alpha_i  (Modify growth rate of pop i.) 
	 -eM t mig_rate   (Modify the mig matrix so all elements are mig_rate/(npop-1)
	 -em t i j m_ij    (i,j-th element of mig matrix set to m_ij at time t )
	 -ema t npop  m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
	 -eN t size  (Modify pop sizes. New sizes = size*N0 ) 
	 -en t i size_i  (Modify pop size of pop i.  New size of popi = size_i*N0 .)
	 -es t i proportion  (Split: pop i -> pop-i + pop-npop, npop increases by 1.
		 proportion is probability that each lineage stays in pop-i. (p, 1-p are admixt. proport.
		 Size of pop npop is set to N0 and alpha = 0.0 , size and alpha of pop i are unchanged.
	 -ej t i j   ( Join lineages in pop i and pop j into pop j
		  size, alpha and M are unchanged.
	  -f filename     ( Read command line arguments from file filename.)
 See msdoc.pdf for explanation of these parameters.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.515.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
NO! at ../../prefersim_additionals/Traj_mssel_2.pl line 21.
 file format error.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.520.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
Second argument error. howmany <= 0. 
usage: mssel nsam howmany nanc nder selfilename selspot -r rho nsites [options] 
  Options: 
	 -t theta   (this option and/or the next must be used. Theta = 4*N0*u )
	 -s segsites   ( fixed number of segregating sites)
	 -T          (Output gene tree.)
	 -F minfreq     Output only sites with freq of minor allele >= minfreq.
	 -r rho nsites     (rho here is 4Nc)
		 -c f track_len   (f = ratio of conversion rate to rec rate. tracklen is mean length.) 
			 if rho = 0.,  f = 4*N0*g, with g the gene conversion rate.
	 -G alpha  ( N(t) = N0*exp(-alpha*t) .  alpha = -log(Np/Nr)/t
	 -I npop n1 n2 ... [mig_rate] (all elements of mig matrix set to mig_rate/(npop-1) 
		 -m i j m_ij    (i,j-th element of mig matrix set to m_ij.)
		 -ma m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
		 -n i size_i   (popi has size set to size_i*N0 
		 -g i alpha_i  (If used must appear after -M option.)
	   The following options modify parameters at the time 't' specified as the first argument:
	 -eG t alpha  (Modify growth rate of all pop's.)
	 -eg t i alpha_i  (Modify growth rate of pop i.) 
	 -eM t mig_rate   (Modify the mig matrix so all elements are mig_rate/(npop-1)
	 -em t i j m_ij    (i,j-th element of mig matrix set to m_ij at time t )
	 -ema t npop  m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
	 -eN t size  (Modify pop sizes. New sizes = size*N0 ) 
	 -en t i size_i  (Modify pop size of pop i.  New size of popi = size_i*N0 .)
	 -es t i proportion  (Split: pop i -> pop-i + pop-npop, npop increases by 1.
		 proportion is probability that each lineage stays in pop-i. (p, 1-p are admixt. proport.
		 Size of pop npop is set to N0 and alpha = 0.0 , size and alpha of pop i are unchanged.
	 -ej t i j   ( Join lineages in pop i and pop j into pop j
		  size, alpha and M are unchanged.
	  -f filename     ( Read command line arguments from file filename.)
 See msdoc.pdf for explanation of these parameters.
NO! at ../../prefersim_additionals/Traj_mssel_2.pl line 21.
 file format error.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.525.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
Second argument error. howmany <= 0. 
usage: mssel nsam howmany nanc nder selfilename selspot -r rho nsites [options] 
  Options: 
	 -t theta   (this option and/or the next must be used. Theta = 4*N0*u )
	 -s segsites   ( fixed number of segregating sites)
	 -T          (Output gene tree.)
	 -F minfreq     Output only sites with freq of minor allele >= minfreq.
	 -r rho nsites     (rho here is 4Nc)
		 -c f track_len   (f = ratio of conversion rate to rec rate. tracklen is mean length.) 
			 if rho = 0.,  f = 4*N0*g, with g the gene conversion rate.
	 -G alpha  ( N(t) = N0*exp(-alpha*t) .  alpha = -log(Np/Nr)/t
	 -I npop n1 n2 ... [mig_rate] (all elements of mig matrix set to mig_rate/(npop-1) 
		 -m i j m_ij    (i,j-th element of mig matrix set to m_ij.)
		 -ma m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
		 -n i size_i   (popi has size set to size_i*N0 
		 -g i alpha_i  (If used must appear after -M option.)
	   The following options modify parameters at the time 't' specified as the first argument:
	 -eG t alpha  (Modify growth rate of all pop's.)
	 -eg t i alpha_i  (Modify growth rate of pop i.) 
	 -eM t mig_rate   (Modify the mig matrix so all elements are mig_rate/(npop-1)
	 -em t i j m_ij    (i,j-th element of mig matrix set to m_ij at time t )
	 -ema t npop  m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
	 -eN t size  (Modify pop sizes. New sizes = size*N0 ) 
	 -en t i size_i  (Modify pop size of pop i.  New size of popi = size_i*N0 .)
	 -es t i proportion  (Split: pop i -> pop-i + pop-npop, npop increases by 1.
		 proportion is probability that each lineage stays in pop-i. (p, 1-p are admixt. proport.
		 Size of pop npop is set to N0 and alpha = 0.0 , size and alpha of pop i are unchanged.
	 -ej t i j   ( Join lineages in pop i and pop j into pop j
		  size, alpha and M are unchanged.
	  -f filename     ( Read command line arguments from file filename.)
 See msdoc.pdf for explanation of these parameters.
NO! at ../../prefersim_additionals/Traj_mssel_2.pl line 21.
 file format error.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.530.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
Second argument error. howmany <= 0. 
usage: mssel nsam howmany nanc nder selfilename selspot -r rho nsites [options] 
  Options: 
	 -t theta   (this option and/or the next must be used. Theta = 4*N0*u )
	 -s segsites   ( fixed number of segregating sites)
	 -T          (Output gene tree.)
	 -F minfreq     Output only sites with freq of minor allele >= minfreq.
	 -r rho nsites     (rho here is 4Nc)
		 -c f track_len   (f = ratio of conversion rate to rec rate. tracklen is mean length.) 
			 if rho = 0.,  f = 4*N0*g, with g the gene conversion rate.
	 -G alpha  ( N(t) = N0*exp(-alpha*t) .  alpha = -log(Np/Nr)/t
	 -I npop n1 n2 ... [mig_rate] (all elements of mig matrix set to mig_rate/(npop-1) 
		 -m i j m_ij    (i,j-th element of mig matrix set to m_ij.)
		 -ma m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
		 -n i size_i   (popi has size set to size_i*N0 
		 -g i alpha_i  (If used must appear after -M option.)
	   The following options modify parameters at the time 't' specified as the first argument:
	 -eG t alpha  (Modify growth rate of all pop's.)
	 -eg t i alpha_i  (Modify growth rate of pop i.) 
	 -eM t mig_rate   (Modify the mig matrix so all elements are mig_rate/(npop-1)
	 -em t i j m_ij    (i,j-th element of mig matrix set to m_ij at time t )
	 -ema t npop  m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
	 -eN t size  (Modify pop sizes. New sizes = size*N0 ) 
	 -en t i size_i  (Modify pop size of pop i.  New size of popi = size_i*N0 .)
	 -es t i proportion  (Split: pop i -> pop-i + pop-npop, npop increases by 1.
		 proportion is probability that each lineage stays in pop-i. (p, 1-p are admixt. proport.
		 Size of pop npop is set to N0 and alpha = 0.0 , size and alpha of pop i are unchanged.
	 -ej t i j   ( Join lineages in pop i and pop j into pop j
		  size, alpha and M are unchanged.
	  -f filename     ( Read command line arguments from file filename.)
 See msdoc.pdf for explanation of these parameters.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.535.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
NO! at ../../prefersim_additionals/Traj_mssel_2.pl line 21.
 file format error.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.540.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
Second argument error. howmany <= 0. 
usage: mssel nsam howmany nanc nder selfilename selspot -r rho nsites [options] 
  Options: 
	 -t theta   (this option and/or the next must be used. Theta = 4*N0*u )
	 -s segsites   ( fixed number of segregating sites)
	 -T          (Output gene tree.)
	 -F minfreq     Output only sites with freq of minor allele >= minfreq.
	 -r rho nsites     (rho here is 4Nc)
		 -c f track_len   (f = ratio of conversion rate to rec rate. tracklen is mean length.) 
			 if rho = 0.,  f = 4*N0*g, with g the gene conversion rate.
	 -G alpha  ( N(t) = N0*exp(-alpha*t) .  alpha = -log(Np/Nr)/t
	 -I npop n1 n2 ... [mig_rate] (all elements of mig matrix set to mig_rate/(npop-1) 
		 -m i j m_ij    (i,j-th element of mig matrix set to m_ij.)
		 -ma m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
		 -n i size_i   (popi has size set to size_i*N0 
		 -g i alpha_i  (If used must appear after -M option.)
	   The following options modify parameters at the time 't' specified as the first argument:
	 -eG t alpha  (Modify growth rate of all pop's.)
	 -eg t i alpha_i  (Modify growth rate of pop i.) 
	 -eM t mig_rate   (Modify the mig matrix so all elements are mig_rate/(npop-1)
	 -em t i j m_ij    (i,j-th element of mig matrix set to m_ij at time t )
	 -ema t npop  m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
	 -eN t size  (Modify pop sizes. New sizes = size*N0 ) 
	 -en t i size_i  (Modify pop size of pop i.  New size of popi = size_i*N0 .)
	 -es t i proportion  (Split: pop i -> pop-i + pop-npop, npop increases by 1.
		 proportion is probability that each lineage stays in pop-i. (p, 1-p are admixt. proport.
		 Size of pop npop is set to N0 and alpha = 0.0 , size and alpha of pop i are unchanged.
	 -ej t i j   ( Join lineages in pop i and pop j into pop j
		  size, alpha and M are unchanged.
	  -f filename     ( Read command line arguments from file filename.)
 See msdoc.pdf for explanation of these parameters.
NO! at ../../prefersim_additionals/Traj_mssel_2.pl line 21.
 file format error.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.545.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
Second argument error. howmany <= 0. 
usage: mssel nsam howmany nanc nder selfilename selspot -r rho nsites [options] 
  Options: 
	 -t theta   (this option and/or the next must be used. Theta = 4*N0*u )
	 -s segsites   ( fixed number of segregating sites)
	 -T          (Output gene tree.)
	 -F minfreq     Output only sites with freq of minor allele >= minfreq.
	 -r rho nsites     (rho here is 4Nc)
		 -c f track_len   (f = ratio of conversion rate to rec rate. tracklen is mean length.) 
			 if rho = 0.,  f = 4*N0*g, with g the gene conversion rate.
	 -G alpha  ( N(t) = N0*exp(-alpha*t) .  alpha = -log(Np/Nr)/t
	 -I npop n1 n2 ... [mig_rate] (all elements of mig matrix set to mig_rate/(npop-1) 
		 -m i j m_ij    (i,j-th element of mig matrix set to m_ij.)
		 -ma m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
		 -n i size_i   (popi has size set to size_i*N0 
		 -g i alpha_i  (If used must appear after -M option.)
	   The following options modify parameters at the time 't' specified as the first argument:
	 -eG t alpha  (Modify growth rate of all pop's.)
	 -eg t i alpha_i  (Modify growth rate of pop i.) 
	 -eM t mig_rate   (Modify the mig matrix so all elements are mig_rate/(npop-1)
	 -em t i j m_ij    (i,j-th element of mig matrix set to m_ij at time t )
	 -ema t npop  m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
	 -eN t size  (Modify pop sizes. New sizes = size*N0 ) 
	 -en t i size_i  (Modify pop size of pop i.  New size of popi = size_i*N0 .)
	 -es t i proportion  (Split: pop i -> pop-i + pop-npop, npop increases by 1.
		 proportion is probability that each lineage stays in pop-i. (p, 1-p are admixt. proport.
		 Size of pop npop is set to N0 and alpha = 0.0 , size and alpha of pop i are unchanged.
	 -ej t i j   ( Join lineages in pop i and pop j into pop j
		  size, alpha and M are unchanged.
	  -f filename     ( Read command line arguments from file filename.)
 See msdoc.pdf for explanation of these parameters.
NO! at ../../prefersim_additionals/Traj_mssel_2.pl line 21.
 file format error.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.550.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
Second argument error. howmany <= 0. 
usage: mssel nsam howmany nanc nder selfilename selspot -r rho nsites [options] 
  Options: 
	 -t theta   (this option and/or the next must be used. Theta = 4*N0*u )
	 -s segsites   ( fixed number of segregating sites)
	 -T          (Output gene tree.)
	 -F minfreq     Output only sites with freq of minor allele >= minfreq.
	 -r rho nsites     (rho here is 4Nc)
		 -c f track_len   (f = ratio of conversion rate to rec rate. tracklen is mean length.) 
			 if rho = 0.,  f = 4*N0*g, with g the gene conversion rate.
	 -G alpha  ( N(t) = N0*exp(-alpha*t) .  alpha = -log(Np/Nr)/t
	 -I npop n1 n2 ... [mig_rate] (all elements of mig matrix set to mig_rate/(npop-1) 
		 -m i j m_ij    (i,j-th element of mig matrix set to m_ij.)
		 -ma m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
		 -n i size_i   (popi has size set to size_i*N0 
		 -g i alpha_i  (If used must appear after -M option.)
	   The following options modify parameters at the time 't' specified as the first argument:
	 -eG t alpha  (Modify growth rate of all pop's.)
	 -eg t i alpha_i  (Modify growth rate of pop i.) 
	 -eM t mig_rate   (Modify the mig matrix so all elements are mig_rate/(npop-1)
	 -em t i j m_ij    (i,j-th element of mig matrix set to m_ij at time t )
	 -ema t npop  m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
	 -eN t size  (Modify pop sizes. New sizes = size*N0 ) 
	 -en t i size_i  (Modify pop size of pop i.  New size of popi = size_i*N0 .)
	 -es t i proportion  (Split: pop i -> pop-i + pop-npop, npop increases by 1.
		 proportion is probability that each lineage stays in pop-i. (p, 1-p are admixt. proport.
		 Size of pop npop is set to N0 and alpha = 0.0 , size and alpha of pop i are unchanged.
	 -ej t i j   ( Join lineages in pop i and pop j into pop j
		  size, alpha and M are unchanged.
	  -f filename     ( Read command line arguments from file filename.)
 See msdoc.pdf for explanation of these parameters.
NO! at ../../prefersim_additionals/Traj_mssel_2.pl line 21.
 file format error.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.555.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
Second argument error. howmany <= 0. 
usage: mssel nsam howmany nanc nder selfilename selspot -r rho nsites [options] 
  Options: 
	 -t theta   (this option and/or the next must be used. Theta = 4*N0*u )
	 -s segsites   ( fixed number of segregating sites)
	 -T          (Output gene tree.)
	 -F minfreq     Output only sites with freq of minor allele >= minfreq.
	 -r rho nsites     (rho here is 4Nc)
		 -c f track_len   (f = ratio of conversion rate to rec rate. tracklen is mean length.) 
			 if rho = 0.,  f = 4*N0*g, with g the gene conversion rate.
	 -G alpha  ( N(t) = N0*exp(-alpha*t) .  alpha = -log(Np/Nr)/t
	 -I npop n1 n2 ... [mig_rate] (all elements of mig matrix set to mig_rate/(npop-1) 
		 -m i j m_ij    (i,j-th element of mig matrix set to m_ij.)
		 -ma m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
		 -n i size_i   (popi has size set to size_i*N0 
		 -g i alpha_i  (If used must appear after -M option.)
	   The following options modify parameters at the time 't' specified as the first argument:
	 -eG t alpha  (Modify growth rate of all pop's.)
	 -eg t i alpha_i  (Modify growth rate of pop i.) 
	 -eM t mig_rate   (Modify the mig matrix so all elements are mig_rate/(npop-1)
	 -em t i j m_ij    (i,j-th element of mig matrix set to m_ij at time t )
	 -ema t npop  m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
	 -eN t size  (Modify pop sizes. New sizes = size*N0 ) 
	 -en t i size_i  (Modify pop size of pop i.  New size of popi = size_i*N0 .)
	 -es t i proportion  (Split: pop i -> pop-i + pop-npop, npop increases by 1.
		 proportion is probability that each lineage stays in pop-i. (p, 1-p are admixt. proport.
		 Size of pop npop is set to N0 and alpha = 0.0 , size and alpha of pop i are unchanged.
	 -ej t i j   ( Join lineages in pop i and pop j into pop j
		  size, alpha and M are unchanged.
	  -f filename     ( Read command line arguments from file filename.)
 See msdoc.pdf for explanation of these parameters.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.560.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
NO! at ../../prefersim_additionals/Traj_mssel_2.pl line 21.
 file format error.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.565.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
Second argument error. howmany <= 0. 
usage: mssel nsam howmany nanc nder selfilename selspot -r rho nsites [options] 
  Options: 
	 -t theta   (this option and/or the next must be used. Theta = 4*N0*u )
	 -s segsites   ( fixed number of segregating sites)
	 -T          (Output gene tree.)
	 -F minfreq     Output only sites with freq of minor allele >= minfreq.
	 -r rho nsites     (rho here is 4Nc)
		 -c f track_len   (f = ratio of conversion rate to rec rate. tracklen is mean length.) 
			 if rho = 0.,  f = 4*N0*g, with g the gene conversion rate.
	 -G alpha  ( N(t) = N0*exp(-alpha*t) .  alpha = -log(Np/Nr)/t
	 -I npop n1 n2 ... [mig_rate] (all elements of mig matrix set to mig_rate/(npop-1) 
		 -m i j m_ij    (i,j-th element of mig matrix set to m_ij.)
		 -ma m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
		 -n i size_i   (popi has size set to size_i*N0 
		 -g i alpha_i  (If used must appear after -M option.)
	   The following options modify parameters at the time 't' specified as the first argument:
	 -eG t alpha  (Modify growth rate of all pop's.)
	 -eg t i alpha_i  (Modify growth rate of pop i.) 
	 -eM t mig_rate   (Modify the mig matrix so all elements are mig_rate/(npop-1)
	 -em t i j m_ij    (i,j-th element of mig matrix set to m_ij at time t )
	 -ema t npop  m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
	 -eN t size  (Modify pop sizes. New sizes = size*N0 ) 
	 -en t i size_i  (Modify pop size of pop i.  New size of popi = size_i*N0 .)
	 -es t i proportion  (Split: pop i -> pop-i + pop-npop, npop increases by 1.
		 proportion is probability that each lineage stays in pop-i. (p, 1-p are admixt. proport.
		 Size of pop npop is set to N0 and alpha = 0.0 , size and alpha of pop i are unchanged.
	 -ej t i j   ( Join lineages in pop i and pop j into pop j
		  size, alpha and M are unchanged.
	  -f filename     ( Read command line arguments from file filename.)
 See msdoc.pdf for explanation of these parameters.
NO! at ../../prefersim_additionals/Traj_mssel_2.pl line 21.
 file format error.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.570.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
Second argument error. howmany <= 0. 
usage: mssel nsam howmany nanc nder selfilename selspot -r rho nsites [options] 
  Options: 
	 -t theta   (this option and/or the next must be used. Theta = 4*N0*u )
	 -s segsites   ( fixed number of segregating sites)
	 -T          (Output gene tree.)
	 -F minfreq     Output only sites with freq of minor allele >= minfreq.
	 -r rho nsites     (rho here is 4Nc)
		 -c f track_len   (f = ratio of conversion rate to rec rate. tracklen is mean length.) 
			 if rho = 0.,  f = 4*N0*g, with g the gene conversion rate.
	 -G alpha  ( N(t) = N0*exp(-alpha*t) .  alpha = -log(Np/Nr)/t
	 -I npop n1 n2 ... [mig_rate] (all elements of mig matrix set to mig_rate/(npop-1) 
		 -m i j m_ij    (i,j-th element of mig matrix set to m_ij.)
		 -ma m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
		 -n i size_i   (popi has size set to size_i*N0 
		 -g i alpha_i  (If used must appear after -M option.)
	   The following options modify parameters at the time 't' specified as the first argument:
	 -eG t alpha  (Modify growth rate of all pop's.)
	 -eg t i alpha_i  (Modify growth rate of pop i.) 
	 -eM t mig_rate   (Modify the mig matrix so all elements are mig_rate/(npop-1)
	 -em t i j m_ij    (i,j-th element of mig matrix set to m_ij at time t )
	 -ema t npop  m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
	 -eN t size  (Modify pop sizes. New sizes = size*N0 ) 
	 -en t i size_i  (Modify pop size of pop i.  New size of popi = size_i*N0 .)
	 -es t i proportion  (Split: pop i -> pop-i + pop-npop, npop increases by 1.
		 proportion is probability that each lineage stays in pop-i. (p, 1-p are admixt. proport.
		 Size of pop npop is set to N0 and alpha = 0.0 , size and alpha of pop i are unchanged.
	 -ej t i j   ( Join lineages in pop i and pop j into pop j
		  size, alpha and M are unchanged.
	  -f filename     ( Read command line arguments from file filename.)
 See msdoc.pdf for explanation of these parameters.
NO! at ../../prefersim_additionals/Traj_mssel_2.pl line 21.
 file format error.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.575.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
Second argument error. howmany <= 0. 
usage: mssel nsam howmany nanc nder selfilename selspot -r rho nsites [options] 
  Options: 
	 -t theta   (this option and/or the next must be used. Theta = 4*N0*u )
	 -s segsites   ( fixed number of segregating sites)
	 -T          (Output gene tree.)
	 -F minfreq     Output only sites with freq of minor allele >= minfreq.
	 -r rho nsites     (rho here is 4Nc)
		 -c f track_len   (f = ratio of conversion rate to rec rate. tracklen is mean length.) 
			 if rho = 0.,  f = 4*N0*g, with g the gene conversion rate.
	 -G alpha  ( N(t) = N0*exp(-alpha*t) .  alpha = -log(Np/Nr)/t
	 -I npop n1 n2 ... [mig_rate] (all elements of mig matrix set to mig_rate/(npop-1) 
		 -m i j m_ij    (i,j-th element of mig matrix set to m_ij.)
		 -ma m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
		 -n i size_i   (popi has size set to size_i*N0 
		 -g i alpha_i  (If used must appear after -M option.)
	   The following options modify parameters at the time 't' specified as the first argument:
	 -eG t alpha  (Modify growth rate of all pop's.)
	 -eg t i alpha_i  (Modify growth rate of pop i.) 
	 -eM t mig_rate   (Modify the mig matrix so all elements are mig_rate/(npop-1)
	 -em t i j m_ij    (i,j-th element of mig matrix set to m_ij at time t )
	 -ema t npop  m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
	 -eN t size  (Modify pop sizes. New sizes = size*N0 ) 
	 -en t i size_i  (Modify pop size of pop i.  New size of popi = size_i*N0 .)
	 -es t i proportion  (Split: pop i -> pop-i + pop-npop, npop increases by 1.
		 proportion is probability that each lineage stays in pop-i. (p, 1-p are admixt. proport.
		 Size of pop npop is set to N0 and alpha = 0.0 , size and alpha of pop i are unchanged.
	 -ej t i j   ( Join lineages in pop i and pop j into pop j
		  size, alpha and M are unchanged.
	  -f filename     ( Read command line arguments from file filename.)
 See msdoc.pdf for explanation of these parameters.
NO! at ../../prefersim_additionals/Traj_mssel_2.pl line 21.
 file format error.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.580.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
Second argument error. howmany <= 0. 
usage: mssel nsam howmany nanc nder selfilename selspot -r rho nsites [options] 
  Options: 
	 -t theta   (this option and/or the next must be used. Theta = 4*N0*u )
	 -s segsites   ( fixed number of segregating sites)
	 -T          (Output gene tree.)
	 -F minfreq     Output only sites with freq of minor allele >= minfreq.
	 -r rho nsites     (rho here is 4Nc)
		 -c f track_len   (f = ratio of conversion rate to rec rate. tracklen is mean length.) 
			 if rho = 0.,  f = 4*N0*g, with g the gene conversion rate.
	 -G alpha  ( N(t) = N0*exp(-alpha*t) .  alpha = -log(Np/Nr)/t
	 -I npop n1 n2 ... [mig_rate] (all elements of mig matrix set to mig_rate/(npop-1) 
		 -m i j m_ij    (i,j-th element of mig matrix set to m_ij.)
		 -ma m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
		 -n i size_i   (popi has size set to size_i*N0 
		 -g i alpha_i  (If used must appear after -M option.)
	   The following options modify parameters at the time 't' specified as the first argument:
	 -eG t alpha  (Modify growth rate of all pop's.)
	 -eg t i alpha_i  (Modify growth rate of pop i.) 
	 -eM t mig_rate   (Modify the mig matrix so all elements are mig_rate/(npop-1)
	 -em t i j m_ij    (i,j-th element of mig matrix set to m_ij at time t )
	 -ema t npop  m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
	 -eN t size  (Modify pop sizes. New sizes = size*N0 ) 
	 -en t i size_i  (Modify pop size of pop i.  New size of popi = size_i*N0 .)
	 -es t i proportion  (Split: pop i -> pop-i + pop-npop, npop increases by 1.
		 proportion is probability that each lineage stays in pop-i. (p, 1-p are admixt. proport.
		 Size of pop npop is set to N0 and alpha = 0.0 , size and alpha of pop i are unchanged.
	 -ej t i j   ( Join lineages in pop i and pop j into pop j
		  size, alpha and M are unchanged.
	  -f filename     ( Read command line arguments from file filename.)
 See msdoc.pdf for explanation of these parameters.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.585.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
NO! at ../../prefersim_additionals/Traj_mssel_2.pl line 21.
 file format error.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.590.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
Second argument error. howmany <= 0. 
usage: mssel nsam howmany nanc nder selfilename selspot -r rho nsites [options] 
  Options: 
	 -t theta   (this option and/or the next must be used. Theta = 4*N0*u )
	 -s segsites   ( fixed number of segregating sites)
	 -T          (Output gene tree.)
	 -F minfreq     Output only sites with freq of minor allele >= minfreq.
	 -r rho nsites     (rho here is 4Nc)
		 -c f track_len   (f = ratio of conversion rate to rec rate. tracklen is mean length.) 
			 if rho = 0.,  f = 4*N0*g, with g the gene conversion rate.
	 -G alpha  ( N(t) = N0*exp(-alpha*t) .  alpha = -log(Np/Nr)/t
	 -I npop n1 n2 ... [mig_rate] (all elements of mig matrix set to mig_rate/(npop-1) 
		 -m i j m_ij    (i,j-th element of mig matrix set to m_ij.)
		 -ma m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
		 -n i size_i   (popi has size set to size_i*N0 
		 -g i alpha_i  (If used must appear after -M option.)
	   The following options modify parameters at the time 't' specified as the first argument:
	 -eG t alpha  (Modify growth rate of all pop's.)
	 -eg t i alpha_i  (Modify growth rate of pop i.) 
	 -eM t mig_rate   (Modify the mig matrix so all elements are mig_rate/(npop-1)
	 -em t i j m_ij    (i,j-th element of mig matrix set to m_ij at time t )
	 -ema t npop  m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
	 -eN t size  (Modify pop sizes. New sizes = size*N0 ) 
	 -en t i size_i  (Modify pop size of pop i.  New size of popi = size_i*N0 .)
	 -es t i proportion  (Split: pop i -> pop-i + pop-npop, npop increases by 1.
		 proportion is probability that each lineage stays in pop-i. (p, 1-p are admixt. proport.
		 Size of pop npop is set to N0 and alpha = 0.0 , size and alpha of pop i are unchanged.
	 -ej t i j   ( Join lineages in pop i and pop j into pop j
		  size, alpha and M are unchanged.
	  -f filename     ( Read command line arguments from file filename.)
 See msdoc.pdf for explanation of these parameters.
NO! at ../../prefersim_additionals/Traj_mssel_2.pl line 21.
 file format error.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.595.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
Second argument error. howmany <= 0. 
usage: mssel nsam howmany nanc nder selfilename selspot -r rho nsites [options] 
  Options: 
	 -t theta   (this option and/or the next must be used. Theta = 4*N0*u )
	 -s segsites   ( fixed number of segregating sites)
	 -T          (Output gene tree.)
	 -F minfreq     Output only sites with freq of minor allele >= minfreq.
	 -r rho nsites     (rho here is 4Nc)
		 -c f track_len   (f = ratio of conversion rate to rec rate. tracklen is mean length.) 
			 if rho = 0.,  f = 4*N0*g, with g the gene conversion rate.
	 -G alpha  ( N(t) = N0*exp(-alpha*t) .  alpha = -log(Np/Nr)/t
	 -I npop n1 n2 ... [mig_rate] (all elements of mig matrix set to mig_rate/(npop-1) 
		 -m i j m_ij    (i,j-th element of mig matrix set to m_ij.)
		 -ma m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
		 -n i size_i   (popi has size set to size_i*N0 
		 -g i alpha_i  (If used must appear after -M option.)
	   The following options modify parameters at the time 't' specified as the first argument:
	 -eG t alpha  (Modify growth rate of all pop's.)
	 -eg t i alpha_i  (Modify growth rate of pop i.) 
	 -eM t mig_rate   (Modify the mig matrix so all elements are mig_rate/(npop-1)
	 -em t i j m_ij    (i,j-th element of mig matrix set to m_ij at time t )
	 -ema t npop  m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
	 -eN t size  (Modify pop sizes. New sizes = size*N0 ) 
	 -en t i size_i  (Modify pop size of pop i.  New size of popi = size_i*N0 .)
	 -es t i proportion  (Split: pop i -> pop-i + pop-npop, npop increases by 1.
		 proportion is probability that each lineage stays in pop-i. (p, 1-p are admixt. proport.
		 Size of pop npop is set to N0 and alpha = 0.0 , size and alpha of pop i are unchanged.
	 -ej t i j   ( Join lineages in pop i and pop j into pop j
		  size, alpha and M are unchanged.
	  -f filename     ( Read command line arguments from file filename.)
 See msdoc.pdf for explanation of these parameters.
NO! at ../../prefersim_additionals/Traj_mssel_2.pl line 21.
 file format error.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.600.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
Second argument error. howmany <= 0. 
usage: mssel nsam howmany nanc nder selfilename selspot -r rho nsites [options] 
  Options: 
	 -t theta   (this option and/or the next must be used. Theta = 4*N0*u )
	 -s segsites   ( fixed number of segregating sites)
	 -T          (Output gene tree.)
	 -F minfreq     Output only sites with freq of minor allele >= minfreq.
	 -r rho nsites     (rho here is 4Nc)
		 -c f track_len   (f = ratio of conversion rate to rec rate. tracklen is mean length.) 
			 if rho = 0.,  f = 4*N0*g, with g the gene conversion rate.
	 -G alpha  ( N(t) = N0*exp(-alpha*t) .  alpha = -log(Np/Nr)/t
	 -I npop n1 n2 ... [mig_rate] (all elements of mig matrix set to mig_rate/(npop-1) 
		 -m i j m_ij    (i,j-th element of mig matrix set to m_ij.)
		 -ma m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
		 -n i size_i   (popi has size set to size_i*N0 
		 -g i alpha_i  (If used must appear after -M option.)
	   The following options modify parameters at the time 't' specified as the first argument:
	 -eG t alpha  (Modify growth rate of all pop's.)
	 -eg t i alpha_i  (Modify growth rate of pop i.) 
	 -eM t mig_rate   (Modify the mig matrix so all elements are mig_rate/(npop-1)
	 -em t i j m_ij    (i,j-th element of mig matrix set to m_ij at time t )
	 -ema t npop  m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
	 -eN t size  (Modify pop sizes. New sizes = size*N0 ) 
	 -en t i size_i  (Modify pop size of pop i.  New size of popi = size_i*N0 .)
	 -es t i proportion  (Split: pop i -> pop-i + pop-npop, npop increases by 1.
		 proportion is probability that each lineage stays in pop-i. (p, 1-p are admixt. proport.
		 Size of pop npop is set to N0 and alpha = 0.0 , size and alpha of pop i are unchanged.
	 -ej t i j   ( Join lineages in pop i and pop j into pop j
		  size, alpha and M are unchanged.
	  -f filename     ( Read command line arguments from file filename.)
 See msdoc.pdf for explanation of these parameters.
NO! at ../../prefersim_additionals/Traj_mssel_2.pl line 21.
 file format error.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.605.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
Second argument error. howmany <= 0. 
usage: mssel nsam howmany nanc nder selfilename selspot -r rho nsites [options] 
  Options: 
	 -t theta   (this option and/or the next must be used. Theta = 4*N0*u )
	 -s segsites   ( fixed number of segregating sites)
	 -T          (Output gene tree.)
	 -F minfreq     Output only sites with freq of minor allele >= minfreq.
	 -r rho nsites     (rho here is 4Nc)
		 -c f track_len   (f = ratio of conversion rate to rec rate. tracklen is mean length.) 
			 if rho = 0.,  f = 4*N0*g, with g the gene conversion rate.
	 -G alpha  ( N(t) = N0*exp(-alpha*t) .  alpha = -log(Np/Nr)/t
	 -I npop n1 n2 ... [mig_rate] (all elements of mig matrix set to mig_rate/(npop-1) 
		 -m i j m_ij    (i,j-th element of mig matrix set to m_ij.)
		 -ma m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
		 -n i size_i   (popi has size set to size_i*N0 
		 -g i alpha_i  (If used must appear after -M option.)
	   The following options modify parameters at the time 't' specified as the first argument:
	 -eG t alpha  (Modify growth rate of all pop's.)
	 -eg t i alpha_i  (Modify growth rate of pop i.) 
	 -eM t mig_rate   (Modify the mig matrix so all elements are mig_rate/(npop-1)
	 -em t i j m_ij    (i,j-th element of mig matrix set to m_ij at time t )
	 -ema t npop  m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
	 -eN t size  (Modify pop sizes. New sizes = size*N0 ) 
	 -en t i size_i  (Modify pop size of pop i.  New size of popi = size_i*N0 .)
	 -es t i proportion  (Split: pop i -> pop-i + pop-npop, npop increases by 1.
		 proportion is probability that each lineage stays in pop-i. (p, 1-p are admixt. proport.
		 Size of pop npop is set to N0 and alpha = 0.0 , size and alpha of pop i are unchanged.
	 -ej t i j   ( Join lineages in pop i and pop j into pop j
		  size, alpha and M are unchanged.
	  -f filename     ( Read command line arguments from file filename.)
 See msdoc.pdf for explanation of these parameters.
NO! at ../../prefersim_additionals/Traj_mssel_2.pl line 21.
 file format error.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.610.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
Second argument error. howmany <= 0. 
usage: mssel nsam howmany nanc nder selfilename selspot -r rho nsites [options] 
  Options: 
	 -t theta   (this option and/or the next must be used. Theta = 4*N0*u )
	 -s segsites   ( fixed number of segregating sites)
	 -T          (Output gene tree.)
	 -F minfreq     Output only sites with freq of minor allele >= minfreq.
	 -r rho nsites     (rho here is 4Nc)
		 -c f track_len   (f = ratio of conversion rate to rec rate. tracklen is mean length.) 
			 if rho = 0.,  f = 4*N0*g, with g the gene conversion rate.
	 -G alpha  ( N(t) = N0*exp(-alpha*t) .  alpha = -log(Np/Nr)/t
	 -I npop n1 n2 ... [mig_rate] (all elements of mig matrix set to mig_rate/(npop-1) 
		 -m i j m_ij    (i,j-th element of mig matrix set to m_ij.)
		 -ma m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
		 -n i size_i   (popi has size set to size_i*N0 
		 -g i alpha_i  (If used must appear after -M option.)
	   The following options modify parameters at the time 't' specified as the first argument:
	 -eG t alpha  (Modify growth rate of all pop's.)
	 -eg t i alpha_i  (Modify growth rate of pop i.) 
	 -eM t mig_rate   (Modify the mig matrix so all elements are mig_rate/(npop-1)
	 -em t i j m_ij    (i,j-th element of mig matrix set to m_ij at time t )
	 -ema t npop  m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
	 -eN t size  (Modify pop sizes. New sizes = size*N0 ) 
	 -en t i size_i  (Modify pop size of pop i.  New size of popi = size_i*N0 .)
	 -es t i proportion  (Split: pop i -> pop-i + pop-npop, npop increases by 1.
		 proportion is probability that each lineage stays in pop-i. (p, 1-p are admixt. proport.
		 Size of pop npop is set to N0 and alpha = 0.0 , size and alpha of pop i are unchanged.
	 -ej t i j   ( Join lineages in pop i and pop j into pop j
		  size, alpha and M are unchanged.
	  -f filename     ( Read command line arguments from file filename.)
 See msdoc.pdf for explanation of these parameters.
NO! at ../../prefersim_additionals/Traj_mssel_2.pl line 21.
 file format error.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.615.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
Second argument error. howmany <= 0. 
usage: mssel nsam howmany nanc nder selfilename selspot -r rho nsites [options] 
  Options: 
	 -t theta   (this option and/or the next must be used. Theta = 4*N0*u )
	 -s segsites   ( fixed number of segregating sites)
	 -T          (Output gene tree.)
	 -F minfreq     Output only sites with freq of minor allele >= minfreq.
	 -r rho nsites     (rho here is 4Nc)
		 -c f track_len   (f = ratio of conversion rate to rec rate. tracklen is mean length.) 
			 if rho = 0.,  f = 4*N0*g, with g the gene conversion rate.
	 -G alpha  ( N(t) = N0*exp(-alpha*t) .  alpha = -log(Np/Nr)/t
	 -I npop n1 n2 ... [mig_rate] (all elements of mig matrix set to mig_rate/(npop-1) 
		 -m i j m_ij    (i,j-th element of mig matrix set to m_ij.)
		 -ma m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
		 -n i size_i   (popi has size set to size_i*N0 
		 -g i alpha_i  (If used must appear after -M option.)
	   The following options modify parameters at the time 't' specified as the first argument:
	 -eG t alpha  (Modify growth rate of all pop's.)
	 -eg t i alpha_i  (Modify growth rate of pop i.) 
	 -eM t mig_rate   (Modify the mig matrix so all elements are mig_rate/(npop-1)
	 -em t i j m_ij    (i,j-th element of mig matrix set to m_ij at time t )
	 -ema t npop  m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
	 -eN t size  (Modify pop sizes. New sizes = size*N0 ) 
	 -en t i size_i  (Modify pop size of pop i.  New size of popi = size_i*N0 .)
	 -es t i proportion  (Split: pop i -> pop-i + pop-npop, npop increases by 1.
		 proportion is probability that each lineage stays in pop-i. (p, 1-p are admixt. proport.
		 Size of pop npop is set to N0 and alpha = 0.0 , size and alpha of pop i are unchanged.
	 -ej t i j   ( Join lineages in pop i and pop j into pop j
		  size, alpha and M are unchanged.
	  -f filename     ( Read command line arguments from file filename.)
 See msdoc.pdf for explanation of these parameters.
NO! at ../../prefersim_additionals/Traj_mssel_2.pl line 21.
 file format error.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.620.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
Second argument error. howmany <= 0. 
usage: mssel nsam howmany nanc nder selfilename selspot -r rho nsites [options] 
  Options: 
	 -t theta   (this option and/or the next must be used. Theta = 4*N0*u )
	 -s segsites   ( fixed number of segregating sites)
	 -T          (Output gene tree.)
	 -F minfreq     Output only sites with freq of minor allele >= minfreq.
	 -r rho nsites     (rho here is 4Nc)
		 -c f track_len   (f = ratio of conversion rate to rec rate. tracklen is mean length.) 
			 if rho = 0.,  f = 4*N0*g, with g the gene conversion rate.
	 -G alpha  ( N(t) = N0*exp(-alpha*t) .  alpha = -log(Np/Nr)/t
	 -I npop n1 n2 ... [mig_rate] (all elements of mig matrix set to mig_rate/(npop-1) 
		 -m i j m_ij    (i,j-th element of mig matrix set to m_ij.)
		 -ma m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
		 -n i size_i   (popi has size set to size_i*N0 
		 -g i alpha_i  (If used must appear after -M option.)
	   The following options modify parameters at the time 't' specified as the first argument:
	 -eG t alpha  (Modify growth rate of all pop's.)
	 -eg t i alpha_i  (Modify growth rate of pop i.) 
	 -eM t mig_rate   (Modify the mig matrix so all elements are mig_rate/(npop-1)
	 -em t i j m_ij    (i,j-th element of mig matrix set to m_ij at time t )
	 -ema t npop  m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
	 -eN t size  (Modify pop sizes. New sizes = size*N0 ) 
	 -en t i size_i  (Modify pop size of pop i.  New size of popi = size_i*N0 .)
	 -es t i proportion  (Split: pop i -> pop-i + pop-npop, npop increases by 1.
		 proportion is probability that each lineage stays in pop-i. (p, 1-p are admixt. proport.
		 Size of pop npop is set to N0 and alpha = 0.0 , size and alpha of pop i are unchanged.
	 -ej t i j   ( Join lineages in pop i and pop j into pop j
		  size, alpha and M are unchanged.
	  -f filename     ( Read command line arguments from file filename.)
 See msdoc.pdf for explanation of these parameters.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.625.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
NO! at ../../prefersim_additionals/Traj_mssel_2.pl line 21.
 file format error.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.630.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
Second argument error. howmany <= 0. 
usage: mssel nsam howmany nanc nder selfilename selspot -r rho nsites [options] 
  Options: 
	 -t theta   (this option and/or the next must be used. Theta = 4*N0*u )
	 -s segsites   ( fixed number of segregating sites)
	 -T          (Output gene tree.)
	 -F minfreq     Output only sites with freq of minor allele >= minfreq.
	 -r rho nsites     (rho here is 4Nc)
		 -c f track_len   (f = ratio of conversion rate to rec rate. tracklen is mean length.) 
			 if rho = 0.,  f = 4*N0*g, with g the gene conversion rate.
	 -G alpha  ( N(t) = N0*exp(-alpha*t) .  alpha = -log(Np/Nr)/t
	 -I npop n1 n2 ... [mig_rate] (all elements of mig matrix set to mig_rate/(npop-1) 
		 -m i j m_ij    (i,j-th element of mig matrix set to m_ij.)
		 -ma m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
		 -n i size_i   (popi has size set to size_i*N0 
		 -g i alpha_i  (If used must appear after -M option.)
	   The following options modify parameters at the time 't' specified as the first argument:
	 -eG t alpha  (Modify growth rate of all pop's.)
	 -eg t i alpha_i  (Modify growth rate of pop i.) 
	 -eM t mig_rate   (Modify the mig matrix so all elements are mig_rate/(npop-1)
	 -em t i j m_ij    (i,j-th element of mig matrix set to m_ij at time t )
	 -ema t npop  m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
	 -eN t size  (Modify pop sizes. New sizes = size*N0 ) 
	 -en t i size_i  (Modify pop size of pop i.  New size of popi = size_i*N0 .)
	 -es t i proportion  (Split: pop i -> pop-i + pop-npop, npop increases by 1.
		 proportion is probability that each lineage stays in pop-i. (p, 1-p are admixt. proport.
		 Size of pop npop is set to N0 and alpha = 0.0 , size and alpha of pop i are unchanged.
	 -ej t i j   ( Join lineages in pop i and pop j into pop j
		  size, alpha and M are unchanged.
	  -f filename     ( Read command line arguments from file filename.)
 See msdoc.pdf for explanation of these parameters.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.635.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.640.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
NO! at ../../prefersim_additionals/Traj_mssel_2.pl line 21.
 file format error.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.645.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
Second argument error. howmany <= 0. 
usage: mssel nsam howmany nanc nder selfilename selspot -r rho nsites [options] 
  Options: 
	 -t theta   (this option and/or the next must be used. Theta = 4*N0*u )
	 -s segsites   ( fixed number of segregating sites)
	 -T          (Output gene tree.)
	 -F minfreq     Output only sites with freq of minor allele >= minfreq.
	 -r rho nsites     (rho here is 4Nc)
		 -c f track_len   (f = ratio of conversion rate to rec rate. tracklen is mean length.) 
			 if rho = 0.,  f = 4*N0*g, with g the gene conversion rate.
	 -G alpha  ( N(t) = N0*exp(-alpha*t) .  alpha = -log(Np/Nr)/t
	 -I npop n1 n2 ... [mig_rate] (all elements of mig matrix set to mig_rate/(npop-1) 
		 -m i j m_ij    (i,j-th element of mig matrix set to m_ij.)
		 -ma m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
		 -n i size_i   (popi has size set to size_i*N0 
		 -g i alpha_i  (If used must appear after -M option.)
	   The following options modify parameters at the time 't' specified as the first argument:
	 -eG t alpha  (Modify growth rate of all pop's.)
	 -eg t i alpha_i  (Modify growth rate of pop i.) 
	 -eM t mig_rate   (Modify the mig matrix so all elements are mig_rate/(npop-1)
	 -em t i j m_ij    (i,j-th element of mig matrix set to m_ij at time t )
	 -ema t npop  m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
	 -eN t size  (Modify pop sizes. New sizes = size*N0 ) 
	 -en t i size_i  (Modify pop size of pop i.  New size of popi = size_i*N0 .)
	 -es t i proportion  (Split: pop i -> pop-i + pop-npop, npop increases by 1.
		 proportion is probability that each lineage stays in pop-i. (p, 1-p are admixt. proport.
		 Size of pop npop is set to N0 and alpha = 0.0 , size and alpha of pop i are unchanged.
	 -ej t i j   ( Join lineages in pop i and pop j into pop j
		  size, alpha and M are unchanged.
	  -f filename     ( Read command line arguments from file filename.)
 See msdoc.pdf for explanation of these parameters.
NO! at ../../prefersim_additionals/Traj_mssel_2.pl line 21.
 file format error.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.650.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
Second argument error. howmany <= 0. 
usage: mssel nsam howmany nanc nder selfilename selspot -r rho nsites [options] 
  Options: 
	 -t theta   (this option and/or the next must be used. Theta = 4*N0*u )
	 -s segsites   ( fixed number of segregating sites)
	 -T          (Output gene tree.)
	 -F minfreq     Output only sites with freq of minor allele >= minfreq.
	 -r rho nsites     (rho here is 4Nc)
		 -c f track_len   (f = ratio of conversion rate to rec rate. tracklen is mean length.) 
			 if rho = 0.,  f = 4*N0*g, with g the gene conversion rate.
	 -G alpha  ( N(t) = N0*exp(-alpha*t) .  alpha = -log(Np/Nr)/t
	 -I npop n1 n2 ... [mig_rate] (all elements of mig matrix set to mig_rate/(npop-1) 
		 -m i j m_ij    (i,j-th element of mig matrix set to m_ij.)
		 -ma m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
		 -n i size_i   (popi has size set to size_i*N0 
		 -g i alpha_i  (If used must appear after -M option.)
	   The following options modify parameters at the time 't' specified as the first argument:
	 -eG t alpha  (Modify growth rate of all pop's.)
	 -eg t i alpha_i  (Modify growth rate of pop i.) 
	 -eM t mig_rate   (Modify the mig matrix so all elements are mig_rate/(npop-1)
	 -em t i j m_ij    (i,j-th element of mig matrix set to m_ij at time t )
	 -ema t npop  m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
	 -eN t size  (Modify pop sizes. New sizes = size*N0 ) 
	 -en t i size_i  (Modify pop size of pop i.  New size of popi = size_i*N0 .)
	 -es t i proportion  (Split: pop i -> pop-i + pop-npop, npop increases by 1.
		 proportion is probability that each lineage stays in pop-i. (p, 1-p are admixt. proport.
		 Size of pop npop is set to N0 and alpha = 0.0 , size and alpha of pop i are unchanged.
	 -ej t i j   ( Join lineages in pop i and pop j into pop j
		  size, alpha and M are unchanged.
	  -f filename     ( Read command line arguments from file filename.)
 See msdoc.pdf for explanation of these parameters.
NO! at ../../prefersim_additionals/Traj_mssel_2.pl line 21.
 file format error.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.655.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
Second argument error. howmany <= 0. 
usage: mssel nsam howmany nanc nder selfilename selspot -r rho nsites [options] 
  Options: 
	 -t theta   (this option and/or the next must be used. Theta = 4*N0*u )
	 -s segsites   ( fixed number of segregating sites)
	 -T          (Output gene tree.)
	 -F minfreq     Output only sites with freq of minor allele >= minfreq.
	 -r rho nsites     (rho here is 4Nc)
		 -c f track_len   (f = ratio of conversion rate to rec rate. tracklen is mean length.) 
			 if rho = 0.,  f = 4*N0*g, with g the gene conversion rate.
	 -G alpha  ( N(t) = N0*exp(-alpha*t) .  alpha = -log(Np/Nr)/t
	 -I npop n1 n2 ... [mig_rate] (all elements of mig matrix set to mig_rate/(npop-1) 
		 -m i j m_ij    (i,j-th element of mig matrix set to m_ij.)
		 -ma m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
		 -n i size_i   (popi has size set to size_i*N0 
		 -g i alpha_i  (If used must appear after -M option.)
	   The following options modify parameters at the time 't' specified as the first argument:
	 -eG t alpha  (Modify growth rate of all pop's.)
	 -eg t i alpha_i  (Modify growth rate of pop i.) 
	 -eM t mig_rate   (Modify the mig matrix so all elements are mig_rate/(npop-1)
	 -em t i j m_ij    (i,j-th element of mig matrix set to m_ij at time t )
	 -ema t npop  m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
	 -eN t size  (Modify pop sizes. New sizes = size*N0 ) 
	 -en t i size_i  (Modify pop size of pop i.  New size of popi = size_i*N0 .)
	 -es t i proportion  (Split: pop i -> pop-i + pop-npop, npop increases by 1.
		 proportion is probability that each lineage stays in pop-i. (p, 1-p are admixt. proport.
		 Size of pop npop is set to N0 and alpha = 0.0 , size and alpha of pop i are unchanged.
	 -ej t i j   ( Join lineages in pop i and pop j into pop j
		  size, alpha and M are unchanged.
	  -f filename     ( Read command line arguments from file filename.)
 See msdoc.pdf for explanation of these parameters.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.660.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.665.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
NO! at ../../prefersim_additionals/Traj_mssel_2.pl line 21.
 file format error.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.670.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
Second argument error. howmany <= 0. 
usage: mssel nsam howmany nanc nder selfilename selspot -r rho nsites [options] 
  Options: 
	 -t theta   (this option and/or the next must be used. Theta = 4*N0*u )
	 -s segsites   ( fixed number of segregating sites)
	 -T          (Output gene tree.)
	 -F minfreq     Output only sites with freq of minor allele >= minfreq.
	 -r rho nsites     (rho here is 4Nc)
		 -c f track_len   (f = ratio of conversion rate to rec rate. tracklen is mean length.) 
			 if rho = 0.,  f = 4*N0*g, with g the gene conversion rate.
	 -G alpha  ( N(t) = N0*exp(-alpha*t) .  alpha = -log(Np/Nr)/t
	 -I npop n1 n2 ... [mig_rate] (all elements of mig matrix set to mig_rate/(npop-1) 
		 -m i j m_ij    (i,j-th element of mig matrix set to m_ij.)
		 -ma m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
		 -n i size_i   (popi has size set to size_i*N0 
		 -g i alpha_i  (If used must appear after -M option.)
	   The following options modify parameters at the time 't' specified as the first argument:
	 -eG t alpha  (Modify growth rate of all pop's.)
	 -eg t i alpha_i  (Modify growth rate of pop i.) 
	 -eM t mig_rate   (Modify the mig matrix so all elements are mig_rate/(npop-1)
	 -em t i j m_ij    (i,j-th element of mig matrix set to m_ij at time t )
	 -ema t npop  m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
	 -eN t size  (Modify pop sizes. New sizes = size*N0 ) 
	 -en t i size_i  (Modify pop size of pop i.  New size of popi = size_i*N0 .)
	 -es t i proportion  (Split: pop i -> pop-i + pop-npop, npop increases by 1.
		 proportion is probability that each lineage stays in pop-i. (p, 1-p are admixt. proport.
		 Size of pop npop is set to N0 and alpha = 0.0 , size and alpha of pop i are unchanged.
	 -ej t i j   ( Join lineages in pop i and pop j into pop j
		  size, alpha and M are unchanged.
	  -f filename     ( Read command line arguments from file filename.)
 See msdoc.pdf for explanation of these parameters.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.675.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.680.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
NO! at ../../prefersim_additionals/Traj_mssel_2.pl line 21.
 file format error.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.685.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
Second argument error. howmany <= 0. 
usage: mssel nsam howmany nanc nder selfilename selspot -r rho nsites [options] 
  Options: 
	 -t theta   (this option and/or the next must be used. Theta = 4*N0*u )
	 -s segsites   ( fixed number of segregating sites)
	 -T          (Output gene tree.)
	 -F minfreq     Output only sites with freq of minor allele >= minfreq.
	 -r rho nsites     (rho here is 4Nc)
		 -c f track_len   (f = ratio of conversion rate to rec rate. tracklen is mean length.) 
			 if rho = 0.,  f = 4*N0*g, with g the gene conversion rate.
	 -G alpha  ( N(t) = N0*exp(-alpha*t) .  alpha = -log(Np/Nr)/t
	 -I npop n1 n2 ... [mig_rate] (all elements of mig matrix set to mig_rate/(npop-1) 
		 -m i j m_ij    (i,j-th element of mig matrix set to m_ij.)
		 -ma m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
		 -n i size_i   (popi has size set to size_i*N0 
		 -g i alpha_i  (If used must appear after -M option.)
	   The following options modify parameters at the time 't' specified as the first argument:
	 -eG t alpha  (Modify growth rate of all pop's.)
	 -eg t i alpha_i  (Modify growth rate of pop i.) 
	 -eM t mig_rate   (Modify the mig matrix so all elements are mig_rate/(npop-1)
	 -em t i j m_ij    (i,j-th element of mig matrix set to m_ij at time t )
	 -ema t npop  m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
	 -eN t size  (Modify pop sizes. New sizes = size*N0 ) 
	 -en t i size_i  (Modify pop size of pop i.  New size of popi = size_i*N0 .)
	 -es t i proportion  (Split: pop i -> pop-i + pop-npop, npop increases by 1.
		 proportion is probability that each lineage stays in pop-i. (p, 1-p are admixt. proport.
		 Size of pop npop is set to N0 and alpha = 0.0 , size and alpha of pop i are unchanged.
	 -ej t i j   ( Join lineages in pop i and pop j into pop j
		  size, alpha and M are unchanged.
	  -f filename     ( Read command line arguments from file filename.)
 See msdoc.pdf for explanation of these parameters.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.690.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
NO! at ../../prefersim_additionals/Traj_mssel_2.pl line 21.
 file format error.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.695.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
Second argument error. howmany <= 0. 
usage: mssel nsam howmany nanc nder selfilename selspot -r rho nsites [options] 
  Options: 
	 -t theta   (this option and/or the next must be used. Theta = 4*N0*u )
	 -s segsites   ( fixed number of segregating sites)
	 -T          (Output gene tree.)
	 -F minfreq     Output only sites with freq of minor allele >= minfreq.
	 -r rho nsites     (rho here is 4Nc)
		 -c f track_len   (f = ratio of conversion rate to rec rate. tracklen is mean length.) 
			 if rho = 0.,  f = 4*N0*g, with g the gene conversion rate.
	 -G alpha  ( N(t) = N0*exp(-alpha*t) .  alpha = -log(Np/Nr)/t
	 -I npop n1 n2 ... [mig_rate] (all elements of mig matrix set to mig_rate/(npop-1) 
		 -m i j m_ij    (i,j-th element of mig matrix set to m_ij.)
		 -ma m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
		 -n i size_i   (popi has size set to size_i*N0 
		 -g i alpha_i  (If used must appear after -M option.)
	   The following options modify parameters at the time 't' specified as the first argument:
	 -eG t alpha  (Modify growth rate of all pop's.)
	 -eg t i alpha_i  (Modify growth rate of pop i.) 
	 -eM t mig_rate   (Modify the mig matrix so all elements are mig_rate/(npop-1)
	 -em t i j m_ij    (i,j-th element of mig matrix set to m_ij at time t )
	 -ema t npop  m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
	 -eN t size  (Modify pop sizes. New sizes = size*N0 ) 
	 -en t i size_i  (Modify pop size of pop i.  New size of popi = size_i*N0 .)
	 -es t i proportion  (Split: pop i -> pop-i + pop-npop, npop increases by 1.
		 proportion is probability that each lineage stays in pop-i. (p, 1-p are admixt. proport.
		 Size of pop npop is set to N0 and alpha = 0.0 , size and alpha of pop i are unchanged.
	 -ej t i j   ( Join lineages in pop i and pop j into pop j
		  size, alpha and M are unchanged.
	  -f filename     ( Read command line arguments from file filename.)
 See msdoc.pdf for explanation of these parameters.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.700.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
NO! at ../../prefersim_additionals/Traj_mssel_2.pl line 21.
 file format error.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.705.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
Second argument error. howmany <= 0. 
usage: mssel nsam howmany nanc nder selfilename selspot -r rho nsites [options] 
  Options: 
	 -t theta   (this option and/or the next must be used. Theta = 4*N0*u )
	 -s segsites   ( fixed number of segregating sites)
	 -T          (Output gene tree.)
	 -F minfreq     Output only sites with freq of minor allele >= minfreq.
	 -r rho nsites     (rho here is 4Nc)
		 -c f track_len   (f = ratio of conversion rate to rec rate. tracklen is mean length.) 
			 if rho = 0.,  f = 4*N0*g, with g the gene conversion rate.
	 -G alpha  ( N(t) = N0*exp(-alpha*t) .  alpha = -log(Np/Nr)/t
	 -I npop n1 n2 ... [mig_rate] (all elements of mig matrix set to mig_rate/(npop-1) 
		 -m i j m_ij    (i,j-th element of mig matrix set to m_ij.)
		 -ma m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
		 -n i size_i   (popi has size set to size_i*N0 
		 -g i alpha_i  (If used must appear after -M option.)
	   The following options modify parameters at the time 't' specified as the first argument:
	 -eG t alpha  (Modify growth rate of all pop's.)
	 -eg t i alpha_i  (Modify growth rate of pop i.) 
	 -eM t mig_rate   (Modify the mig matrix so all elements are mig_rate/(npop-1)
	 -em t i j m_ij    (i,j-th element of mig matrix set to m_ij at time t )
	 -ema t npop  m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
	 -eN t size  (Modify pop sizes. New sizes = size*N0 ) 
	 -en t i size_i  (Modify pop size of pop i.  New size of popi = size_i*N0 .)
	 -es t i proportion  (Split: pop i -> pop-i + pop-npop, npop increases by 1.
		 proportion is probability that each lineage stays in pop-i. (p, 1-p are admixt. proport.
		 Size of pop npop is set to N0 and alpha = 0.0 , size and alpha of pop i are unchanged.
	 -ej t i j   ( Join lineages in pop i and pop j into pop j
		  size, alpha and M are unchanged.
	  -f filename     ( Read command line arguments from file filename.)
 See msdoc.pdf for explanation of these parameters.
NO! at ../../prefersim_additionals/Traj_mssel_2.pl line 21.
 file format error.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.710.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
Second argument error. howmany <= 0. 
usage: mssel nsam howmany nanc nder selfilename selspot -r rho nsites [options] 
  Options: 
	 -t theta   (this option and/or the next must be used. Theta = 4*N0*u )
	 -s segsites   ( fixed number of segregating sites)
	 -T          (Output gene tree.)
	 -F minfreq     Output only sites with freq of minor allele >= minfreq.
	 -r rho nsites     (rho here is 4Nc)
		 -c f track_len   (f = ratio of conversion rate to rec rate. tracklen is mean length.) 
			 if rho = 0.,  f = 4*N0*g, with g the gene conversion rate.
	 -G alpha  ( N(t) = N0*exp(-alpha*t) .  alpha = -log(Np/Nr)/t
	 -I npop n1 n2 ... [mig_rate] (all elements of mig matrix set to mig_rate/(npop-1) 
		 -m i j m_ij    (i,j-th element of mig matrix set to m_ij.)
		 -ma m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
		 -n i size_i   (popi has size set to size_i*N0 
		 -g i alpha_i  (If used must appear after -M option.)
	   The following options modify parameters at the time 't' specified as the first argument:
	 -eG t alpha  (Modify growth rate of all pop's.)
	 -eg t i alpha_i  (Modify growth rate of pop i.) 
	 -eM t mig_rate   (Modify the mig matrix so all elements are mig_rate/(npop-1)
	 -em t i j m_ij    (i,j-th element of mig matrix set to m_ij at time t )
	 -ema t npop  m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
	 -eN t size  (Modify pop sizes. New sizes = size*N0 ) 
	 -en t i size_i  (Modify pop size of pop i.  New size of popi = size_i*N0 .)
	 -es t i proportion  (Split: pop i -> pop-i + pop-npop, npop increases by 1.
		 proportion is probability that each lineage stays in pop-i. (p, 1-p are admixt. proport.
		 Size of pop npop is set to N0 and alpha = 0.0 , size and alpha of pop i are unchanged.
	 -ej t i j   ( Join lineages in pop i and pop j into pop j
		  size, alpha and M are unchanged.
	  -f filename     ( Read command line arguments from file filename.)
 See msdoc.pdf for explanation of these parameters.
NO! at ../../prefersim_additionals/Traj_mssel_2.pl line 21.
 file format error.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.715.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
Second argument error. howmany <= 0. 
usage: mssel nsam howmany nanc nder selfilename selspot -r rho nsites [options] 
  Options: 
	 -t theta   (this option and/or the next must be used. Theta = 4*N0*u )
	 -s segsites   ( fixed number of segregating sites)
	 -T          (Output gene tree.)
	 -F minfreq     Output only sites with freq of minor allele >= minfreq.
	 -r rho nsites     (rho here is 4Nc)
		 -c f track_len   (f = ratio of conversion rate to rec rate. tracklen is mean length.) 
			 if rho = 0.,  f = 4*N0*g, with g the gene conversion rate.
	 -G alpha  ( N(t) = N0*exp(-alpha*t) .  alpha = -log(Np/Nr)/t
	 -I npop n1 n2 ... [mig_rate] (all elements of mig matrix set to mig_rate/(npop-1) 
		 -m i j m_ij    (i,j-th element of mig matrix set to m_ij.)
		 -ma m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
		 -n i size_i   (popi has size set to size_i*N0 
		 -g i alpha_i  (If used must appear after -M option.)
	   The following options modify parameters at the time 't' specified as the first argument:
	 -eG t alpha  (Modify growth rate of all pop's.)
	 -eg t i alpha_i  (Modify growth rate of pop i.) 
	 -eM t mig_rate   (Modify the mig matrix so all elements are mig_rate/(npop-1)
	 -em t i j m_ij    (i,j-th element of mig matrix set to m_ij at time t )
	 -ema t npop  m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
	 -eN t size  (Modify pop sizes. New sizes = size*N0 ) 
	 -en t i size_i  (Modify pop size of pop i.  New size of popi = size_i*N0 .)
	 -es t i proportion  (Split: pop i -> pop-i + pop-npop, npop increases by 1.
		 proportion is probability that each lineage stays in pop-i. (p, 1-p are admixt. proport.
		 Size of pop npop is set to N0 and alpha = 0.0 , size and alpha of pop i are unchanged.
	 -ej t i j   ( Join lineages in pop i and pop j into pop j
		  size, alpha and M are unchanged.
	  -f filename     ( Read command line arguments from file filename.)
 See msdoc.pdf for explanation of these parameters.
NO! at ../../prefersim_additionals/Traj_mssel_2.pl line 21.
 file format error.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.720.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
Second argument error. howmany <= 0. 
usage: mssel nsam howmany nanc nder selfilename selspot -r rho nsites [options] 
  Options: 
	 -t theta   (this option and/or the next must be used. Theta = 4*N0*u )
	 -s segsites   ( fixed number of segregating sites)
	 -T          (Output gene tree.)
	 -F minfreq     Output only sites with freq of minor allele >= minfreq.
	 -r rho nsites     (rho here is 4Nc)
		 -c f track_len   (f = ratio of conversion rate to rec rate. tracklen is mean length.) 
			 if rho = 0.,  f = 4*N0*g, with g the gene conversion rate.
	 -G alpha  ( N(t) = N0*exp(-alpha*t) .  alpha = -log(Np/Nr)/t
	 -I npop n1 n2 ... [mig_rate] (all elements of mig matrix set to mig_rate/(npop-1) 
		 -m i j m_ij    (i,j-th element of mig matrix set to m_ij.)
		 -ma m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
		 -n i size_i   (popi has size set to size_i*N0 
		 -g i alpha_i  (If used must appear after -M option.)
	   The following options modify parameters at the time 't' specified as the first argument:
	 -eG t alpha  (Modify growth rate of all pop's.)
	 -eg t i alpha_i  (Modify growth rate of pop i.) 
	 -eM t mig_rate   (Modify the mig matrix so all elements are mig_rate/(npop-1)
	 -em t i j m_ij    (i,j-th element of mig matrix set to m_ij at time t )
	 -ema t npop  m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
	 -eN t size  (Modify pop sizes. New sizes = size*N0 ) 
	 -en t i size_i  (Modify pop size of pop i.  New size of popi = size_i*N0 .)
	 -es t i proportion  (Split: pop i -> pop-i + pop-npop, npop increases by 1.
		 proportion is probability that each lineage stays in pop-i. (p, 1-p are admixt. proport.
		 Size of pop npop is set to N0 and alpha = 0.0 , size and alpha of pop i are unchanged.
	 -ej t i j   ( Join lineages in pop i and pop j into pop j
		  size, alpha and M are unchanged.
	  -f filename     ( Read command line arguments from file filename.)
 See msdoc.pdf for explanation of these parameters.
NO! at ../../prefersim_additionals/Traj_mssel_2.pl line 21.
 file format error.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.725.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
Second argument error. howmany <= 0. 
usage: mssel nsam howmany nanc nder selfilename selspot -r rho nsites [options] 
  Options: 
	 -t theta   (this option and/or the next must be used. Theta = 4*N0*u )
	 -s segsites   ( fixed number of segregating sites)
	 -T          (Output gene tree.)
	 -F minfreq     Output only sites with freq of minor allele >= minfreq.
	 -r rho nsites     (rho here is 4Nc)
		 -c f track_len   (f = ratio of conversion rate to rec rate. tracklen is mean length.) 
			 if rho = 0.,  f = 4*N0*g, with g the gene conversion rate.
	 -G alpha  ( N(t) = N0*exp(-alpha*t) .  alpha = -log(Np/Nr)/t
	 -I npop n1 n2 ... [mig_rate] (all elements of mig matrix set to mig_rate/(npop-1) 
		 -m i j m_ij    (i,j-th element of mig matrix set to m_ij.)
		 -ma m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
		 -n i size_i   (popi has size set to size_i*N0 
		 -g i alpha_i  (If used must appear after -M option.)
	   The following options modify parameters at the time 't' specified as the first argument:
	 -eG t alpha  (Modify growth rate of all pop's.)
	 -eg t i alpha_i  (Modify growth rate of pop i.) 
	 -eM t mig_rate   (Modify the mig matrix so all elements are mig_rate/(npop-1)
	 -em t i j m_ij    (i,j-th element of mig matrix set to m_ij at time t )
	 -ema t npop  m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
	 -eN t size  (Modify pop sizes. New sizes = size*N0 ) 
	 -en t i size_i  (Modify pop size of pop i.  New size of popi = size_i*N0 .)
	 -es t i proportion  (Split: pop i -> pop-i + pop-npop, npop increases by 1.
		 proportion is probability that each lineage stays in pop-i. (p, 1-p are admixt. proport.
		 Size of pop npop is set to N0 and alpha = 0.0 , size and alpha of pop i are unchanged.
	 -ej t i j   ( Join lineages in pop i and pop j into pop j
		  size, alpha and M are unchanged.
	  -f filename     ( Read command line arguments from file filename.)
 See msdoc.pdf for explanation of these parameters.
NO! at ../../prefersim_additionals/Traj_mssel_2.pl line 21.
 file format error.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.730.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
Second argument error. howmany <= 0. 
usage: mssel nsam howmany nanc nder selfilename selspot -r rho nsites [options] 
  Options: 
	 -t theta   (this option and/or the next must be used. Theta = 4*N0*u )
	 -s segsites   ( fixed number of segregating sites)
	 -T          (Output gene tree.)
	 -F minfreq     Output only sites with freq of minor allele >= minfreq.
	 -r rho nsites     (rho here is 4Nc)
		 -c f track_len   (f = ratio of conversion rate to rec rate. tracklen is mean length.) 
			 if rho = 0.,  f = 4*N0*g, with g the gene conversion rate.
	 -G alpha  ( N(t) = N0*exp(-alpha*t) .  alpha = -log(Np/Nr)/t
	 -I npop n1 n2 ... [mig_rate] (all elements of mig matrix set to mig_rate/(npop-1) 
		 -m i j m_ij    (i,j-th element of mig matrix set to m_ij.)
		 -ma m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
		 -n i size_i   (popi has size set to size_i*N0 
		 -g i alpha_i  (If used must appear after -M option.)
	   The following options modify parameters at the time 't' specified as the first argument:
	 -eG t alpha  (Modify growth rate of all pop's.)
	 -eg t i alpha_i  (Modify growth rate of pop i.) 
	 -eM t mig_rate   (Modify the mig matrix so all elements are mig_rate/(npop-1)
	 -em t i j m_ij    (i,j-th element of mig matrix set to m_ij at time t )
	 -ema t npop  m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
	 -eN t size  (Modify pop sizes. New sizes = size*N0 ) 
	 -en t i size_i  (Modify pop size of pop i.  New size of popi = size_i*N0 .)
	 -es t i proportion  (Split: pop i -> pop-i + pop-npop, npop increases by 1.
		 proportion is probability that each lineage stays in pop-i. (p, 1-p are admixt. proport.
		 Size of pop npop is set to N0 and alpha = 0.0 , size and alpha of pop i are unchanged.
	 -ej t i j   ( Join lineages in pop i and pop j into pop j
		  size, alpha and M are unchanged.
	  -f filename     ( Read command line arguments from file filename.)
 See msdoc.pdf for explanation of these parameters.
NO! at ../../prefersim_additionals/Traj_mssel_2.pl line 21.
 file format error.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.735.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
Second argument error. howmany <= 0. 
usage: mssel nsam howmany nanc nder selfilename selspot -r rho nsites [options] 
  Options: 
	 -t theta   (this option and/or the next must be used. Theta = 4*N0*u )
	 -s segsites   ( fixed number of segregating sites)
	 -T          (Output gene tree.)
	 -F minfreq     Output only sites with freq of minor allele >= minfreq.
	 -r rho nsites     (rho here is 4Nc)
		 -c f track_len   (f = ratio of conversion rate to rec rate. tracklen is mean length.) 
			 if rho = 0.,  f = 4*N0*g, with g the gene conversion rate.
	 -G alpha  ( N(t) = N0*exp(-alpha*t) .  alpha = -log(Np/Nr)/t
	 -I npop n1 n2 ... [mig_rate] (all elements of mig matrix set to mig_rate/(npop-1) 
		 -m i j m_ij    (i,j-th element of mig matrix set to m_ij.)
		 -ma m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
		 -n i size_i   (popi has size set to size_i*N0 
		 -g i alpha_i  (If used must appear after -M option.)
	   The following options modify parameters at the time 't' specified as the first argument:
	 -eG t alpha  (Modify growth rate of all pop's.)
	 -eg t i alpha_i  (Modify growth rate of pop i.) 
	 -eM t mig_rate   (Modify the mig matrix so all elements are mig_rate/(npop-1)
	 -em t i j m_ij    (i,j-th element of mig matrix set to m_ij at time t )
	 -ema t npop  m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
	 -eN t size  (Modify pop sizes. New sizes = size*N0 ) 
	 -en t i size_i  (Modify pop size of pop i.  New size of popi = size_i*N0 .)
	 -es t i proportion  (Split: pop i -> pop-i + pop-npop, npop increases by 1.
		 proportion is probability that each lineage stays in pop-i. (p, 1-p are admixt. proport.
		 Size of pop npop is set to N0 and alpha = 0.0 , size and alpha of pop i are unchanged.
	 -ej t i j   ( Join lineages in pop i and pop j into pop j
		  size, alpha and M are unchanged.
	  -f filename     ( Read command line arguments from file filename.)
 See msdoc.pdf for explanation of these parameters.
NO! at ../../prefersim_additionals/Traj_mssel_2.pl line 21.
 file format error.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.740.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
Second argument error. howmany <= 0. 
usage: mssel nsam howmany nanc nder selfilename selspot -r rho nsites [options] 
  Options: 
	 -t theta   (this option and/or the next must be used. Theta = 4*N0*u )
	 -s segsites   ( fixed number of segregating sites)
	 -T          (Output gene tree.)
	 -F minfreq     Output only sites with freq of minor allele >= minfreq.
	 -r rho nsites     (rho here is 4Nc)
		 -c f track_len   (f = ratio of conversion rate to rec rate. tracklen is mean length.) 
			 if rho = 0.,  f = 4*N0*g, with g the gene conversion rate.
	 -G alpha  ( N(t) = N0*exp(-alpha*t) .  alpha = -log(Np/Nr)/t
	 -I npop n1 n2 ... [mig_rate] (all elements of mig matrix set to mig_rate/(npop-1) 
		 -m i j m_ij    (i,j-th element of mig matrix set to m_ij.)
		 -ma m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
		 -n i size_i   (popi has size set to size_i*N0 
		 -g i alpha_i  (If used must appear after -M option.)
	   The following options modify parameters at the time 't' specified as the first argument:
	 -eG t alpha  (Modify growth rate of all pop's.)
	 -eg t i alpha_i  (Modify growth rate of pop i.) 
	 -eM t mig_rate   (Modify the mig matrix so all elements are mig_rate/(npop-1)
	 -em t i j m_ij    (i,j-th element of mig matrix set to m_ij at time t )
	 -ema t npop  m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
	 -eN t size  (Modify pop sizes. New sizes = size*N0 ) 
	 -en t i size_i  (Modify pop size of pop i.  New size of popi = size_i*N0 .)
	 -es t i proportion  (Split: pop i -> pop-i + pop-npop, npop increases by 1.
		 proportion is probability that each lineage stays in pop-i. (p, 1-p are admixt. proport.
		 Size of pop npop is set to N0 and alpha = 0.0 , size and alpha of pop i are unchanged.
	 -ej t i j   ( Join lineages in pop i and pop j into pop j
		  size, alpha and M are unchanged.
	  -f filename     ( Read command line arguments from file filename.)
 See msdoc.pdf for explanation of these parameters.
NO! at ../../prefersim_additionals/Traj_mssel_2.pl line 21.
 file format error.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.745.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
Second argument error. howmany <= 0. 
usage: mssel nsam howmany nanc nder selfilename selspot -r rho nsites [options] 
  Options: 
	 -t theta   (this option and/or the next must be used. Theta = 4*N0*u )
	 -s segsites   ( fixed number of segregating sites)
	 -T          (Output gene tree.)
	 -F minfreq     Output only sites with freq of minor allele >= minfreq.
	 -r rho nsites     (rho here is 4Nc)
		 -c f track_len   (f = ratio of conversion rate to rec rate. tracklen is mean length.) 
			 if rho = 0.,  f = 4*N0*g, with g the gene conversion rate.
	 -G alpha  ( N(t) = N0*exp(-alpha*t) .  alpha = -log(Np/Nr)/t
	 -I npop n1 n2 ... [mig_rate] (all elements of mig matrix set to mig_rate/(npop-1) 
		 -m i j m_ij    (i,j-th element of mig matrix set to m_ij.)
		 -ma m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
		 -n i size_i   (popi has size set to size_i*N0 
		 -g i alpha_i  (If used must appear after -M option.)
	   The following options modify parameters at the time 't' specified as the first argument:
	 -eG t alpha  (Modify growth rate of all pop's.)
	 -eg t i alpha_i  (Modify growth rate of pop i.) 
	 -eM t mig_rate   (Modify the mig matrix so all elements are mig_rate/(npop-1)
	 -em t i j m_ij    (i,j-th element of mig matrix set to m_ij at time t )
	 -ema t npop  m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
	 -eN t size  (Modify pop sizes. New sizes = size*N0 ) 
	 -en t i size_i  (Modify pop size of pop i.  New size of popi = size_i*N0 .)
	 -es t i proportion  (Split: pop i -> pop-i + pop-npop, npop increases by 1.
		 proportion is probability that each lineage stays in pop-i. (p, 1-p are admixt. proport.
		 Size of pop npop is set to N0 and alpha = 0.0 , size and alpha of pop i are unchanged.
	 -ej t i j   ( Join lineages in pop i and pop j into pop j
		  size, alpha and M are unchanged.
	  -f filename     ( Read command line arguments from file filename.)
 See msdoc.pdf for explanation of these parameters.
NO! at ../../prefersim_additionals/Traj_mssel_2.pl line 21.
 file format error.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.750.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
Second argument error. howmany <= 0. 
usage: mssel nsam howmany nanc nder selfilename selspot -r rho nsites [options] 
  Options: 
	 -t theta   (this option and/or the next must be used. Theta = 4*N0*u )
	 -s segsites   ( fixed number of segregating sites)
	 -T          (Output gene tree.)
	 -F minfreq     Output only sites with freq of minor allele >= minfreq.
	 -r rho nsites     (rho here is 4Nc)
		 -c f track_len   (f = ratio of conversion rate to rec rate. tracklen is mean length.) 
			 if rho = 0.,  f = 4*N0*g, with g the gene conversion rate.
	 -G alpha  ( N(t) = N0*exp(-alpha*t) .  alpha = -log(Np/Nr)/t
	 -I npop n1 n2 ... [mig_rate] (all elements of mig matrix set to mig_rate/(npop-1) 
		 -m i j m_ij    (i,j-th element of mig matrix set to m_ij.)
		 -ma m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
		 -n i size_i   (popi has size set to size_i*N0 
		 -g i alpha_i  (If used must appear after -M option.)
	   The following options modify parameters at the time 't' specified as the first argument:
	 -eG t alpha  (Modify growth rate of all pop's.)
	 -eg t i alpha_i  (Modify growth rate of pop i.) 
	 -eM t mig_rate   (Modify the mig matrix so all elements are mig_rate/(npop-1)
	 -em t i j m_ij    (i,j-th element of mig matrix set to m_ij at time t )
	 -ema t npop  m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
	 -eN t size  (Modify pop sizes. New sizes = size*N0 ) 
	 -en t i size_i  (Modify pop size of pop i.  New size of popi = size_i*N0 .)
	 -es t i proportion  (Split: pop i -> pop-i + pop-npop, npop increases by 1.
		 proportion is probability that each lineage stays in pop-i. (p, 1-p are admixt. proport.
		 Size of pop npop is set to N0 and alpha = 0.0 , size and alpha of pop i are unchanged.
	 -ej t i j   ( Join lineages in pop i and pop j into pop j
		  size, alpha and M are unchanged.
	  -f filename     ( Read command line arguments from file filename.)
 See msdoc.pdf for explanation of these parameters.
NO! at ../../prefersim_additionals/Traj_mssel_2.pl line 21.
 file format error.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.755.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
Second argument error. howmany <= 0. 
usage: mssel nsam howmany nanc nder selfilename selspot -r rho nsites [options] 
  Options: 
	 -t theta   (this option and/or the next must be used. Theta = 4*N0*u )
	 -s segsites   ( fixed number of segregating sites)
	 -T          (Output gene tree.)
	 -F minfreq     Output only sites with freq of minor allele >= minfreq.
	 -r rho nsites     (rho here is 4Nc)
		 -c f track_len   (f = ratio of conversion rate to rec rate. tracklen is mean length.) 
			 if rho = 0.,  f = 4*N0*g, with g the gene conversion rate.
	 -G alpha  ( N(t) = N0*exp(-alpha*t) .  alpha = -log(Np/Nr)/t
	 -I npop n1 n2 ... [mig_rate] (all elements of mig matrix set to mig_rate/(npop-1) 
		 -m i j m_ij    (i,j-th element of mig matrix set to m_ij.)
		 -ma m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
		 -n i size_i   (popi has size set to size_i*N0 
		 -g i alpha_i  (If used must appear after -M option.)
	   The following options modify parameters at the time 't' specified as the first argument:
	 -eG t alpha  (Modify growth rate of all pop's.)
	 -eg t i alpha_i  (Modify growth rate of pop i.) 
	 -eM t mig_rate   (Modify the mig matrix so all elements are mig_rate/(npop-1)
	 -em t i j m_ij    (i,j-th element of mig matrix set to m_ij at time t )
	 -ema t npop  m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
	 -eN t size  (Modify pop sizes. New sizes = size*N0 ) 
	 -en t i size_i  (Modify pop size of pop i.  New size of popi = size_i*N0 .)
	 -es t i proportion  (Split: pop i -> pop-i + pop-npop, npop increases by 1.
		 proportion is probability that each lineage stays in pop-i. (p, 1-p are admixt. proport.
		 Size of pop npop is set to N0 and alpha = 0.0 , size and alpha of pop i are unchanged.
	 -ej t i j   ( Join lineages in pop i and pop j into pop j
		  size, alpha and M are unchanged.
	  -f filename     ( Read command line arguments from file filename.)
 See msdoc.pdf for explanation of these parameters.
NO! at ../../prefersim_additionals/Traj_mssel_2.pl line 21.
 file format error.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.760.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
Second argument error. howmany <= 0. 
usage: mssel nsam howmany nanc nder selfilename selspot -r rho nsites [options] 
  Options: 
	 -t theta   (this option and/or the next must be used. Theta = 4*N0*u )
	 -s segsites   ( fixed number of segregating sites)
	 -T          (Output gene tree.)
	 -F minfreq     Output only sites with freq of minor allele >= minfreq.
	 -r rho nsites     (rho here is 4Nc)
		 -c f track_len   (f = ratio of conversion rate to rec rate. tracklen is mean length.) 
			 if rho = 0.,  f = 4*N0*g, with g the gene conversion rate.
	 -G alpha  ( N(t) = N0*exp(-alpha*t) .  alpha = -log(Np/Nr)/t
	 -I npop n1 n2 ... [mig_rate] (all elements of mig matrix set to mig_rate/(npop-1) 
		 -m i j m_ij    (i,j-th element of mig matrix set to m_ij.)
		 -ma m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
		 -n i size_i   (popi has size set to size_i*N0 
		 -g i alpha_i  (If used must appear after -M option.)
	   The following options modify parameters at the time 't' specified as the first argument:
	 -eG t alpha  (Modify growth rate of all pop's.)
	 -eg t i alpha_i  (Modify growth rate of pop i.) 
	 -eM t mig_rate   (Modify the mig matrix so all elements are mig_rate/(npop-1)
	 -em t i j m_ij    (i,j-th element of mig matrix set to m_ij at time t )
	 -ema t npop  m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
	 -eN t size  (Modify pop sizes. New sizes = size*N0 ) 
	 -en t i size_i  (Modify pop size of pop i.  New size of popi = size_i*N0 .)
	 -es t i proportion  (Split: pop i -> pop-i + pop-npop, npop increases by 1.
		 proportion is probability that each lineage stays in pop-i. (p, 1-p are admixt. proport.
		 Size of pop npop is set to N0 and alpha = 0.0 , size and alpha of pop i are unchanged.
	 -ej t i j   ( Join lineages in pop i and pop j into pop j
		  size, alpha and M are unchanged.
	  -f filename     ( Read command line arguments from file filename.)
 See msdoc.pdf for explanation of these parameters.
NO! at ../../prefersim_additionals/Traj_mssel_2.pl line 21.
 file format error.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.765.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
Second argument error. howmany <= 0. 
usage: mssel nsam howmany nanc nder selfilename selspot -r rho nsites [options] 
  Options: 
	 -t theta   (this option and/or the next must be used. Theta = 4*N0*u )
	 -s segsites   ( fixed number of segregating sites)
	 -T          (Output gene tree.)
	 -F minfreq     Output only sites with freq of minor allele >= minfreq.
	 -r rho nsites     (rho here is 4Nc)
		 -c f track_len   (f = ratio of conversion rate to rec rate. tracklen is mean length.) 
			 if rho = 0.,  f = 4*N0*g, with g the gene conversion rate.
	 -G alpha  ( N(t) = N0*exp(-alpha*t) .  alpha = -log(Np/Nr)/t
	 -I npop n1 n2 ... [mig_rate] (all elements of mig matrix set to mig_rate/(npop-1) 
		 -m i j m_ij    (i,j-th element of mig matrix set to m_ij.)
		 -ma m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
		 -n i size_i   (popi has size set to size_i*N0 
		 -g i alpha_i  (If used must appear after -M option.)
	   The following options modify parameters at the time 't' specified as the first argument:
	 -eG t alpha  (Modify growth rate of all pop's.)
	 -eg t i alpha_i  (Modify growth rate of pop i.) 
	 -eM t mig_rate   (Modify the mig matrix so all elements are mig_rate/(npop-1)
	 -em t i j m_ij    (i,j-th element of mig matrix set to m_ij at time t )
	 -ema t npop  m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
	 -eN t size  (Modify pop sizes. New sizes = size*N0 ) 
	 -en t i size_i  (Modify pop size of pop i.  New size of popi = size_i*N0 .)
	 -es t i proportion  (Split: pop i -> pop-i + pop-npop, npop increases by 1.
		 proportion is probability that each lineage stays in pop-i. (p, 1-p are admixt. proport.
		 Size of pop npop is set to N0 and alpha = 0.0 , size and alpha of pop i are unchanged.
	 -ej t i j   ( Join lineages in pop i and pop j into pop j
		  size, alpha and M are unchanged.
	  -f filename     ( Read command line arguments from file filename.)
 See msdoc.pdf for explanation of these parameters.
NO! at ../../prefersim_additionals/Traj_mssel_2.pl line 21.
 file format error.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.770.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
Second argument error. howmany <= 0. 
usage: mssel nsam howmany nanc nder selfilename selspot -r rho nsites [options] 
  Options: 
	 -t theta   (this option and/or the next must be used. Theta = 4*N0*u )
	 -s segsites   ( fixed number of segregating sites)
	 -T          (Output gene tree.)
	 -F minfreq     Output only sites with freq of minor allele >= minfreq.
	 -r rho nsites     (rho here is 4Nc)
		 -c f track_len   (f = ratio of conversion rate to rec rate. tracklen is mean length.) 
			 if rho = 0.,  f = 4*N0*g, with g the gene conversion rate.
	 -G alpha  ( N(t) = N0*exp(-alpha*t) .  alpha = -log(Np/Nr)/t
	 -I npop n1 n2 ... [mig_rate] (all elements of mig matrix set to mig_rate/(npop-1) 
		 -m i j m_ij    (i,j-th element of mig matrix set to m_ij.)
		 -ma m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
		 -n i size_i   (popi has size set to size_i*N0 
		 -g i alpha_i  (If used must appear after -M option.)
	   The following options modify parameters at the time 't' specified as the first argument:
	 -eG t alpha  (Modify growth rate of all pop's.)
	 -eg t i alpha_i  (Modify growth rate of pop i.) 
	 -eM t mig_rate   (Modify the mig matrix so all elements are mig_rate/(npop-1)
	 -em t i j m_ij    (i,j-th element of mig matrix set to m_ij at time t )
	 -ema t npop  m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
	 -eN t size  (Modify pop sizes. New sizes = size*N0 ) 
	 -en t i size_i  (Modify pop size of pop i.  New size of popi = size_i*N0 .)
	 -es t i proportion  (Split: pop i -> pop-i + pop-npop, npop increases by 1.
		 proportion is probability that each lineage stays in pop-i. (p, 1-p are admixt. proport.
		 Size of pop npop is set to N0 and alpha = 0.0 , size and alpha of pop i are unchanged.
	 -ej t i j   ( Join lineages in pop i and pop j into pop j
		  size, alpha and M are unchanged.
	  -f filename     ( Read command line arguments from file filename.)
 See msdoc.pdf for explanation of these parameters.
NO! at ../../prefersim_additionals/Traj_mssel_2.pl line 21.
 file format error.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.775.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
Second argument error. howmany <= 0. 
usage: mssel nsam howmany nanc nder selfilename selspot -r rho nsites [options] 
  Options: 
	 -t theta   (this option and/or the next must be used. Theta = 4*N0*u )
	 -s segsites   ( fixed number of segregating sites)
	 -T          (Output gene tree.)
	 -F minfreq     Output only sites with freq of minor allele >= minfreq.
	 -r rho nsites     (rho here is 4Nc)
		 -c f track_len   (f = ratio of conversion rate to rec rate. tracklen is mean length.) 
			 if rho = 0.,  f = 4*N0*g, with g the gene conversion rate.
	 -G alpha  ( N(t) = N0*exp(-alpha*t) .  alpha = -log(Np/Nr)/t
	 -I npop n1 n2 ... [mig_rate] (all elements of mig matrix set to mig_rate/(npop-1) 
		 -m i j m_ij    (i,j-th element of mig matrix set to m_ij.)
		 -ma m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
		 -n i size_i   (popi has size set to size_i*N0 
		 -g i alpha_i  (If used must appear after -M option.)
	   The following options modify parameters at the time 't' specified as the first argument:
	 -eG t alpha  (Modify growth rate of all pop's.)
	 -eg t i alpha_i  (Modify growth rate of pop i.) 
	 -eM t mig_rate   (Modify the mig matrix so all elements are mig_rate/(npop-1)
	 -em t i j m_ij    (i,j-th element of mig matrix set to m_ij at time t )
	 -ema t npop  m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
	 -eN t size  (Modify pop sizes. New sizes = size*N0 ) 
	 -en t i size_i  (Modify pop size of pop i.  New size of popi = size_i*N0 .)
	 -es t i proportion  (Split: pop i -> pop-i + pop-npop, npop increases by 1.
		 proportion is probability that each lineage stays in pop-i. (p, 1-p are admixt. proport.
		 Size of pop npop is set to N0 and alpha = 0.0 , size and alpha of pop i are unchanged.
	 -ej t i j   ( Join lineages in pop i and pop j into pop j
		  size, alpha and M are unchanged.
	  -f filename     ( Read command line arguments from file filename.)
 See msdoc.pdf for explanation of these parameters.
NO! at ../../prefersim_additionals/Traj_mssel_2.pl line 21.
 file format error.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.780.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
Second argument error. howmany <= 0. 
usage: mssel nsam howmany nanc nder selfilename selspot -r rho nsites [options] 
  Options: 
	 -t theta   (this option and/or the next must be used. Theta = 4*N0*u )
	 -s segsites   ( fixed number of segregating sites)
	 -T          (Output gene tree.)
	 -F minfreq     Output only sites with freq of minor allele >= minfreq.
	 -r rho nsites     (rho here is 4Nc)
		 -c f track_len   (f = ratio of conversion rate to rec rate. tracklen is mean length.) 
			 if rho = 0.,  f = 4*N0*g, with g the gene conversion rate.
	 -G alpha  ( N(t) = N0*exp(-alpha*t) .  alpha = -log(Np/Nr)/t
	 -I npop n1 n2 ... [mig_rate] (all elements of mig matrix set to mig_rate/(npop-1) 
		 -m i j m_ij    (i,j-th element of mig matrix set to m_ij.)
		 -ma m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
		 -n i size_i   (popi has size set to size_i*N0 
		 -g i alpha_i  (If used must appear after -M option.)
	   The following options modify parameters at the time 't' specified as the first argument:
	 -eG t alpha  (Modify growth rate of all pop's.)
	 -eg t i alpha_i  (Modify growth rate of pop i.) 
	 -eM t mig_rate   (Modify the mig matrix so all elements are mig_rate/(npop-1)
	 -em t i j m_ij    (i,j-th element of mig matrix set to m_ij at time t )
	 -ema t npop  m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
	 -eN t size  (Modify pop sizes. New sizes = size*N0 ) 
	 -en t i size_i  (Modify pop size of pop i.  New size of popi = size_i*N0 .)
	 -es t i proportion  (Split: pop i -> pop-i + pop-npop, npop increases by 1.
		 proportion is probability that each lineage stays in pop-i. (p, 1-p are admixt. proport.
		 Size of pop npop is set to N0 and alpha = 0.0 , size and alpha of pop i are unchanged.
	 -ej t i j   ( Join lineages in pop i and pop j into pop j
		  size, alpha and M are unchanged.
	  -f filename     ( Read command line arguments from file filename.)
 See msdoc.pdf for explanation of these parameters.
NO! at ../../prefersim_additionals/Traj_mssel_2.pl line 21.
 file format error.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.785.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
Second argument error. howmany <= 0. 
usage: mssel nsam howmany nanc nder selfilename selspot -r rho nsites [options] 
  Options: 
	 -t theta   (this option and/or the next must be used. Theta = 4*N0*u )
	 -s segsites   ( fixed number of segregating sites)
	 -T          (Output gene tree.)
	 -F minfreq     Output only sites with freq of minor allele >= minfreq.
	 -r rho nsites     (rho here is 4Nc)
		 -c f track_len   (f = ratio of conversion rate to rec rate. tracklen is mean length.) 
			 if rho = 0.,  f = 4*N0*g, with g the gene conversion rate.
	 -G alpha  ( N(t) = N0*exp(-alpha*t) .  alpha = -log(Np/Nr)/t
	 -I npop n1 n2 ... [mig_rate] (all elements of mig matrix set to mig_rate/(npop-1) 
		 -m i j m_ij    (i,j-th element of mig matrix set to m_ij.)
		 -ma m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
		 -n i size_i   (popi has size set to size_i*N0 
		 -g i alpha_i  (If used must appear after -M option.)
	   The following options modify parameters at the time 't' specified as the first argument:
	 -eG t alpha  (Modify growth rate of all pop's.)
	 -eg t i alpha_i  (Modify growth rate of pop i.) 
	 -eM t mig_rate   (Modify the mig matrix so all elements are mig_rate/(npop-1)
	 -em t i j m_ij    (i,j-th element of mig matrix set to m_ij at time t )
	 -ema t npop  m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
	 -eN t size  (Modify pop sizes. New sizes = size*N0 ) 
	 -en t i size_i  (Modify pop size of pop i.  New size of popi = size_i*N0 .)
	 -es t i proportion  (Split: pop i -> pop-i + pop-npop, npop increases by 1.
		 proportion is probability that each lineage stays in pop-i. (p, 1-p are admixt. proport.
		 Size of pop npop is set to N0 and alpha = 0.0 , size and alpha of pop i are unchanged.
	 -ej t i j   ( Join lineages in pop i and pop j into pop j
		  size, alpha and M are unchanged.
	  -f filename     ( Read command line arguments from file filename.)
 See msdoc.pdf for explanation of these parameters.
NO! at ../../prefersim_additionals/Traj_mssel_2.pl line 21.
 file format error.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.790.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
Second argument error. howmany <= 0. 
usage: mssel nsam howmany nanc nder selfilename selspot -r rho nsites [options] 
  Options: 
	 -t theta   (this option and/or the next must be used. Theta = 4*N0*u )
	 -s segsites   ( fixed number of segregating sites)
	 -T          (Output gene tree.)
	 -F minfreq     Output only sites with freq of minor allele >= minfreq.
	 -r rho nsites     (rho here is 4Nc)
		 -c f track_len   (f = ratio of conversion rate to rec rate. tracklen is mean length.) 
			 if rho = 0.,  f = 4*N0*g, with g the gene conversion rate.
	 -G alpha  ( N(t) = N0*exp(-alpha*t) .  alpha = -log(Np/Nr)/t
	 -I npop n1 n2 ... [mig_rate] (all elements of mig matrix set to mig_rate/(npop-1) 
		 -m i j m_ij    (i,j-th element of mig matrix set to m_ij.)
		 -ma m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
		 -n i size_i   (popi has size set to size_i*N0 
		 -g i alpha_i  (If used must appear after -M option.)
	   The following options modify parameters at the time 't' specified as the first argument:
	 -eG t alpha  (Modify growth rate of all pop's.)
	 -eg t i alpha_i  (Modify growth rate of pop i.) 
	 -eM t mig_rate   (Modify the mig matrix so all elements are mig_rate/(npop-1)
	 -em t i j m_ij    (i,j-th element of mig matrix set to m_ij at time t )
	 -ema t npop  m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
	 -eN t size  (Modify pop sizes. New sizes = size*N0 ) 
	 -en t i size_i  (Modify pop size of pop i.  New size of popi = size_i*N0 .)
	 -es t i proportion  (Split: pop i -> pop-i + pop-npop, npop increases by 1.
		 proportion is probability that each lineage stays in pop-i. (p, 1-p are admixt. proport.
		 Size of pop npop is set to N0 and alpha = 0.0 , size and alpha of pop i are unchanged.
	 -ej t i j   ( Join lineages in pop i and pop j into pop j
		  size, alpha and M are unchanged.
	  -f filename     ( Read command line arguments from file filename.)
 See msdoc.pdf for explanation of these parameters.
NO! at ../../prefersim_additionals/Traj_mssel_2.pl line 21.
 file format error.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.795.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
Second argument error. howmany <= 0. 
usage: mssel nsam howmany nanc nder selfilename selspot -r rho nsites [options] 
  Options: 
	 -t theta   (this option and/or the next must be used. Theta = 4*N0*u )
	 -s segsites   ( fixed number of segregating sites)
	 -T          (Output gene tree.)
	 -F minfreq     Output only sites with freq of minor allele >= minfreq.
	 -r rho nsites     (rho here is 4Nc)
		 -c f track_len   (f = ratio of conversion rate to rec rate. tracklen is mean length.) 
			 if rho = 0.,  f = 4*N0*g, with g the gene conversion rate.
	 -G alpha  ( N(t) = N0*exp(-alpha*t) .  alpha = -log(Np/Nr)/t
	 -I npop n1 n2 ... [mig_rate] (all elements of mig matrix set to mig_rate/(npop-1) 
		 -m i j m_ij    (i,j-th element of mig matrix set to m_ij.)
		 -ma m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
		 -n i size_i   (popi has size set to size_i*N0 
		 -g i alpha_i  (If used must appear after -M option.)
	   The following options modify parameters at the time 't' specified as the first argument:
	 -eG t alpha  (Modify growth rate of all pop's.)
	 -eg t i alpha_i  (Modify growth rate of pop i.) 
	 -eM t mig_rate   (Modify the mig matrix so all elements are mig_rate/(npop-1)
	 -em t i j m_ij    (i,j-th element of mig matrix set to m_ij at time t )
	 -ema t npop  m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
	 -eN t size  (Modify pop sizes. New sizes = size*N0 ) 
	 -en t i size_i  (Modify pop size of pop i.  New size of popi = size_i*N0 .)
	 -es t i proportion  (Split: pop i -> pop-i + pop-npop, npop increases by 1.
		 proportion is probability that each lineage stays in pop-i. (p, 1-p are admixt. proport.
		 Size of pop npop is set to N0 and alpha = 0.0 , size and alpha of pop i are unchanged.
	 -ej t i j   ( Join lineages in pop i and pop j into pop j
		  size, alpha and M are unchanged.
	  -f filename     ( Read command line arguments from file filename.)
 See msdoc.pdf for explanation of these parameters.
NO! at ../../prefersim_additionals/Traj_mssel_2.pl line 21.
 file format error.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.800.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
Second argument error. howmany <= 0. 
usage: mssel nsam howmany nanc nder selfilename selspot -r rho nsites [options] 
  Options: 
	 -t theta   (this option and/or the next must be used. Theta = 4*N0*u )
	 -s segsites   ( fixed number of segregating sites)
	 -T          (Output gene tree.)
	 -F minfreq     Output only sites with freq of minor allele >= minfreq.
	 -r rho nsites     (rho here is 4Nc)
		 -c f track_len   (f = ratio of conversion rate to rec rate. tracklen is mean length.) 
			 if rho = 0.,  f = 4*N0*g, with g the gene conversion rate.
	 -G alpha  ( N(t) = N0*exp(-alpha*t) .  alpha = -log(Np/Nr)/t
	 -I npop n1 n2 ... [mig_rate] (all elements of mig matrix set to mig_rate/(npop-1) 
		 -m i j m_ij    (i,j-th element of mig matrix set to m_ij.)
		 -ma m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
		 -n i size_i   (popi has size set to size_i*N0 
		 -g i alpha_i  (If used must appear after -M option.)
	   The following options modify parameters at the time 't' specified as the first argument:
	 -eG t alpha  (Modify growth rate of all pop's.)
	 -eg t i alpha_i  (Modify growth rate of pop i.) 
	 -eM t mig_rate   (Modify the mig matrix so all elements are mig_rate/(npop-1)
	 -em t i j m_ij    (i,j-th element of mig matrix set to m_ij at time t )
	 -ema t npop  m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
	 -eN t size  (Modify pop sizes. New sizes = size*N0 ) 
	 -en t i size_i  (Modify pop size of pop i.  New size of popi = size_i*N0 .)
	 -es t i proportion  (Split: pop i -> pop-i + pop-npop, npop increases by 1.
		 proportion is probability that each lineage stays in pop-i. (p, 1-p are admixt. proport.
		 Size of pop npop is set to N0 and alpha = 0.0 , size and alpha of pop i are unchanged.
	 -ej t i j   ( Join lineages in pop i and pop j into pop j
		  size, alpha and M are unchanged.
	  -f filename     ( Read command line arguments from file filename.)
 See msdoc.pdf for explanation of these parameters.
NO! at ../../prefersim_additionals/Traj_mssel_2.pl line 21.
 file format error.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.805.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
Second argument error. howmany <= 0. 
usage: mssel nsam howmany nanc nder selfilename selspot -r rho nsites [options] 
  Options: 
	 -t theta   (this option and/or the next must be used. Theta = 4*N0*u )
	 -s segsites   ( fixed number of segregating sites)
	 -T          (Output gene tree.)
	 -F minfreq     Output only sites with freq of minor allele >= minfreq.
	 -r rho nsites     (rho here is 4Nc)
		 -c f track_len   (f = ratio of conversion rate to rec rate. tracklen is mean length.) 
			 if rho = 0.,  f = 4*N0*g, with g the gene conversion rate.
	 -G alpha  ( N(t) = N0*exp(-alpha*t) .  alpha = -log(Np/Nr)/t
	 -I npop n1 n2 ... [mig_rate] (all elements of mig matrix set to mig_rate/(npop-1) 
		 -m i j m_ij    (i,j-th element of mig matrix set to m_ij.)
		 -ma m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
		 -n i size_i   (popi has size set to size_i*N0 
		 -g i alpha_i  (If used must appear after -M option.)
	   The following options modify parameters at the time 't' specified as the first argument:
	 -eG t alpha  (Modify growth rate of all pop's.)
	 -eg t i alpha_i  (Modify growth rate of pop i.) 
	 -eM t mig_rate   (Modify the mig matrix so all elements are mig_rate/(npop-1)
	 -em t i j m_ij    (i,j-th element of mig matrix set to m_ij at time t )
	 -ema t npop  m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
	 -eN t size  (Modify pop sizes. New sizes = size*N0 ) 
	 -en t i size_i  (Modify pop size of pop i.  New size of popi = size_i*N0 .)
	 -es t i proportion  (Split: pop i -> pop-i + pop-npop, npop increases by 1.
		 proportion is probability that each lineage stays in pop-i. (p, 1-p are admixt. proport.
		 Size of pop npop is set to N0 and alpha = 0.0 , size and alpha of pop i are unchanged.
	 -ej t i j   ( Join lineages in pop i and pop j into pop j
		  size, alpha and M are unchanged.
	  -f filename     ( Read command line arguments from file filename.)
 See msdoc.pdf for explanation of these parameters.
NO! at ../../prefersim_additionals/Traj_mssel_2.pl line 21.
 file format error.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.810.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
Second argument error. howmany <= 0. 
usage: mssel nsam howmany nanc nder selfilename selspot -r rho nsites [options] 
  Options: 
	 -t theta   (this option and/or the next must be used. Theta = 4*N0*u )
	 -s segsites   ( fixed number of segregating sites)
	 -T          (Output gene tree.)
	 -F minfreq     Output only sites with freq of minor allele >= minfreq.
	 -r rho nsites     (rho here is 4Nc)
		 -c f track_len   (f = ratio of conversion rate to rec rate. tracklen is mean length.) 
			 if rho = 0.,  f = 4*N0*g, with g the gene conversion rate.
	 -G alpha  ( N(t) = N0*exp(-alpha*t) .  alpha = -log(Np/Nr)/t
	 -I npop n1 n2 ... [mig_rate] (all elements of mig matrix set to mig_rate/(npop-1) 
		 -m i j m_ij    (i,j-th element of mig matrix set to m_ij.)
		 -ma m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
		 -n i size_i   (popi has size set to size_i*N0 
		 -g i alpha_i  (If used must appear after -M option.)
	   The following options modify parameters at the time 't' specified as the first argument:
	 -eG t alpha  (Modify growth rate of all pop's.)
	 -eg t i alpha_i  (Modify growth rate of pop i.) 
	 -eM t mig_rate   (Modify the mig matrix so all elements are mig_rate/(npop-1)
	 -em t i j m_ij    (i,j-th element of mig matrix set to m_ij at time t )
	 -ema t npop  m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
	 -eN t size  (Modify pop sizes. New sizes = size*N0 ) 
	 -en t i size_i  (Modify pop size of pop i.  New size of popi = size_i*N0 .)
	 -es t i proportion  (Split: pop i -> pop-i + pop-npop, npop increases by 1.
		 proportion is probability that each lineage stays in pop-i. (p, 1-p are admixt. proport.
		 Size of pop npop is set to N0 and alpha = 0.0 , size and alpha of pop i are unchanged.
	 -ej t i j   ( Join lineages in pop i and pop j into pop j
		  size, alpha and M are unchanged.
	  -f filename     ( Read command line arguments from file filename.)
 See msdoc.pdf for explanation of these parameters.
NO! at ../../prefersim_additionals/Traj_mssel_2.pl line 21.
 file format error.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.815.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
Second argument error. howmany <= 0. 
usage: mssel nsam howmany nanc nder selfilename selspot -r rho nsites [options] 
  Options: 
	 -t theta   (this option and/or the next must be used. Theta = 4*N0*u )
	 -s segsites   ( fixed number of segregating sites)
	 -T          (Output gene tree.)
	 -F minfreq     Output only sites with freq of minor allele >= minfreq.
	 -r rho nsites     (rho here is 4Nc)
		 -c f track_len   (f = ratio of conversion rate to rec rate. tracklen is mean length.) 
			 if rho = 0.,  f = 4*N0*g, with g the gene conversion rate.
	 -G alpha  ( N(t) = N0*exp(-alpha*t) .  alpha = -log(Np/Nr)/t
	 -I npop n1 n2 ... [mig_rate] (all elements of mig matrix set to mig_rate/(npop-1) 
		 -m i j m_ij    (i,j-th element of mig matrix set to m_ij.)
		 -ma m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
		 -n i size_i   (popi has size set to size_i*N0 
		 -g i alpha_i  (If used must appear after -M option.)
	   The following options modify parameters at the time 't' specified as the first argument:
	 -eG t alpha  (Modify growth rate of all pop's.)
	 -eg t i alpha_i  (Modify growth rate of pop i.) 
	 -eM t mig_rate   (Modify the mig matrix so all elements are mig_rate/(npop-1)
	 -em t i j m_ij    (i,j-th element of mig matrix set to m_ij at time t )
	 -ema t npop  m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
	 -eN t size  (Modify pop sizes. New sizes = size*N0 ) 
	 -en t i size_i  (Modify pop size of pop i.  New size of popi = size_i*N0 .)
	 -es t i proportion  (Split: pop i -> pop-i + pop-npop, npop increases by 1.
		 proportion is probability that each lineage stays in pop-i. (p, 1-p are admixt. proport.
		 Size of pop npop is set to N0 and alpha = 0.0 , size and alpha of pop i are unchanged.
	 -ej t i j   ( Join lineages in pop i and pop j into pop j
		  size, alpha and M are unchanged.
	  -f filename     ( Read command line arguments from file filename.)
 See msdoc.pdf for explanation of these parameters.
NO! at ../../prefersim_additionals/Traj_mssel_2.pl line 21.
 file format error.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.820.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
Second argument error. howmany <= 0. 
usage: mssel nsam howmany nanc nder selfilename selspot -r rho nsites [options] 
  Options: 
	 -t theta   (this option and/or the next must be used. Theta = 4*N0*u )
	 -s segsites   ( fixed number of segregating sites)
	 -T          (Output gene tree.)
	 -F minfreq     Output only sites with freq of minor allele >= minfreq.
	 -r rho nsites     (rho here is 4Nc)
		 -c f track_len   (f = ratio of conversion rate to rec rate. tracklen is mean length.) 
			 if rho = 0.,  f = 4*N0*g, with g the gene conversion rate.
	 -G alpha  ( N(t) = N0*exp(-alpha*t) .  alpha = -log(Np/Nr)/t
	 -I npop n1 n2 ... [mig_rate] (all elements of mig matrix set to mig_rate/(npop-1) 
		 -m i j m_ij    (i,j-th element of mig matrix set to m_ij.)
		 -ma m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
		 -n i size_i   (popi has size set to size_i*N0 
		 -g i alpha_i  (If used must appear after -M option.)
	   The following options modify parameters at the time 't' specified as the first argument:
	 -eG t alpha  (Modify growth rate of all pop's.)
	 -eg t i alpha_i  (Modify growth rate of pop i.) 
	 -eM t mig_rate   (Modify the mig matrix so all elements are mig_rate/(npop-1)
	 -em t i j m_ij    (i,j-th element of mig matrix set to m_ij at time t )
	 -ema t npop  m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
	 -eN t size  (Modify pop sizes. New sizes = size*N0 ) 
	 -en t i size_i  (Modify pop size of pop i.  New size of popi = size_i*N0 .)
	 -es t i proportion  (Split: pop i -> pop-i + pop-npop, npop increases by 1.
		 proportion is probability that each lineage stays in pop-i. (p, 1-p are admixt. proport.
		 Size of pop npop is set to N0 and alpha = 0.0 , size and alpha of pop i are unchanged.
	 -ej t i j   ( Join lineages in pop i and pop j into pop j
		  size, alpha and M are unchanged.
	  -f filename     ( Read command line arguments from file filename.)
 See msdoc.pdf for explanation of these parameters.
NO! at ../../prefersim_additionals/Traj_mssel_2.pl line 21.
 file format error.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.825.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
Second argument error. howmany <= 0. 
usage: mssel nsam howmany nanc nder selfilename selspot -r rho nsites [options] 
  Options: 
	 -t theta   (this option and/or the next must be used. Theta = 4*N0*u )
	 -s segsites   ( fixed number of segregating sites)
	 -T          (Output gene tree.)
	 -F minfreq     Output only sites with freq of minor allele >= minfreq.
	 -r rho nsites     (rho here is 4Nc)
		 -c f track_len   (f = ratio of conversion rate to rec rate. tracklen is mean length.) 
			 if rho = 0.,  f = 4*N0*g, with g the gene conversion rate.
	 -G alpha  ( N(t) = N0*exp(-alpha*t) .  alpha = -log(Np/Nr)/t
	 -I npop n1 n2 ... [mig_rate] (all elements of mig matrix set to mig_rate/(npop-1) 
		 -m i j m_ij    (i,j-th element of mig matrix set to m_ij.)
		 -ma m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
		 -n i size_i   (popi has size set to size_i*N0 
		 -g i alpha_i  (If used must appear after -M option.)
	   The following options modify parameters at the time 't' specified as the first argument:
	 -eG t alpha  (Modify growth rate of all pop's.)
	 -eg t i alpha_i  (Modify growth rate of pop i.) 
	 -eM t mig_rate   (Modify the mig matrix so all elements are mig_rate/(npop-1)
	 -em t i j m_ij    (i,j-th element of mig matrix set to m_ij at time t )
	 -ema t npop  m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
	 -eN t size  (Modify pop sizes. New sizes = size*N0 ) 
	 -en t i size_i  (Modify pop size of pop i.  New size of popi = size_i*N0 .)
	 -es t i proportion  (Split: pop i -> pop-i + pop-npop, npop increases by 1.
		 proportion is probability that each lineage stays in pop-i. (p, 1-p are admixt. proport.
		 Size of pop npop is set to N0 and alpha = 0.0 , size and alpha of pop i are unchanged.
	 -ej t i j   ( Join lineages in pop i and pop j into pop j
		  size, alpha and M are unchanged.
	  -f filename     ( Read command line arguments from file filename.)
 See msdoc.pdf for explanation of these parameters.
NO! at ../../prefersim_additionals/Traj_mssel_2.pl line 21.
 file format error.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.830.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
Second argument error. howmany <= 0. 
usage: mssel nsam howmany nanc nder selfilename selspot -r rho nsites [options] 
  Options: 
	 -t theta   (this option and/or the next must be used. Theta = 4*N0*u )
	 -s segsites   ( fixed number of segregating sites)
	 -T          (Output gene tree.)
	 -F minfreq     Output only sites with freq of minor allele >= minfreq.
	 -r rho nsites     (rho here is 4Nc)
		 -c f track_len   (f = ratio of conversion rate to rec rate. tracklen is mean length.) 
			 if rho = 0.,  f = 4*N0*g, with g the gene conversion rate.
	 -G alpha  ( N(t) = N0*exp(-alpha*t) .  alpha = -log(Np/Nr)/t
	 -I npop n1 n2 ... [mig_rate] (all elements of mig matrix set to mig_rate/(npop-1) 
		 -m i j m_ij    (i,j-th element of mig matrix set to m_ij.)
		 -ma m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
		 -n i size_i   (popi has size set to size_i*N0 
		 -g i alpha_i  (If used must appear after -M option.)
	   The following options modify parameters at the time 't' specified as the first argument:
	 -eG t alpha  (Modify growth rate of all pop's.)
	 -eg t i alpha_i  (Modify growth rate of pop i.) 
	 -eM t mig_rate   (Modify the mig matrix so all elements are mig_rate/(npop-1)
	 -em t i j m_ij    (i,j-th element of mig matrix set to m_ij at time t )
	 -ema t npop  m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
	 -eN t size  (Modify pop sizes. New sizes = size*N0 ) 
	 -en t i size_i  (Modify pop size of pop i.  New size of popi = size_i*N0 .)
	 -es t i proportion  (Split: pop i -> pop-i + pop-npop, npop increases by 1.
		 proportion is probability that each lineage stays in pop-i. (p, 1-p are admixt. proport.
		 Size of pop npop is set to N0 and alpha = 0.0 , size and alpha of pop i are unchanged.
	 -ej t i j   ( Join lineages in pop i and pop j into pop j
		  size, alpha and M are unchanged.
	  -f filename     ( Read command line arguments from file filename.)
 See msdoc.pdf for explanation of these parameters.
NO! at ../../prefersim_additionals/Traj_mssel_2.pl line 21.
 file format error.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.835.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
Second argument error. howmany <= 0. 
usage: mssel nsam howmany nanc nder selfilename selspot -r rho nsites [options] 
  Options: 
	 -t theta   (this option and/or the next must be used. Theta = 4*N0*u )
	 -s segsites   ( fixed number of segregating sites)
	 -T          (Output gene tree.)
	 -F minfreq     Output only sites with freq of minor allele >= minfreq.
	 -r rho nsites     (rho here is 4Nc)
		 -c f track_len   (f = ratio of conversion rate to rec rate. tracklen is mean length.) 
			 if rho = 0.,  f = 4*N0*g, with g the gene conversion rate.
	 -G alpha  ( N(t) = N0*exp(-alpha*t) .  alpha = -log(Np/Nr)/t
	 -I npop n1 n2 ... [mig_rate] (all elements of mig matrix set to mig_rate/(npop-1) 
		 -m i j m_ij    (i,j-th element of mig matrix set to m_ij.)
		 -ma m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
		 -n i size_i   (popi has size set to size_i*N0 
		 -g i alpha_i  (If used must appear after -M option.)
	   The following options modify parameters at the time 't' specified as the first argument:
	 -eG t alpha  (Modify growth rate of all pop's.)
	 -eg t i alpha_i  (Modify growth rate of pop i.) 
	 -eM t mig_rate   (Modify the mig matrix so all elements are mig_rate/(npop-1)
	 -em t i j m_ij    (i,j-th element of mig matrix set to m_ij at time t )
	 -ema t npop  m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
	 -eN t size  (Modify pop sizes. New sizes = size*N0 ) 
	 -en t i size_i  (Modify pop size of pop i.  New size of popi = size_i*N0 .)
	 -es t i proportion  (Split: pop i -> pop-i + pop-npop, npop increases by 1.
		 proportion is probability that each lineage stays in pop-i. (p, 1-p are admixt. proport.
		 Size of pop npop is set to N0 and alpha = 0.0 , size and alpha of pop i are unchanged.
	 -ej t i j   ( Join lineages in pop i and pop j into pop j
		  size, alpha and M are unchanged.
	  -f filename     ( Read command line arguments from file filename.)
 See msdoc.pdf for explanation of these parameters.
NO! at ../../prefersim_additionals/Traj_mssel_2.pl line 21.
 file format error.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.840.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
Second argument error. howmany <= 0. 
usage: mssel nsam howmany nanc nder selfilename selspot -r rho nsites [options] 
  Options: 
	 -t theta   (this option and/or the next must be used. Theta = 4*N0*u )
	 -s segsites   ( fixed number of segregating sites)
	 -T          (Output gene tree.)
	 -F minfreq     Output only sites with freq of minor allele >= minfreq.
	 -r rho nsites     (rho here is 4Nc)
		 -c f track_len   (f = ratio of conversion rate to rec rate. tracklen is mean length.) 
			 if rho = 0.,  f = 4*N0*g, with g the gene conversion rate.
	 -G alpha  ( N(t) = N0*exp(-alpha*t) .  alpha = -log(Np/Nr)/t
	 -I npop n1 n2 ... [mig_rate] (all elements of mig matrix set to mig_rate/(npop-1) 
		 -m i j m_ij    (i,j-th element of mig matrix set to m_ij.)
		 -ma m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
		 -n i size_i   (popi has size set to size_i*N0 
		 -g i alpha_i  (If used must appear after -M option.)
	   The following options modify parameters at the time 't' specified as the first argument:
	 -eG t alpha  (Modify growth rate of all pop's.)
	 -eg t i alpha_i  (Modify growth rate of pop i.) 
	 -eM t mig_rate   (Modify the mig matrix so all elements are mig_rate/(npop-1)
	 -em t i j m_ij    (i,j-th element of mig matrix set to m_ij at time t )
	 -ema t npop  m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
	 -eN t size  (Modify pop sizes. New sizes = size*N0 ) 
	 -en t i size_i  (Modify pop size of pop i.  New size of popi = size_i*N0 .)
	 -es t i proportion  (Split: pop i -> pop-i + pop-npop, npop increases by 1.
		 proportion is probability that each lineage stays in pop-i. (p, 1-p are admixt. proport.
		 Size of pop npop is set to N0 and alpha = 0.0 , size and alpha of pop i are unchanged.
	 -ej t i j   ( Join lineages in pop i and pop j into pop j
		  size, alpha and M are unchanged.
	  -f filename     ( Read command line arguments from file filename.)
 See msdoc.pdf for explanation of these parameters.
NO! at ../../prefersim_additionals/Traj_mssel_2.pl line 21.
 file format error.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.845.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
Second argument error. howmany <= 0. 
usage: mssel nsam howmany nanc nder selfilename selspot -r rho nsites [options] 
  Options: 
	 -t theta   (this option and/or the next must be used. Theta = 4*N0*u )
	 -s segsites   ( fixed number of segregating sites)
	 -T          (Output gene tree.)
	 -F minfreq     Output only sites with freq of minor allele >= minfreq.
	 -r rho nsites     (rho here is 4Nc)
		 -c f track_len   (f = ratio of conversion rate to rec rate. tracklen is mean length.) 
			 if rho = 0.,  f = 4*N0*g, with g the gene conversion rate.
	 -G alpha  ( N(t) = N0*exp(-alpha*t) .  alpha = -log(Np/Nr)/t
	 -I npop n1 n2 ... [mig_rate] (all elements of mig matrix set to mig_rate/(npop-1) 
		 -m i j m_ij    (i,j-th element of mig matrix set to m_ij.)
		 -ma m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
		 -n i size_i   (popi has size set to size_i*N0 
		 -g i alpha_i  (If used must appear after -M option.)
	   The following options modify parameters at the time 't' specified as the first argument:
	 -eG t alpha  (Modify growth rate of all pop's.)
	 -eg t i alpha_i  (Modify growth rate of pop i.) 
	 -eM t mig_rate   (Modify the mig matrix so all elements are mig_rate/(npop-1)
	 -em t i j m_ij    (i,j-th element of mig matrix set to m_ij at time t )
	 -ema t npop  m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
	 -eN t size  (Modify pop sizes. New sizes = size*N0 ) 
	 -en t i size_i  (Modify pop size of pop i.  New size of popi = size_i*N0 .)
	 -es t i proportion  (Split: pop i -> pop-i + pop-npop, npop increases by 1.
		 proportion is probability that each lineage stays in pop-i. (p, 1-p are admixt. proport.
		 Size of pop npop is set to N0 and alpha = 0.0 , size and alpha of pop i are unchanged.
	 -ej t i j   ( Join lineages in pop i and pop j into pop j
		  size, alpha and M are unchanged.
	  -f filename     ( Read command line arguments from file filename.)
 See msdoc.pdf for explanation of these parameters.
NO! at ../../prefersim_additionals/Traj_mssel_2.pl line 21.
 file format error.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.850.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
Second argument error. howmany <= 0. 
usage: mssel nsam howmany nanc nder selfilename selspot -r rho nsites [options] 
  Options: 
	 -t theta   (this option and/or the next must be used. Theta = 4*N0*u )
	 -s segsites   ( fixed number of segregating sites)
	 -T          (Output gene tree.)
	 -F minfreq     Output only sites with freq of minor allele >= minfreq.
	 -r rho nsites     (rho here is 4Nc)
		 -c f track_len   (f = ratio of conversion rate to rec rate. tracklen is mean length.) 
			 if rho = 0.,  f = 4*N0*g, with g the gene conversion rate.
	 -G alpha  ( N(t) = N0*exp(-alpha*t) .  alpha = -log(Np/Nr)/t
	 -I npop n1 n2 ... [mig_rate] (all elements of mig matrix set to mig_rate/(npop-1) 
		 -m i j m_ij    (i,j-th element of mig matrix set to m_ij.)
		 -ma m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
		 -n i size_i   (popi has size set to size_i*N0 
		 -g i alpha_i  (If used must appear after -M option.)
	   The following options modify parameters at the time 't' specified as the first argument:
	 -eG t alpha  (Modify growth rate of all pop's.)
	 -eg t i alpha_i  (Modify growth rate of pop i.) 
	 -eM t mig_rate   (Modify the mig matrix so all elements are mig_rate/(npop-1)
	 -em t i j m_ij    (i,j-th element of mig matrix set to m_ij at time t )
	 -ema t npop  m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
	 -eN t size  (Modify pop sizes. New sizes = size*N0 ) 
	 -en t i size_i  (Modify pop size of pop i.  New size of popi = size_i*N0 .)
	 -es t i proportion  (Split: pop i -> pop-i + pop-npop, npop increases by 1.
		 proportion is probability that each lineage stays in pop-i. (p, 1-p are admixt. proport.
		 Size of pop npop is set to N0 and alpha = 0.0 , size and alpha of pop i are unchanged.
	 -ej t i j   ( Join lineages in pop i and pop j into pop j
		  size, alpha and M are unchanged.
	  -f filename     ( Read command line arguments from file filename.)
 See msdoc.pdf for explanation of these parameters.
NO! at ../../prefersim_additionals/Traj_mssel_2.pl line 21.
 file format error.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.855.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
Second argument error. howmany <= 0. 
usage: mssel nsam howmany nanc nder selfilename selspot -r rho nsites [options] 
  Options: 
	 -t theta   (this option and/or the next must be used. Theta = 4*N0*u )
	 -s segsites   ( fixed number of segregating sites)
	 -T          (Output gene tree.)
	 -F minfreq     Output only sites with freq of minor allele >= minfreq.
	 -r rho nsites     (rho here is 4Nc)
		 -c f track_len   (f = ratio of conversion rate to rec rate. tracklen is mean length.) 
			 if rho = 0.,  f = 4*N0*g, with g the gene conversion rate.
	 -G alpha  ( N(t) = N0*exp(-alpha*t) .  alpha = -log(Np/Nr)/t
	 -I npop n1 n2 ... [mig_rate] (all elements of mig matrix set to mig_rate/(npop-1) 
		 -m i j m_ij    (i,j-th element of mig matrix set to m_ij.)
		 -ma m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
		 -n i size_i   (popi has size set to size_i*N0 
		 -g i alpha_i  (If used must appear after -M option.)
	   The following options modify parameters at the time 't' specified as the first argument:
	 -eG t alpha  (Modify growth rate of all pop's.)
	 -eg t i alpha_i  (Modify growth rate of pop i.) 
	 -eM t mig_rate   (Modify the mig matrix so all elements are mig_rate/(npop-1)
	 -em t i j m_ij    (i,j-th element of mig matrix set to m_ij at time t )
	 -ema t npop  m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
	 -eN t size  (Modify pop sizes. New sizes = size*N0 ) 
	 -en t i size_i  (Modify pop size of pop i.  New size of popi = size_i*N0 .)
	 -es t i proportion  (Split: pop i -> pop-i + pop-npop, npop increases by 1.
		 proportion is probability that each lineage stays in pop-i. (p, 1-p are admixt. proport.
		 Size of pop npop is set to N0 and alpha = 0.0 , size and alpha of pop i are unchanged.
	 -ej t i j   ( Join lineages in pop i and pop j into pop j
		  size, alpha and M are unchanged.
	  -f filename     ( Read command line arguments from file filename.)
 See msdoc.pdf for explanation of these parameters.
NO! at ../../prefersim_additionals/Traj_mssel_2.pl line 21.
 file format error.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.860.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
Second argument error. howmany <= 0. 
usage: mssel nsam howmany nanc nder selfilename selspot -r rho nsites [options] 
  Options: 
	 -t theta   (this option and/or the next must be used. Theta = 4*N0*u )
	 -s segsites   ( fixed number of segregating sites)
	 -T          (Output gene tree.)
	 -F minfreq     Output only sites with freq of minor allele >= minfreq.
	 -r rho nsites     (rho here is 4Nc)
		 -c f track_len   (f = ratio of conversion rate to rec rate. tracklen is mean length.) 
			 if rho = 0.,  f = 4*N0*g, with g the gene conversion rate.
	 -G alpha  ( N(t) = N0*exp(-alpha*t) .  alpha = -log(Np/Nr)/t
	 -I npop n1 n2 ... [mig_rate] (all elements of mig matrix set to mig_rate/(npop-1) 
		 -m i j m_ij    (i,j-th element of mig matrix set to m_ij.)
		 -ma m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
		 -n i size_i   (popi has size set to size_i*N0 
		 -g i alpha_i  (If used must appear after -M option.)
	   The following options modify parameters at the time 't' specified as the first argument:
	 -eG t alpha  (Modify growth rate of all pop's.)
	 -eg t i alpha_i  (Modify growth rate of pop i.) 
	 -eM t mig_rate   (Modify the mig matrix so all elements are mig_rate/(npop-1)
	 -em t i j m_ij    (i,j-th element of mig matrix set to m_ij at time t )
	 -ema t npop  m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
	 -eN t size  (Modify pop sizes. New sizes = size*N0 ) 
	 -en t i size_i  (Modify pop size of pop i.  New size of popi = size_i*N0 .)
	 -es t i proportion  (Split: pop i -> pop-i + pop-npop, npop increases by 1.
		 proportion is probability that each lineage stays in pop-i. (p, 1-p are admixt. proport.
		 Size of pop npop is set to N0 and alpha = 0.0 , size and alpha of pop i are unchanged.
	 -ej t i j   ( Join lineages in pop i and pop j into pop j
		  size, alpha and M are unchanged.
	  -f filename     ( Read command line arguments from file filename.)
 See msdoc.pdf for explanation of these parameters.
NO! at ../../prefersim_additionals/Traj_mssel_2.pl line 21.
 file format error.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.865.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
Second argument error. howmany <= 0. 
usage: mssel nsam howmany nanc nder selfilename selspot -r rho nsites [options] 
  Options: 
	 -t theta   (this option and/or the next must be used. Theta = 4*N0*u )
	 -s segsites   ( fixed number of segregating sites)
	 -T          (Output gene tree.)
	 -F minfreq     Output only sites with freq of minor allele >= minfreq.
	 -r rho nsites     (rho here is 4Nc)
		 -c f track_len   (f = ratio of conversion rate to rec rate. tracklen is mean length.) 
			 if rho = 0.,  f = 4*N0*g, with g the gene conversion rate.
	 -G alpha  ( N(t) = N0*exp(-alpha*t) .  alpha = -log(Np/Nr)/t
	 -I npop n1 n2 ... [mig_rate] (all elements of mig matrix set to mig_rate/(npop-1) 
		 -m i j m_ij    (i,j-th element of mig matrix set to m_ij.)
		 -ma m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
		 -n i size_i   (popi has size set to size_i*N0 
		 -g i alpha_i  (If used must appear after -M option.)
	   The following options modify parameters at the time 't' specified as the first argument:
	 -eG t alpha  (Modify growth rate of all pop's.)
	 -eg t i alpha_i  (Modify growth rate of pop i.) 
	 -eM t mig_rate   (Modify the mig matrix so all elements are mig_rate/(npop-1)
	 -em t i j m_ij    (i,j-th element of mig matrix set to m_ij at time t )
	 -ema t npop  m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
	 -eN t size  (Modify pop sizes. New sizes = size*N0 ) 
	 -en t i size_i  (Modify pop size of pop i.  New size of popi = size_i*N0 .)
	 -es t i proportion  (Split: pop i -> pop-i + pop-npop, npop increases by 1.
		 proportion is probability that each lineage stays in pop-i. (p, 1-p are admixt. proport.
		 Size of pop npop is set to N0 and alpha = 0.0 , size and alpha of pop i are unchanged.
	 -ej t i j   ( Join lineages in pop i and pop j into pop j
		  size, alpha and M are unchanged.
	  -f filename     ( Read command line arguments from file filename.)
 See msdoc.pdf for explanation of these parameters.
NO! at ../../prefersim_additionals/Traj_mssel_2.pl line 21.
 file format error.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.870.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
Second argument error. howmany <= 0. 
usage: mssel nsam howmany nanc nder selfilename selspot -r rho nsites [options] 
  Options: 
	 -t theta   (this option and/or the next must be used. Theta = 4*N0*u )
	 -s segsites   ( fixed number of segregating sites)
	 -T          (Output gene tree.)
	 -F minfreq     Output only sites with freq of minor allele >= minfreq.
	 -r rho nsites     (rho here is 4Nc)
		 -c f track_len   (f = ratio of conversion rate to rec rate. tracklen is mean length.) 
			 if rho = 0.,  f = 4*N0*g, with g the gene conversion rate.
	 -G alpha  ( N(t) = N0*exp(-alpha*t) .  alpha = -log(Np/Nr)/t
	 -I npop n1 n2 ... [mig_rate] (all elements of mig matrix set to mig_rate/(npop-1) 
		 -m i j m_ij    (i,j-th element of mig matrix set to m_ij.)
		 -ma m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
		 -n i size_i   (popi has size set to size_i*N0 
		 -g i alpha_i  (If used must appear after -M option.)
	   The following options modify parameters at the time 't' specified as the first argument:
	 -eG t alpha  (Modify growth rate of all pop's.)
	 -eg t i alpha_i  (Modify growth rate of pop i.) 
	 -eM t mig_rate   (Modify the mig matrix so all elements are mig_rate/(npop-1)
	 -em t i j m_ij    (i,j-th element of mig matrix set to m_ij at time t )
	 -ema t npop  m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
	 -eN t size  (Modify pop sizes. New sizes = size*N0 ) 
	 -en t i size_i  (Modify pop size of pop i.  New size of popi = size_i*N0 .)
	 -es t i proportion  (Split: pop i -> pop-i + pop-npop, npop increases by 1.
		 proportion is probability that each lineage stays in pop-i. (p, 1-p are admixt. proport.
		 Size of pop npop is set to N0 and alpha = 0.0 , size and alpha of pop i are unchanged.
	 -ej t i j   ( Join lineages in pop i and pop j into pop j
		  size, alpha and M are unchanged.
	  -f filename     ( Read command line arguments from file filename.)
 See msdoc.pdf for explanation of these parameters.
NO! at ../../prefersim_additionals/Traj_mssel_2.pl line 21.
 file format error.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.875.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
Second argument error. howmany <= 0. 
usage: mssel nsam howmany nanc nder selfilename selspot -r rho nsites [options] 
  Options: 
	 -t theta   (this option and/or the next must be used. Theta = 4*N0*u )
	 -s segsites   ( fixed number of segregating sites)
	 -T          (Output gene tree.)
	 -F minfreq     Output only sites with freq of minor allele >= minfreq.
	 -r rho nsites     (rho here is 4Nc)
		 -c f track_len   (f = ratio of conversion rate to rec rate. tracklen is mean length.) 
			 if rho = 0.,  f = 4*N0*g, with g the gene conversion rate.
	 -G alpha  ( N(t) = N0*exp(-alpha*t) .  alpha = -log(Np/Nr)/t
	 -I npop n1 n2 ... [mig_rate] (all elements of mig matrix set to mig_rate/(npop-1) 
		 -m i j m_ij    (i,j-th element of mig matrix set to m_ij.)
		 -ma m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
		 -n i size_i   (popi has size set to size_i*N0 
		 -g i alpha_i  (If used must appear after -M option.)
	   The following options modify parameters at the time 't' specified as the first argument:
	 -eG t alpha  (Modify growth rate of all pop's.)
	 -eg t i alpha_i  (Modify growth rate of pop i.) 
	 -eM t mig_rate   (Modify the mig matrix so all elements are mig_rate/(npop-1)
	 -em t i j m_ij    (i,j-th element of mig matrix set to m_ij at time t )
	 -ema t npop  m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
	 -eN t size  (Modify pop sizes. New sizes = size*N0 ) 
	 -en t i size_i  (Modify pop size of pop i.  New size of popi = size_i*N0 .)
	 -es t i proportion  (Split: pop i -> pop-i + pop-npop, npop increases by 1.
		 proportion is probability that each lineage stays in pop-i. (p, 1-p are admixt. proport.
		 Size of pop npop is set to N0 and alpha = 0.0 , size and alpha of pop i are unchanged.
	 -ej t i j   ( Join lineages in pop i and pop j into pop j
		  size, alpha and M are unchanged.
	  -f filename     ( Read command line arguments from file filename.)
 See msdoc.pdf for explanation of these parameters.
NO! at ../../prefersim_additionals/Traj_mssel_2.pl line 21.
 file format error.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.880.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
Second argument error. howmany <= 0. 
usage: mssel nsam howmany nanc nder selfilename selspot -r rho nsites [options] 
  Options: 
	 -t theta   (this option and/or the next must be used. Theta = 4*N0*u )
	 -s segsites   ( fixed number of segregating sites)
	 -T          (Output gene tree.)
	 -F minfreq     Output only sites with freq of minor allele >= minfreq.
	 -r rho nsites     (rho here is 4Nc)
		 -c f track_len   (f = ratio of conversion rate to rec rate. tracklen is mean length.) 
			 if rho = 0.,  f = 4*N0*g, with g the gene conversion rate.
	 -G alpha  ( N(t) = N0*exp(-alpha*t) .  alpha = -log(Np/Nr)/t
	 -I npop n1 n2 ... [mig_rate] (all elements of mig matrix set to mig_rate/(npop-1) 
		 -m i j m_ij    (i,j-th element of mig matrix set to m_ij.)
		 -ma m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
		 -n i size_i   (popi has size set to size_i*N0 
		 -g i alpha_i  (If used must appear after -M option.)
	   The following options modify parameters at the time 't' specified as the first argument:
	 -eG t alpha  (Modify growth rate of all pop's.)
	 -eg t i alpha_i  (Modify growth rate of pop i.) 
	 -eM t mig_rate   (Modify the mig matrix so all elements are mig_rate/(npop-1)
	 -em t i j m_ij    (i,j-th element of mig matrix set to m_ij at time t )
	 -ema t npop  m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
	 -eN t size  (Modify pop sizes. New sizes = size*N0 ) 
	 -en t i size_i  (Modify pop size of pop i.  New size of popi = size_i*N0 .)
	 -es t i proportion  (Split: pop i -> pop-i + pop-npop, npop increases by 1.
		 proportion is probability that each lineage stays in pop-i. (p, 1-p are admixt. proport.
		 Size of pop npop is set to N0 and alpha = 0.0 , size and alpha of pop i are unchanged.
	 -ej t i j   ( Join lineages in pop i and pop j into pop j
		  size, alpha and M are unchanged.
	  -f filename     ( Read command line arguments from file filename.)
 See msdoc.pdf for explanation of these parameters.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.885.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
NO! at ../../prefersim_additionals/Traj_mssel_2.pl line 21.
 file format error.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.890.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
Second argument error. howmany <= 0. 
usage: mssel nsam howmany nanc nder selfilename selspot -r rho nsites [options] 
  Options: 
	 -t theta   (this option and/or the next must be used. Theta = 4*N0*u )
	 -s segsites   ( fixed number of segregating sites)
	 -T          (Output gene tree.)
	 -F minfreq     Output only sites with freq of minor allele >= minfreq.
	 -r rho nsites     (rho here is 4Nc)
		 -c f track_len   (f = ratio of conversion rate to rec rate. tracklen is mean length.) 
			 if rho = 0.,  f = 4*N0*g, with g the gene conversion rate.
	 -G alpha  ( N(t) = N0*exp(-alpha*t) .  alpha = -log(Np/Nr)/t
	 -I npop n1 n2 ... [mig_rate] (all elements of mig matrix set to mig_rate/(npop-1) 
		 -m i j m_ij    (i,j-th element of mig matrix set to m_ij.)
		 -ma m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
		 -n i size_i   (popi has size set to size_i*N0 
		 -g i alpha_i  (If used must appear after -M option.)
	   The following options modify parameters at the time 't' specified as the first argument:
	 -eG t alpha  (Modify growth rate of all pop's.)
	 -eg t i alpha_i  (Modify growth rate of pop i.) 
	 -eM t mig_rate   (Modify the mig matrix so all elements are mig_rate/(npop-1)
	 -em t i j m_ij    (i,j-th element of mig matrix set to m_ij at time t )
	 -ema t npop  m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
	 -eN t size  (Modify pop sizes. New sizes = size*N0 ) 
	 -en t i size_i  (Modify pop size of pop i.  New size of popi = size_i*N0 .)
	 -es t i proportion  (Split: pop i -> pop-i + pop-npop, npop increases by 1.
		 proportion is probability that each lineage stays in pop-i. (p, 1-p are admixt. proport.
		 Size of pop npop is set to N0 and alpha = 0.0 , size and alpha of pop i are unchanged.
	 -ej t i j   ( Join lineages in pop i and pop j into pop j
		  size, alpha and M are unchanged.
	  -f filename     ( Read command line arguments from file filename.)
 See msdoc.pdf for explanation of these parameters.
NO! at ../../prefersim_additionals/Traj_mssel_2.pl line 21.
 file format error.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.895.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
Second argument error. howmany <= 0. 
usage: mssel nsam howmany nanc nder selfilename selspot -r rho nsites [options] 
  Options: 
	 -t theta   (this option and/or the next must be used. Theta = 4*N0*u )
	 -s segsites   ( fixed number of segregating sites)
	 -T          (Output gene tree.)
	 -F minfreq     Output only sites with freq of minor allele >= minfreq.
	 -r rho nsites     (rho here is 4Nc)
		 -c f track_len   (f = ratio of conversion rate to rec rate. tracklen is mean length.) 
			 if rho = 0.,  f = 4*N0*g, with g the gene conversion rate.
	 -G alpha  ( N(t) = N0*exp(-alpha*t) .  alpha = -log(Np/Nr)/t
	 -I npop n1 n2 ... [mig_rate] (all elements of mig matrix set to mig_rate/(npop-1) 
		 -m i j m_ij    (i,j-th element of mig matrix set to m_ij.)
		 -ma m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
		 -n i size_i   (popi has size set to size_i*N0 
		 -g i alpha_i  (If used must appear after -M option.)
	   The following options modify parameters at the time 't' specified as the first argument:
	 -eG t alpha  (Modify growth rate of all pop's.)
	 -eg t i alpha_i  (Modify growth rate of pop i.) 
	 -eM t mig_rate   (Modify the mig matrix so all elements are mig_rate/(npop-1)
	 -em t i j m_ij    (i,j-th element of mig matrix set to m_ij at time t )
	 -ema t npop  m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
	 -eN t size  (Modify pop sizes. New sizes = size*N0 ) 
	 -en t i size_i  (Modify pop size of pop i.  New size of popi = size_i*N0 .)
	 -es t i proportion  (Split: pop i -> pop-i + pop-npop, npop increases by 1.
		 proportion is probability that each lineage stays in pop-i. (p, 1-p are admixt. proport.
		 Size of pop npop is set to N0 and alpha = 0.0 , size and alpha of pop i are unchanged.
	 -ej t i j   ( Join lineages in pop i and pop j into pop j
		  size, alpha and M are unchanged.
	  -f filename     ( Read command line arguments from file filename.)
 See msdoc.pdf for explanation of these parameters.
NO! at ../../prefersim_additionals/Traj_mssel_2.pl line 21.
 file format error.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.900.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
Second argument error. howmany <= 0. 
usage: mssel nsam howmany nanc nder selfilename selspot -r rho nsites [options] 
  Options: 
	 -t theta   (this option and/or the next must be used. Theta = 4*N0*u )
	 -s segsites   ( fixed number of segregating sites)
	 -T          (Output gene tree.)
	 -F minfreq     Output only sites with freq of minor allele >= minfreq.
	 -r rho nsites     (rho here is 4Nc)
		 -c f track_len   (f = ratio of conversion rate to rec rate. tracklen is mean length.) 
			 if rho = 0.,  f = 4*N0*g, with g the gene conversion rate.
	 -G alpha  ( N(t) = N0*exp(-alpha*t) .  alpha = -log(Np/Nr)/t
	 -I npop n1 n2 ... [mig_rate] (all elements of mig matrix set to mig_rate/(npop-1) 
		 -m i j m_ij    (i,j-th element of mig matrix set to m_ij.)
		 -ma m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
		 -n i size_i   (popi has size set to size_i*N0 
		 -g i alpha_i  (If used must appear after -M option.)
	   The following options modify parameters at the time 't' specified as the first argument:
	 -eG t alpha  (Modify growth rate of all pop's.)
	 -eg t i alpha_i  (Modify growth rate of pop i.) 
	 -eM t mig_rate   (Modify the mig matrix so all elements are mig_rate/(npop-1)
	 -em t i j m_ij    (i,j-th element of mig matrix set to m_ij at time t )
	 -ema t npop  m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
	 -eN t size  (Modify pop sizes. New sizes = size*N0 ) 
	 -en t i size_i  (Modify pop size of pop i.  New size of popi = size_i*N0 .)
	 -es t i proportion  (Split: pop i -> pop-i + pop-npop, npop increases by 1.
		 proportion is probability that each lineage stays in pop-i. (p, 1-p are admixt. proport.
		 Size of pop npop is set to N0 and alpha = 0.0 , size and alpha of pop i are unchanged.
	 -ej t i j   ( Join lineages in pop i and pop j into pop j
		  size, alpha and M are unchanged.
	  -f filename     ( Read command line arguments from file filename.)
 See msdoc.pdf for explanation of these parameters.
NO! at ../../prefersim_additionals/Traj_mssel_2.pl line 21.
 file format error.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.905.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
Second argument error. howmany <= 0. 
usage: mssel nsam howmany nanc nder selfilename selspot -r rho nsites [options] 
  Options: 
	 -t theta   (this option and/or the next must be used. Theta = 4*N0*u )
	 -s segsites   ( fixed number of segregating sites)
	 -T          (Output gene tree.)
	 -F minfreq     Output only sites with freq of minor allele >= minfreq.
	 -r rho nsites     (rho here is 4Nc)
		 -c f track_len   (f = ratio of conversion rate to rec rate. tracklen is mean length.) 
			 if rho = 0.,  f = 4*N0*g, with g the gene conversion rate.
	 -G alpha  ( N(t) = N0*exp(-alpha*t) .  alpha = -log(Np/Nr)/t
	 -I npop n1 n2 ... [mig_rate] (all elements of mig matrix set to mig_rate/(npop-1) 
		 -m i j m_ij    (i,j-th element of mig matrix set to m_ij.)
		 -ma m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
		 -n i size_i   (popi has size set to size_i*N0 
		 -g i alpha_i  (If used must appear after -M option.)
	   The following options modify parameters at the time 't' specified as the first argument:
	 -eG t alpha  (Modify growth rate of all pop's.)
	 -eg t i alpha_i  (Modify growth rate of pop i.) 
	 -eM t mig_rate   (Modify the mig matrix so all elements are mig_rate/(npop-1)
	 -em t i j m_ij    (i,j-th element of mig matrix set to m_ij at time t )
	 -ema t npop  m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
	 -eN t size  (Modify pop sizes. New sizes = size*N0 ) 
	 -en t i size_i  (Modify pop size of pop i.  New size of popi = size_i*N0 .)
	 -es t i proportion  (Split: pop i -> pop-i + pop-npop, npop increases by 1.
		 proportion is probability that each lineage stays in pop-i. (p, 1-p are admixt. proport.
		 Size of pop npop is set to N0 and alpha = 0.0 , size and alpha of pop i are unchanged.
	 -ej t i j   ( Join lineages in pop i and pop j into pop j
		  size, alpha and M are unchanged.
	  -f filename     ( Read command line arguments from file filename.)
 See msdoc.pdf for explanation of these parameters.
NO! at ../../prefersim_additionals/Traj_mssel_2.pl line 21.
 file format error.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.910.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
Second argument error. howmany <= 0. 
usage: mssel nsam howmany nanc nder selfilename selspot -r rho nsites [options] 
  Options: 
	 -t theta   (this option and/or the next must be used. Theta = 4*N0*u )
	 -s segsites   ( fixed number of segregating sites)
	 -T          (Output gene tree.)
	 -F minfreq     Output only sites with freq of minor allele >= minfreq.
	 -r rho nsites     (rho here is 4Nc)
		 -c f track_len   (f = ratio of conversion rate to rec rate. tracklen is mean length.) 
			 if rho = 0.,  f = 4*N0*g, with g the gene conversion rate.
	 -G alpha  ( N(t) = N0*exp(-alpha*t) .  alpha = -log(Np/Nr)/t
	 -I npop n1 n2 ... [mig_rate] (all elements of mig matrix set to mig_rate/(npop-1) 
		 -m i j m_ij    (i,j-th element of mig matrix set to m_ij.)
		 -ma m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
		 -n i size_i   (popi has size set to size_i*N0 
		 -g i alpha_i  (If used must appear after -M option.)
	   The following options modify parameters at the time 't' specified as the first argument:
	 -eG t alpha  (Modify growth rate of all pop's.)
	 -eg t i alpha_i  (Modify growth rate of pop i.) 
	 -eM t mig_rate   (Modify the mig matrix so all elements are mig_rate/(npop-1)
	 -em t i j m_ij    (i,j-th element of mig matrix set to m_ij at time t )
	 -ema t npop  m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
	 -eN t size  (Modify pop sizes. New sizes = size*N0 ) 
	 -en t i size_i  (Modify pop size of pop i.  New size of popi = size_i*N0 .)
	 -es t i proportion  (Split: pop i -> pop-i + pop-npop, npop increases by 1.
		 proportion is probability that each lineage stays in pop-i. (p, 1-p are admixt. proport.
		 Size of pop npop is set to N0 and alpha = 0.0 , size and alpha of pop i are unchanged.
	 -ej t i j   ( Join lineages in pop i and pop j into pop j
		  size, alpha and M are unchanged.
	  -f filename     ( Read command line arguments from file filename.)
 See msdoc.pdf for explanation of these parameters.
NO! at ../../prefersim_additionals/Traj_mssel_2.pl line 21.
 file format error.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.915.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
Second argument error. howmany <= 0. 
usage: mssel nsam howmany nanc nder selfilename selspot -r rho nsites [options] 
  Options: 
	 -t theta   (this option and/or the next must be used. Theta = 4*N0*u )
	 -s segsites   ( fixed number of segregating sites)
	 -T          (Output gene tree.)
	 -F minfreq     Output only sites with freq of minor allele >= minfreq.
	 -r rho nsites     (rho here is 4Nc)
		 -c f track_len   (f = ratio of conversion rate to rec rate. tracklen is mean length.) 
			 if rho = 0.,  f = 4*N0*g, with g the gene conversion rate.
	 -G alpha  ( N(t) = N0*exp(-alpha*t) .  alpha = -log(Np/Nr)/t
	 -I npop n1 n2 ... [mig_rate] (all elements of mig matrix set to mig_rate/(npop-1) 
		 -m i j m_ij    (i,j-th element of mig matrix set to m_ij.)
		 -ma m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
		 -n i size_i   (popi has size set to size_i*N0 
		 -g i alpha_i  (If used must appear after -M option.)
	   The following options modify parameters at the time 't' specified as the first argument:
	 -eG t alpha  (Modify growth rate of all pop's.)
	 -eg t i alpha_i  (Modify growth rate of pop i.) 
	 -eM t mig_rate   (Modify the mig matrix so all elements are mig_rate/(npop-1)
	 -em t i j m_ij    (i,j-th element of mig matrix set to m_ij at time t )
	 -ema t npop  m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
	 -eN t size  (Modify pop sizes. New sizes = size*N0 ) 
	 -en t i size_i  (Modify pop size of pop i.  New size of popi = size_i*N0 .)
	 -es t i proportion  (Split: pop i -> pop-i + pop-npop, npop increases by 1.
		 proportion is probability that each lineage stays in pop-i. (p, 1-p are admixt. proport.
		 Size of pop npop is set to N0 and alpha = 0.0 , size and alpha of pop i are unchanged.
	 -ej t i j   ( Join lineages in pop i and pop j into pop j
		  size, alpha and M are unchanged.
	  -f filename     ( Read command line arguments from file filename.)
 See msdoc.pdf for explanation of these parameters.
NO! at ../../prefersim_additionals/Traj_mssel_2.pl line 21.
 file format error.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.920.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
Second argument error. howmany <= 0. 
usage: mssel nsam howmany nanc nder selfilename selspot -r rho nsites [options] 
  Options: 
	 -t theta   (this option and/or the next must be used. Theta = 4*N0*u )
	 -s segsites   ( fixed number of segregating sites)
	 -T          (Output gene tree.)
	 -F minfreq     Output only sites with freq of minor allele >= minfreq.
	 -r rho nsites     (rho here is 4Nc)
		 -c f track_len   (f = ratio of conversion rate to rec rate. tracklen is mean length.) 
			 if rho = 0.,  f = 4*N0*g, with g the gene conversion rate.
	 -G alpha  ( N(t) = N0*exp(-alpha*t) .  alpha = -log(Np/Nr)/t
	 -I npop n1 n2 ... [mig_rate] (all elements of mig matrix set to mig_rate/(npop-1) 
		 -m i j m_ij    (i,j-th element of mig matrix set to m_ij.)
		 -ma m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
		 -n i size_i   (popi has size set to size_i*N0 
		 -g i alpha_i  (If used must appear after -M option.)
	   The following options modify parameters at the time 't' specified as the first argument:
	 -eG t alpha  (Modify growth rate of all pop's.)
	 -eg t i alpha_i  (Modify growth rate of pop i.) 
	 -eM t mig_rate   (Modify the mig matrix so all elements are mig_rate/(npop-1)
	 -em t i j m_ij    (i,j-th element of mig matrix set to m_ij at time t )
	 -ema t npop  m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
	 -eN t size  (Modify pop sizes. New sizes = size*N0 ) 
	 -en t i size_i  (Modify pop size of pop i.  New size of popi = size_i*N0 .)
	 -es t i proportion  (Split: pop i -> pop-i + pop-npop, npop increases by 1.
		 proportion is probability that each lineage stays in pop-i. (p, 1-p are admixt. proport.
		 Size of pop npop is set to N0 and alpha = 0.0 , size and alpha of pop i are unchanged.
	 -ej t i j   ( Join lineages in pop i and pop j into pop j
		  size, alpha and M are unchanged.
	  -f filename     ( Read command line arguments from file filename.)
 See msdoc.pdf for explanation of these parameters.
NO! at ../../prefersim_additionals/Traj_mssel_2.pl line 21.
 file format error.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.925.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
Second argument error. howmany <= 0. 
usage: mssel nsam howmany nanc nder selfilename selspot -r rho nsites [options] 
  Options: 
	 -t theta   (this option and/or the next must be used. Theta = 4*N0*u )
	 -s segsites   ( fixed number of segregating sites)
	 -T          (Output gene tree.)
	 -F minfreq     Output only sites with freq of minor allele >= minfreq.
	 -r rho nsites     (rho here is 4Nc)
		 -c f track_len   (f = ratio of conversion rate to rec rate. tracklen is mean length.) 
			 if rho = 0.,  f = 4*N0*g, with g the gene conversion rate.
	 -G alpha  ( N(t) = N0*exp(-alpha*t) .  alpha = -log(Np/Nr)/t
	 -I npop n1 n2 ... [mig_rate] (all elements of mig matrix set to mig_rate/(npop-1) 
		 -m i j m_ij    (i,j-th element of mig matrix set to m_ij.)
		 -ma m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
		 -n i size_i   (popi has size set to size_i*N0 
		 -g i alpha_i  (If used must appear after -M option.)
	   The following options modify parameters at the time 't' specified as the first argument:
	 -eG t alpha  (Modify growth rate of all pop's.)
	 -eg t i alpha_i  (Modify growth rate of pop i.) 
	 -eM t mig_rate   (Modify the mig matrix so all elements are mig_rate/(npop-1)
	 -em t i j m_ij    (i,j-th element of mig matrix set to m_ij at time t )
	 -ema t npop  m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
	 -eN t size  (Modify pop sizes. New sizes = size*N0 ) 
	 -en t i size_i  (Modify pop size of pop i.  New size of popi = size_i*N0 .)
	 -es t i proportion  (Split: pop i -> pop-i + pop-npop, npop increases by 1.
		 proportion is probability that each lineage stays in pop-i. (p, 1-p are admixt. proport.
		 Size of pop npop is set to N0 and alpha = 0.0 , size and alpha of pop i are unchanged.
	 -ej t i j   ( Join lineages in pop i and pop j into pop j
		  size, alpha and M are unchanged.
	  -f filename     ( Read command line arguments from file filename.)
 See msdoc.pdf for explanation of these parameters.
NO! at ../../prefersim_additionals/Traj_mssel_2.pl line 21.
 file format error.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.930.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
Second argument error. howmany <= 0. 
usage: mssel nsam howmany nanc nder selfilename selspot -r rho nsites [options] 
  Options: 
	 -t theta   (this option and/or the next must be used. Theta = 4*N0*u )
	 -s segsites   ( fixed number of segregating sites)
	 -T          (Output gene tree.)
	 -F minfreq     Output only sites with freq of minor allele >= minfreq.
	 -r rho nsites     (rho here is 4Nc)
		 -c f track_len   (f = ratio of conversion rate to rec rate. tracklen is mean length.) 
			 if rho = 0.,  f = 4*N0*g, with g the gene conversion rate.
	 -G alpha  ( N(t) = N0*exp(-alpha*t) .  alpha = -log(Np/Nr)/t
	 -I npop n1 n2 ... [mig_rate] (all elements of mig matrix set to mig_rate/(npop-1) 
		 -m i j m_ij    (i,j-th element of mig matrix set to m_ij.)
		 -ma m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
		 -n i size_i   (popi has size set to size_i*N0 
		 -g i alpha_i  (If used must appear after -M option.)
	   The following options modify parameters at the time 't' specified as the first argument:
	 -eG t alpha  (Modify growth rate of all pop's.)
	 -eg t i alpha_i  (Modify growth rate of pop i.) 
	 -eM t mig_rate   (Modify the mig matrix so all elements are mig_rate/(npop-1)
	 -em t i j m_ij    (i,j-th element of mig matrix set to m_ij at time t )
	 -ema t npop  m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
	 -eN t size  (Modify pop sizes. New sizes = size*N0 ) 
	 -en t i size_i  (Modify pop size of pop i.  New size of popi = size_i*N0 .)
	 -es t i proportion  (Split: pop i -> pop-i + pop-npop, npop increases by 1.
		 proportion is probability that each lineage stays in pop-i. (p, 1-p are admixt. proport.
		 Size of pop npop is set to N0 and alpha = 0.0 , size and alpha of pop i are unchanged.
	 -ej t i j   ( Join lineages in pop i and pop j into pop j
		  size, alpha and M are unchanged.
	  -f filename     ( Read command line arguments from file filename.)
 See msdoc.pdf for explanation of these parameters.
NO! at ../../prefersim_additionals/Traj_mssel_2.pl line 21.
 file format error.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.935.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
Second argument error. howmany <= 0. 
usage: mssel nsam howmany nanc nder selfilename selspot -r rho nsites [options] 
  Options: 
	 -t theta   (this option and/or the next must be used. Theta = 4*N0*u )
	 -s segsites   ( fixed number of segregating sites)
	 -T          (Output gene tree.)
	 -F minfreq     Output only sites with freq of minor allele >= minfreq.
	 -r rho nsites     (rho here is 4Nc)
		 -c f track_len   (f = ratio of conversion rate to rec rate. tracklen is mean length.) 
			 if rho = 0.,  f = 4*N0*g, with g the gene conversion rate.
	 -G alpha  ( N(t) = N0*exp(-alpha*t) .  alpha = -log(Np/Nr)/t
	 -I npop n1 n2 ... [mig_rate] (all elements of mig matrix set to mig_rate/(npop-1) 
		 -m i j m_ij    (i,j-th element of mig matrix set to m_ij.)
		 -ma m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
		 -n i size_i   (popi has size set to size_i*N0 
		 -g i alpha_i  (If used must appear after -M option.)
	   The following options modify parameters at the time 't' specified as the first argument:
	 -eG t alpha  (Modify growth rate of all pop's.)
	 -eg t i alpha_i  (Modify growth rate of pop i.) 
	 -eM t mig_rate   (Modify the mig matrix so all elements are mig_rate/(npop-1)
	 -em t i j m_ij    (i,j-th element of mig matrix set to m_ij at time t )
	 -ema t npop  m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
	 -eN t size  (Modify pop sizes. New sizes = size*N0 ) 
	 -en t i size_i  (Modify pop size of pop i.  New size of popi = size_i*N0 .)
	 -es t i proportion  (Split: pop i -> pop-i + pop-npop, npop increases by 1.
		 proportion is probability that each lineage stays in pop-i. (p, 1-p are admixt. proport.
		 Size of pop npop is set to N0 and alpha = 0.0 , size and alpha of pop i are unchanged.
	 -ej t i j   ( Join lineages in pop i and pop j into pop j
		  size, alpha and M are unchanged.
	  -f filename     ( Read command line arguments from file filename.)
 See msdoc.pdf for explanation of these parameters.
NO! at ../../prefersim_additionals/Traj_mssel_2.pl line 21.
 file format error.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.940.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
Second argument error. howmany <= 0. 
usage: mssel nsam howmany nanc nder selfilename selspot -r rho nsites [options] 
  Options: 
	 -t theta   (this option and/or the next must be used. Theta = 4*N0*u )
	 -s segsites   ( fixed number of segregating sites)
	 -T          (Output gene tree.)
	 -F minfreq     Output only sites with freq of minor allele >= minfreq.
	 -r rho nsites     (rho here is 4Nc)
		 -c f track_len   (f = ratio of conversion rate to rec rate. tracklen is mean length.) 
			 if rho = 0.,  f = 4*N0*g, with g the gene conversion rate.
	 -G alpha  ( N(t) = N0*exp(-alpha*t) .  alpha = -log(Np/Nr)/t
	 -I npop n1 n2 ... [mig_rate] (all elements of mig matrix set to mig_rate/(npop-1) 
		 -m i j m_ij    (i,j-th element of mig matrix set to m_ij.)
		 -ma m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
		 -n i size_i   (popi has size set to size_i*N0 
		 -g i alpha_i  (If used must appear after -M option.)
	   The following options modify parameters at the time 't' specified as the first argument:
	 -eG t alpha  (Modify growth rate of all pop's.)
	 -eg t i alpha_i  (Modify growth rate of pop i.) 
	 -eM t mig_rate   (Modify the mig matrix so all elements are mig_rate/(npop-1)
	 -em t i j m_ij    (i,j-th element of mig matrix set to m_ij at time t )
	 -ema t npop  m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
	 -eN t size  (Modify pop sizes. New sizes = size*N0 ) 
	 -en t i size_i  (Modify pop size of pop i.  New size of popi = size_i*N0 .)
	 -es t i proportion  (Split: pop i -> pop-i + pop-npop, npop increases by 1.
		 proportion is probability that each lineage stays in pop-i. (p, 1-p are admixt. proport.
		 Size of pop npop is set to N0 and alpha = 0.0 , size and alpha of pop i are unchanged.
	 -ej t i j   ( Join lineages in pop i and pop j into pop j
		  size, alpha and M are unchanged.
	  -f filename     ( Read command line arguments from file filename.)
 See msdoc.pdf for explanation of these parameters.
NO! at ../../prefersim_additionals/Traj_mssel_2.pl line 21.
 file format error.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.945.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
Second argument error. howmany <= 0. 
usage: mssel nsam howmany nanc nder selfilename selspot -r rho nsites [options] 
  Options: 
	 -t theta   (this option and/or the next must be used. Theta = 4*N0*u )
	 -s segsites   ( fixed number of segregating sites)
	 -T          (Output gene tree.)
	 -F minfreq     Output only sites with freq of minor allele >= minfreq.
	 -r rho nsites     (rho here is 4Nc)
		 -c f track_len   (f = ratio of conversion rate to rec rate. tracklen is mean length.) 
			 if rho = 0.,  f = 4*N0*g, with g the gene conversion rate.
	 -G alpha  ( N(t) = N0*exp(-alpha*t) .  alpha = -log(Np/Nr)/t
	 -I npop n1 n2 ... [mig_rate] (all elements of mig matrix set to mig_rate/(npop-1) 
		 -m i j m_ij    (i,j-th element of mig matrix set to m_ij.)
		 -ma m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
		 -n i size_i   (popi has size set to size_i*N0 
		 -g i alpha_i  (If used must appear after -M option.)
	   The following options modify parameters at the time 't' specified as the first argument:
	 -eG t alpha  (Modify growth rate of all pop's.)
	 -eg t i alpha_i  (Modify growth rate of pop i.) 
	 -eM t mig_rate   (Modify the mig matrix so all elements are mig_rate/(npop-1)
	 -em t i j m_ij    (i,j-th element of mig matrix set to m_ij at time t )
	 -ema t npop  m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
	 -eN t size  (Modify pop sizes. New sizes = size*N0 ) 
	 -en t i size_i  (Modify pop size of pop i.  New size of popi = size_i*N0 .)
	 -es t i proportion  (Split: pop i -> pop-i + pop-npop, npop increases by 1.
		 proportion is probability that each lineage stays in pop-i. (p, 1-p are admixt. proport.
		 Size of pop npop is set to N0 and alpha = 0.0 , size and alpha of pop i are unchanged.
	 -ej t i j   ( Join lineages in pop i and pop j into pop j
		  size, alpha and M are unchanged.
	  -f filename     ( Read command line arguments from file filename.)
 See msdoc.pdf for explanation of these parameters.
NO! at ../../prefersim_additionals/Traj_mssel_2.pl line 21.
 file format error.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.950.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
Second argument error. howmany <= 0. 
usage: mssel nsam howmany nanc nder selfilename selspot -r rho nsites [options] 
  Options: 
	 -t theta   (this option and/or the next must be used. Theta = 4*N0*u )
	 -s segsites   ( fixed number of segregating sites)
	 -T          (Output gene tree.)
	 -F minfreq     Output only sites with freq of minor allele >= minfreq.
	 -r rho nsites     (rho here is 4Nc)
		 -c f track_len   (f = ratio of conversion rate to rec rate. tracklen is mean length.) 
			 if rho = 0.,  f = 4*N0*g, with g the gene conversion rate.
	 -G alpha  ( N(t) = N0*exp(-alpha*t) .  alpha = -log(Np/Nr)/t
	 -I npop n1 n2 ... [mig_rate] (all elements of mig matrix set to mig_rate/(npop-1) 
		 -m i j m_ij    (i,j-th element of mig matrix set to m_ij.)
		 -ma m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
		 -n i size_i   (popi has size set to size_i*N0 
		 -g i alpha_i  (If used must appear after -M option.)
	   The following options modify parameters at the time 't' specified as the first argument:
	 -eG t alpha  (Modify growth rate of all pop's.)
	 -eg t i alpha_i  (Modify growth rate of pop i.) 
	 -eM t mig_rate   (Modify the mig matrix so all elements are mig_rate/(npop-1)
	 -em t i j m_ij    (i,j-th element of mig matrix set to m_ij at time t )
	 -ema t npop  m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
	 -eN t size  (Modify pop sizes. New sizes = size*N0 ) 
	 -en t i size_i  (Modify pop size of pop i.  New size of popi = size_i*N0 .)
	 -es t i proportion  (Split: pop i -> pop-i + pop-npop, npop increases by 1.
		 proportion is probability that each lineage stays in pop-i. (p, 1-p are admixt. proport.
		 Size of pop npop is set to N0 and alpha = 0.0 , size and alpha of pop i are unchanged.
	 -ej t i j   ( Join lineages in pop i and pop j into pop j
		  size, alpha and M are unchanged.
	  -f filename     ( Read command line arguments from file filename.)
 See msdoc.pdf for explanation of these parameters.
NO! at ../../prefersim_additionals/Traj_mssel_2.pl line 21.
 file format error.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.955.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
Second argument error. howmany <= 0. 
usage: mssel nsam howmany nanc nder selfilename selspot -r rho nsites [options] 
  Options: 
	 -t theta   (this option and/or the next must be used. Theta = 4*N0*u )
	 -s segsites   ( fixed number of segregating sites)
	 -T          (Output gene tree.)
	 -F minfreq     Output only sites with freq of minor allele >= minfreq.
	 -r rho nsites     (rho here is 4Nc)
		 -c f track_len   (f = ratio of conversion rate to rec rate. tracklen is mean length.) 
			 if rho = 0.,  f = 4*N0*g, with g the gene conversion rate.
	 -G alpha  ( N(t) = N0*exp(-alpha*t) .  alpha = -log(Np/Nr)/t
	 -I npop n1 n2 ... [mig_rate] (all elements of mig matrix set to mig_rate/(npop-1) 
		 -m i j m_ij    (i,j-th element of mig matrix set to m_ij.)
		 -ma m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
		 -n i size_i   (popi has size set to size_i*N0 
		 -g i alpha_i  (If used must appear after -M option.)
	   The following options modify parameters at the time 't' specified as the first argument:
	 -eG t alpha  (Modify growth rate of all pop's.)
	 -eg t i alpha_i  (Modify growth rate of pop i.) 
	 -eM t mig_rate   (Modify the mig matrix so all elements are mig_rate/(npop-1)
	 -em t i j m_ij    (i,j-th element of mig matrix set to m_ij at time t )
	 -ema t npop  m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
	 -eN t size  (Modify pop sizes. New sizes = size*N0 ) 
	 -en t i size_i  (Modify pop size of pop i.  New size of popi = size_i*N0 .)
	 -es t i proportion  (Split: pop i -> pop-i + pop-npop, npop increases by 1.
		 proportion is probability that each lineage stays in pop-i. (p, 1-p are admixt. proport.
		 Size of pop npop is set to N0 and alpha = 0.0 , size and alpha of pop i are unchanged.
	 -ej t i j   ( Join lineages in pop i and pop j into pop j
		  size, alpha and M are unchanged.
	  -f filename     ( Read command line arguments from file filename.)
 See msdoc.pdf for explanation of these parameters.
NO! at ../../prefersim_additionals/Traj_mssel_2.pl line 21.
 file format error.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.960.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
Second argument error. howmany <= 0. 
usage: mssel nsam howmany nanc nder selfilename selspot -r rho nsites [options] 
  Options: 
	 -t theta   (this option and/or the next must be used. Theta = 4*N0*u )
	 -s segsites   ( fixed number of segregating sites)
	 -T          (Output gene tree.)
	 -F minfreq     Output only sites with freq of minor allele >= minfreq.
	 -r rho nsites     (rho here is 4Nc)
		 -c f track_len   (f = ratio of conversion rate to rec rate. tracklen is mean length.) 
			 if rho = 0.,  f = 4*N0*g, with g the gene conversion rate.
	 -G alpha  ( N(t) = N0*exp(-alpha*t) .  alpha = -log(Np/Nr)/t
	 -I npop n1 n2 ... [mig_rate] (all elements of mig matrix set to mig_rate/(npop-1) 
		 -m i j m_ij    (i,j-th element of mig matrix set to m_ij.)
		 -ma m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
		 -n i size_i   (popi has size set to size_i*N0 
		 -g i alpha_i  (If used must appear after -M option.)
	   The following options modify parameters at the time 't' specified as the first argument:
	 -eG t alpha  (Modify growth rate of all pop's.)
	 -eg t i alpha_i  (Modify growth rate of pop i.) 
	 -eM t mig_rate   (Modify the mig matrix so all elements are mig_rate/(npop-1)
	 -em t i j m_ij    (i,j-th element of mig matrix set to m_ij at time t )
	 -ema t npop  m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
	 -eN t size  (Modify pop sizes. New sizes = size*N0 ) 
	 -en t i size_i  (Modify pop size of pop i.  New size of popi = size_i*N0 .)
	 -es t i proportion  (Split: pop i -> pop-i + pop-npop, npop increases by 1.
		 proportion is probability that each lineage stays in pop-i. (p, 1-p are admixt. proport.
		 Size of pop npop is set to N0 and alpha = 0.0 , size and alpha of pop i are unchanged.
	 -ej t i j   ( Join lineages in pop i and pop j into pop j
		  size, alpha and M are unchanged.
	  -f filename     ( Read command line arguments from file filename.)
 See msdoc.pdf for explanation of these parameters.
NO! at ../../prefersim_additionals/Traj_mssel_2.pl line 21.
 file format error.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.965.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
Second argument error. howmany <= 0. 
usage: mssel nsam howmany nanc nder selfilename selspot -r rho nsites [options] 
  Options: 
	 -t theta   (this option and/or the next must be used. Theta = 4*N0*u )
	 -s segsites   ( fixed number of segregating sites)
	 -T          (Output gene tree.)
	 -F minfreq     Output only sites with freq of minor allele >= minfreq.
	 -r rho nsites     (rho here is 4Nc)
		 -c f track_len   (f = ratio of conversion rate to rec rate. tracklen is mean length.) 
			 if rho = 0.,  f = 4*N0*g, with g the gene conversion rate.
	 -G alpha  ( N(t) = N0*exp(-alpha*t) .  alpha = -log(Np/Nr)/t
	 -I npop n1 n2 ... [mig_rate] (all elements of mig matrix set to mig_rate/(npop-1) 
		 -m i j m_ij    (i,j-th element of mig matrix set to m_ij.)
		 -ma m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
		 -n i size_i   (popi has size set to size_i*N0 
		 -g i alpha_i  (If used must appear after -M option.)
	   The following options modify parameters at the time 't' specified as the first argument:
	 -eG t alpha  (Modify growth rate of all pop's.)
	 -eg t i alpha_i  (Modify growth rate of pop i.) 
	 -eM t mig_rate   (Modify the mig matrix so all elements are mig_rate/(npop-1)
	 -em t i j m_ij    (i,j-th element of mig matrix set to m_ij at time t )
	 -ema t npop  m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
	 -eN t size  (Modify pop sizes. New sizes = size*N0 ) 
	 -en t i size_i  (Modify pop size of pop i.  New size of popi = size_i*N0 .)
	 -es t i proportion  (Split: pop i -> pop-i + pop-npop, npop increases by 1.
		 proportion is probability that each lineage stays in pop-i. (p, 1-p are admixt. proport.
		 Size of pop npop is set to N0 and alpha = 0.0 , size and alpha of pop i are unchanged.
	 -ej t i j   ( Join lineages in pop i and pop j into pop j
		  size, alpha and M are unchanged.
	  -f filename     ( Read command line arguments from file filename.)
 See msdoc.pdf for explanation of these parameters.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.970.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
NO! at ../../prefersim_additionals/Traj_mssel_2.pl line 21.
 file format error.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.975.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
Second argument error. howmany <= 0. 
usage: mssel nsam howmany nanc nder selfilename selspot -r rho nsites [options] 
  Options: 
	 -t theta   (this option and/or the next must be used. Theta = 4*N0*u )
	 -s segsites   ( fixed number of segregating sites)
	 -T          (Output gene tree.)
	 -F minfreq     Output only sites with freq of minor allele >= minfreq.
	 -r rho nsites     (rho here is 4Nc)
		 -c f track_len   (f = ratio of conversion rate to rec rate. tracklen is mean length.) 
			 if rho = 0.,  f = 4*N0*g, with g the gene conversion rate.
	 -G alpha  ( N(t) = N0*exp(-alpha*t) .  alpha = -log(Np/Nr)/t
	 -I npop n1 n2 ... [mig_rate] (all elements of mig matrix set to mig_rate/(npop-1) 
		 -m i j m_ij    (i,j-th element of mig matrix set to m_ij.)
		 -ma m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
		 -n i size_i   (popi has size set to size_i*N0 
		 -g i alpha_i  (If used must appear after -M option.)
	   The following options modify parameters at the time 't' specified as the first argument:
	 -eG t alpha  (Modify growth rate of all pop's.)
	 -eg t i alpha_i  (Modify growth rate of pop i.) 
	 -eM t mig_rate   (Modify the mig matrix so all elements are mig_rate/(npop-1)
	 -em t i j m_ij    (i,j-th element of mig matrix set to m_ij at time t )
	 -ema t npop  m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
	 -eN t size  (Modify pop sizes. New sizes = size*N0 ) 
	 -en t i size_i  (Modify pop size of pop i.  New size of popi = size_i*N0 .)
	 -es t i proportion  (Split: pop i -> pop-i + pop-npop, npop increases by 1.
		 proportion is probability that each lineage stays in pop-i. (p, 1-p are admixt. proport.
		 Size of pop npop is set to N0 and alpha = 0.0 , size and alpha of pop i are unchanged.
	 -ej t i j   ( Join lineages in pop i and pop j into pop j
		  size, alpha and M are unchanged.
	  -f filename     ( Read command line arguments from file filename.)
 See msdoc.pdf for explanation of these parameters.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.980.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
NO! at ../../prefersim_additionals/Traj_mssel_2.pl line 21.
 file format error.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.985.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
Second argument error. howmany <= 0. 
usage: mssel nsam howmany nanc nder selfilename selspot -r rho nsites [options] 
  Options: 
	 -t theta   (this option and/or the next must be used. Theta = 4*N0*u )
	 -s segsites   ( fixed number of segregating sites)
	 -T          (Output gene tree.)
	 -F minfreq     Output only sites with freq of minor allele >= minfreq.
	 -r rho nsites     (rho here is 4Nc)
		 -c f track_len   (f = ratio of conversion rate to rec rate. tracklen is mean length.) 
			 if rho = 0.,  f = 4*N0*g, with g the gene conversion rate.
	 -G alpha  ( N(t) = N0*exp(-alpha*t) .  alpha = -log(Np/Nr)/t
	 -I npop n1 n2 ... [mig_rate] (all elements of mig matrix set to mig_rate/(npop-1) 
		 -m i j m_ij    (i,j-th element of mig matrix set to m_ij.)
		 -ma m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
		 -n i size_i   (popi has size set to size_i*N0 
		 -g i alpha_i  (If used must appear after -M option.)
	   The following options modify parameters at the time 't' specified as the first argument:
	 -eG t alpha  (Modify growth rate of all pop's.)
	 -eg t i alpha_i  (Modify growth rate of pop i.) 
	 -eM t mig_rate   (Modify the mig matrix so all elements are mig_rate/(npop-1)
	 -em t i j m_ij    (i,j-th element of mig matrix set to m_ij at time t )
	 -ema t npop  m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
	 -eN t size  (Modify pop sizes. New sizes = size*N0 ) 
	 -en t i size_i  (Modify pop size of pop i.  New size of popi = size_i*N0 .)
	 -es t i proportion  (Split: pop i -> pop-i + pop-npop, npop increases by 1.
		 proportion is probability that each lineage stays in pop-i. (p, 1-p are admixt. proport.
		 Size of pop npop is set to N0 and alpha = 0.0 , size and alpha of pop i are unchanged.
	 -ej t i j   ( Join lineages in pop i and pop j into pop j
		  size, alpha and M are unchanged.
	  -f filename     ( Read command line arguments from file filename.)
 See msdoc.pdf for explanation of these parameters.
NO! at ../../prefersim_additionals/Traj_mssel_2.pl line 21.
 file format error.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.990.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
Second argument error. howmany <= 0. 
usage: mssel nsam howmany nanc nder selfilename selspot -r rho nsites [options] 
  Options: 
	 -t theta   (this option and/or the next must be used. Theta = 4*N0*u )
	 -s segsites   ( fixed number of segregating sites)
	 -T          (Output gene tree.)
	 -F minfreq     Output only sites with freq of minor allele >= minfreq.
	 -r rho nsites     (rho here is 4Nc)
		 -c f track_len   (f = ratio of conversion rate to rec rate. tracklen is mean length.) 
			 if rho = 0.,  f = 4*N0*g, with g the gene conversion rate.
	 -G alpha  ( N(t) = N0*exp(-alpha*t) .  alpha = -log(Np/Nr)/t
	 -I npop n1 n2 ... [mig_rate] (all elements of mig matrix set to mig_rate/(npop-1) 
		 -m i j m_ij    (i,j-th element of mig matrix set to m_ij.)
		 -ma m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
		 -n i size_i   (popi has size set to size_i*N0 
		 -g i alpha_i  (If used must appear after -M option.)
	   The following options modify parameters at the time 't' specified as the first argument:
	 -eG t alpha  (Modify growth rate of all pop's.)
	 -eg t i alpha_i  (Modify growth rate of pop i.) 
	 -eM t mig_rate   (Modify the mig matrix so all elements are mig_rate/(npop-1)
	 -em t i j m_ij    (i,j-th element of mig matrix set to m_ij at time t )
	 -ema t npop  m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
	 -eN t size  (Modify pop sizes. New sizes = size*N0 ) 
	 -en t i size_i  (Modify pop size of pop i.  New size of popi = size_i*N0 .)
	 -es t i proportion  (Split: pop i -> pop-i + pop-npop, npop increases by 1.
		 proportion is probability that each lineage stays in pop-i. (p, 1-p are admixt. proport.
		 Size of pop npop is set to N0 and alpha = 0.0 , size and alpha of pop i are unchanged.
	 -ej t i j   ( Join lineages in pop i and pop j into pop j
		  size, alpha and M are unchanged.
	  -f filename     ( Read command line arguments from file filename.)
 See msdoc.pdf for explanation of these parameters.
NO! at ../../prefersim_additionals/Traj_mssel_2.pl line 21.
 file format error.
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226_0.995.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/seed_226/trees_ABCDemography_226.txt': No such file or directory
Second argument error. howmany <= 0. 
usage: mssel nsam howmany nanc nder selfilename selspot -r rho nsites [options] 
  Options: 
	 -t theta   (this option and/or the next must be used. Theta = 4*N0*u )
	 -s segsites   ( fixed number of segregating sites)
	 -T          (Output gene tree.)
	 -F minfreq     Output only sites with freq of minor allele >= minfreq.
	 -r rho nsites     (rho here is 4Nc)
		 -c f track_len   (f = ratio of conversion rate to rec rate. tracklen is mean length.) 
			 if rho = 0.,  f = 4*N0*g, with g the gene conversion rate.
	 -G alpha  ( N(t) = N0*exp(-alpha*t) .  alpha = -log(Np/Nr)/t
	 -I npop n1 n2 ... [mig_rate] (all elements of mig matrix set to mig_rate/(npop-1) 
		 -m i j m_ij    (i,j-th element of mig matrix set to m_ij.)
		 -ma m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
		 -n i size_i   (popi has size set to size_i*N0 
		 -g i alpha_i  (If used must appear after -M option.)
	   The following options modify parameters at the time 't' specified as the first argument:
	 -eG t alpha  (Modify growth rate of all pop's.)
	 -eg t i alpha_i  (Modify growth rate of pop i.) 
	 -eM t mig_rate   (Modify the mig matrix so all elements are mig_rate/(npop-1)
	 -em t i j m_ij    (i,j-th element of mig matrix set to m_ij at time t )
	 -ema t npop  m_11 m_12 m_13 m_21 m_22 m_23 ...(Assign values to elements of migration matrix.)
	 -eN t size  (Modify pop sizes. New sizes = size*N0 ) 
	 -en t i size_i  (Modify pop size of pop i.  New size of popi = size_i*N0 .)
	 -es t i proportion  (Split: pop i -> pop-i + pop-npop, npop increases by 1.
		 proportion is probability that each lineage stays in pop-i. (p, 1-p are admixt. proport.
		 Size of pop npop is set to N0 and alpha = 0.0 , size and alpha of pop i are unchanged.
	 -ej t i j   ( Join lineages in pop i and pop j into pop j
		  size, alpha and M are unchanged.
	  -f filename     ( Read command line arguments from file filename.)
 See msdoc.pdf for explanation of these parameters.
rm: cannot remove '../Data/Parameters/Output/Traj_226.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/Traj_226.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/Allele_226_freqs/ResampledTrajs226_0.995.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/Traj_226_.txt': No such file or directory
rm: cannot remove '../Data/Parameters/Output/matrices/tree_dump/tmp_file_226.txt': No such file or directory
