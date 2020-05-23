#!/usr/bin/perl

$file1=$ARGV[0]; ### file containing all information (tab separated)
$file2=$ARGV[1]; ### output file

open(AB,"$file1");
open(AC,">$file2");

<AB>; # skipping header

@files=<AB>;

print AC "gene\thlf_life\tPMID\n";

print "try____\n";

foreach $files(@files)
	{
chomp ($files);
@file1=split(/\t/,$files);

@file2=split(/\;/,$file1[0]);

	for($i=0;$i<@file2;$i++)
		{
		print AC "$file2[$i]\t$file1[1]\t$file1[2]\n";
		}
	}


close AB;
close AC;


### Akanksha