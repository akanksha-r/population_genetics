########### function to extract the protein dynamics after filer through coding constrains & Non coding constrains 
########## pLI_Vg_prot_dynamics - file with pLI,Vg,prot_dynamics file {"\t" separated}

protein_dynamics <- function(overall_file, Vg, pLI, quantile_upper,quantile_lower,pLI_cutoff){
quant_upper=quantile(Vg, na.rm=T, quantile_upper)
quant_lower=quantile(Vg,na.rm=T,quantile_lower)
subset_upper=subset(overall_file,Vg>quant_upper & pLI>pLI_cutoff,na.rm=T,select=hlf_Life_II)
subset_lower=subset(overall_file,Vg<quant_lower & pLI>pLI_cutoff,na.rm=T,select=hlf_Life_II)
return(subset_upper)
return(subset_lower)
}