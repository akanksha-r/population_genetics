#!/usr/bin/perl

$file1=$ARGV[0]; ### File with protein fold change
$file2=$ARGV[1]; ### File with afc units
$file3=$ARGV[2]; ### output file

open(AA,"$file1");
open(AB,"$file2");
open(AC,">$file3");

<AA>;
<AB>;

@protein=<AA>;
@afc=<AB>;

print AC "Gene_name\tProtein_hlf_life\taFC\tPMIDs\n";
foreach $protein(@protein)
{
chomp($protein);
@protein1=split(/\t/,$protein);
$gene=$protein1[0];
print"$gene\n";
foreach $afc(@afc)
{
chomp($afc);
@afc1=split(/\t/,$afc);
print "$gene ## $afc1[1]\n";
if($gene eq $afc1[1])
{
print AC "$gene\t$protein1[1]\t$afc1[30]\t$protein1[2]\n";
}


#for($i=0;$i<@protein;$i++)
#{
#print "gene=$gene[$i]\tafc1=$afc[1]\n";
#if($gene[$i] eq $afc[1])
#{
#print AC "$gene[$i]\t$protein1[1]\t$afc[30]\t$protein[2]\n";
#}
else{};

}
}


close AA;
close AB;
close AC;


### Akanksha