#!/usr/bin/python
import sys,os

file1=sys.argv[1] ### File with protein fold change
#file2=sys.argv[2] ### 

AA=open(file1,'r')
#AB=open(file2,'w')


genes=AA.readlines()

#print "gene hlf_life PMID"
#print "gene Whole_turn_over PMID"
print "gene hlf_life PMID Kdeg"

for gene in genes:
  #gene_name=gene.split('\t')
  gene_name=gene.split('##')
  #gene_name0=gene_name[0]
  gene_name0=gene_name[1]
  gene_name1=gene_name0.split(';')
  #print gene_name[1], gene_name[2]
  for i in gene_name1:
  	if i != '':
   #print i,gene_name[1],gene_name[2]  
		print i,gene_name[3],gene_name[4],gene_name[7]
	else:
		break
AA.close()
#AB.close()

