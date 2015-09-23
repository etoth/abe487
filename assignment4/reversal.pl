#!/usr/bin/perl
use strict;
use warnings;
use autodie;
my $in = 'perl_iii.fasta.txt';
my $out = 'split.perl_iii.txt';
open my $in_fh, '<', $in;
while (my $line = <$in_fh>) {
	chomp($line);
	if (substr ($line, 0, 1) eq '>') {
		print "$line \n";
	}
	else {
		my $revline = reverse $line; #reverse compliment
		$revline =~ tr/ACGT/TGCA/;
		print "$revline \n";

	}
}
