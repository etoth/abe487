#!/usr/bin/perl
use strict;
use warnings;
my $file = 'perl_iii.fastq';
my ($lines, $chars) = (0,0);
use autodie;
open my $file_fh, '<', $file;
while (my $line = <$file_fh>) {
	chomp($line);
	$lines = $lines +1;
	$chars += length($line);
	# or $lc++;
	print "The number of lines is $lines \n";
	print "The number of characters is $chars \n";
	my $z = ($chars/$lines);
	print "The average characters per line is $z \n";
}
#fin
