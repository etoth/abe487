#!/usr/bin/env perl
use strict;
use warnings;
use Data::Dumper;
use feature 'say';
use autodie;
my $file        = shift @ARGV;
my %enz;
open my $fh, '<', $file;
while (my $line = <$fh>) {
	if ($line =~ /^([\w\s\(\)]+)\s+\b([A-Z\^]+)$/) {
		$enz{$1} = $2;
	}
}
my $i = scalar (keys %enz);
say STDERR Dumper (\%enz);
printf "There are %s enzyme%s.\n", $i, $i == 1 ? '' : 's';
