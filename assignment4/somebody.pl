#!/usr/bin/perl
use strict;
use warnings;
my$file = 'perl_iii_nobody.txt';
open my $filein_fh, '<', $file;
while (my $line = <$filein_fh>) {
	chomp($line);
	if (my $y = (index ("$line", ('somebody', 0)))) {
	warn ("Somebody is here: $y");
	}
	if (my $z = (index ("$line", ('Nobody', 0)))) {
	print "Nobody is: $z \n";
	}
}
