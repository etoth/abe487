#!/usr/bin/env perl
use strict;
use warnings;
use Data::Dumper;
use feature 'say';
use autodie;
my $f1 = $ARGV[0];
my $f2 = $ARGV[1];
my $f3 = $ARGV[2];
my $f4 = $ARGV[3];
if (@ARGV != 4) {
	die "Provide 4 files.";
}
my %kegg1;
my %kegg2;
my %kegg3;
my %kegg4;
open my $fh1, '<', $f1;
while (my $line = <$fh1>) {
	chomp $line;
	if ($line =~ /^([\w][\d]+)\p{Punct}([\d]+)/ && $2 >= 50) {
		$kegg1{$1} = $2;
		my @array = (keys %kegg1);
		print join("\n",@array),"\n";
	}
}	
open my $fh2, '<', $f2;
while (my $line = <$fh2>) {
	chomp $line;
	if ($line =~ /^([\w][\d]+)\p{Punct}([\d]+)/ && $2 >= 50) {
		$kegg2{$1} = $2;
		my @array = (keys %kegg2);
		print join("\n",@array),"\n";
	}
}	
open my $fh3, '<', $f3;
while (my $line = <$fh3>) {
	chomp $line;
	if ($line =~ /^([\w][\d]+)\p{Punct}([\d]+)/ && $2 >= 50) {
		$kegg3{$1} = $2;
		my @array = (keys %kegg3);
		print join("\n",@array),"\n";
	}
}	
open my $fh4, '<', $f4;
while (my $line = <$fh4>) {
	chomp $line;
	if ($line =~ /^([\w][\d]+)\p{Punct}([\d]+)/ && $2 >= 50) {
		$kegg4{$1} = $2;
		my @array = (keys %kegg4);
		print join("\n",@array),"\n";
	}
}	
my @common = ();
foreach (keys %kegg1) {
	push (@common, $_) if exists $kegg2{$_}; #common now has common keys from kegg1 and 2
}
my %common2 = (
	@common => '1',
	);
foreach (keys %kegg3) {
	push (@common, $_) if exists $common2{$_}; #common now has keys from keggs 1, 2, 3
}
my %common3 = (
	@common => '1',
	);
foreach (keys %kegg4) {
	push (@common, $_) if exists $common3{$_}; #common now has common keys from all %
}
my @sortcom = sort @common;
my %sort;
@sort{@sortcom} = ();
my @uniq = sort keys %sort;
say Dumper (\@uniq);
