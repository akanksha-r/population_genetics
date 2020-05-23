#!/usr/bin/perl

$file1=$ARGV[0]; ### file containing ENSEMBL id
$file2=$ARGV[1]; ### file containing half life
$file3=$ARGV[2]; ### output file

open (AA,"$file1");
open(AB,"$file2");
open(AC,">$file3");

<AB>; ## for skipping header

@ensembl=<AA>;
@protein=<AB>;

#print "@drug\n"; 
#print "@csv\n";
print AC "ENSEMBL_id\tGene_Name\tHalf_life\tPMID\n";


foreach $protein(@protein)
{
chomp($protein);
@protein1=split(/\t/,$protein);
$gene=$protein1[0];
foreach $ensembl(@ensembl)
{
chomp($ensembl);
@ensembl1=split(/\t/,$ensembl);

for($i=0;$i<@protein;$i++)
{
if($gene[$i] eq $ensembl1[0])
{
print AC "$gene[$i]\t$ensembl1[1]\t$$protein1[1]\t$protein1[2]\n";
}
else{};

}
}
}

close AA;
close AB;
close AC;


##### Akanksha