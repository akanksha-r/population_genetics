# This script will check the relation between coding and non-coding constraints of protein,             #
# Cut-off the the entries with coding and non-coding constrains and plot various relations between them #
# InputFile= file with overall entries                                                                  #
# CodingScoreLabel= Name of the field with coding constarins e.g.'pLI','RVIS','GERP'                    #
# nCscorelabel = Name of the field with non-coding constarins e.g.'Vg','eQTL','ncGERP','ncRVIS'         #
# targetcolumnLabel = Name of the protein dynamic which is desired e.g. 'hlf_life_II','kdeg','turn_over'#
# u_codingThr = Upper Cutoff value of coding constrain e.g. 0.9                                         #
# l_codingThr = Lower Cutoff value of coding constrain e.g. 0.1                                         #
# # codingThr = Cutoff vakue of coding constrain e.g. 0.9                                               #
# nc_upperthr = Upper Cutoff (Quantile) value of noncoding constrain e.g. 0.75                          #
# nc_lowerthr = Lower Cutoff (Quantile) value of noncoding constrain e.g. 0.25                          #
# Upper_quantLabel = Name of label for 'Upper Quantile'                                                 #
# Lower_quantLabel = Name of label for 'Lower Quantile'                                                 #
# targetcolumnName = Name of label for protein dynamics e.g.'Protein half life',                        #
# 'Protein degradation constant', Protein turn over'                                                    #

# Akanksha, Scripps, Dec 2018 # 


setwd("~/Documents/Scripps/e_pQTR/R/final")
source("graphs.R")

# My parameters #
InputFile='overall_file'
# InputFile='all_file'
CodingScoreLabel= 'pLI'
nCscorelabel = 'ncGERP'
targetcolumnLabel = 'Kdeg_5'
u_codingThr = 0.9
l_codingThr = 0.1
# codingThr = 0.9
nc_upperthr = 0.75
nc_lowerthr = 0.25
Upper_quantLabel = 'Upper Quantile'
Lower_quantLabel = 'Lower Quantile'
targetcolumnName = 'Protein degradation'

   
# graphs(overall_file, CodingScoreLabel, nCscorelabel, targetcolumnLabel,nc_upperthr,nc_lowerthr,
#            codingThr,Upper_quantLabel, Lower_quantLabel,targetcolumnName)
# 
# graphs_log(overall_file, CodingScoreLabel, nCscorelabel, targetcolumnLabel,nc_upperthr,nc_lowerthr,
#        codingThr,Upper_quantLabel, Lower_quantLabel,targetcolumnName)

# graphs_combine_1(overall_file, CodingScoreLabel, nCscorelabel, targetcolumnLabel,
#                              u_codingThr,l_codingThr, Upper_quantLabel, Lower_quantLabel, targetcolumnName)

graphs_combine(overall_file, CodingScoreLabel, nCscorelabel, targetcolumnLabel,nc_upperthr,nc_lowerthr,
                      u_codingThr,l_codingThr,Upper_quantLabel, Lower_quantLabel,targetcolumnName)


# end
# end


