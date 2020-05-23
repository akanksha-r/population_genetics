# population_genetics

R script for visualization of population genetics constants e.g. Protein dynamics ('hlf_life_II','kdeg','turn_over'), coding ('pLI','RVIS','GERP') and non-coding (Vg','eQTL','ncGERP','ncRVIS') score

- graphs.R - This R script and functions will provide the hisograms(upper & lower quantile), QQ-plot, p-value and boxplots

- Overallscript.R - Automated overall script for all type of graphs

- data_processing.R - function for intial data processing

- plot_function.R - function called for individual plots

Python script for data processing

- gene_map.py - mapping the genes with t1/2 (half life) as per the ENSEMBL genes

- comma_sep1.py - mapping the genes with t1/2 (half life), PubmedID and Kdeg 


Perl script for data preprocessing

- afc_extract.pl - extract the gene name, aFC, t1/2, and PMID information

- comma_sep.pl -  mapping the genes name with t1/2 (half life), PubmedID

- gene_id_map.pl - mapping the genes with t1/2 (half life) as per the ENSEMBL genes
