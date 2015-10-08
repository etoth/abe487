#!/usr/bin/env perl
use strict;
use warnings;
if ($ARGV[0] eq "") {
die "Please provide a list of numbers.";
}
foreach my $n (@ARGV) {
while (($n%2)==0) {
	print "$n\n";
	$n--;
}	
}
