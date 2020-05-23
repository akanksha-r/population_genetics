#!/usr/bin/python
import sys,os

file1=sys.argv[1] ### File with t1/2
file2=sys.argv[2] ### File with ENSEMBL txt

AA=open(file1,'r')
AB=open(file2,'r')

genes=AA.readlines()
ensembls=AB.readlines()

#print "Gene_ID ENSEMBL_ID Hlf_life PMID"
#print "gene ENSEMBL_ID Whole_turn_over PMID"
#print "gene hlf_life PMID Kdeg"
print "gene ENSEMBL_ID kdeg_pc_28143407"

for gene in genes:
  gene=gene.strip()
  gene_name=gene.split(' ')
  #print("gene_name",gene_name[0])
  for ensembl in ensembls:
    ensembl=ensembl.strip()
    ensembl_name=ensembl.split('\t')
    #print("gene_name_ensembl",ensembl_name[3])
    #print("afc1",afc1[1])
    upper_1=gene_name[0].upper()
    ensembl_1=ensembl_name[3].upper()
    #print gene_name[0]
    #if gene_name[0] == ensembl_name[3]:
    if upper_1 == ensembl_1:
     #print gene_name[1]
     #print gene_name[0],ensembl_name[0],gene_name[1],gene_name[2],gene_name[3]
     print gene_name[0],ensembl_name[0],gene_name[1]
	 #return

AA.close()
AB.close()
#AC.close()
