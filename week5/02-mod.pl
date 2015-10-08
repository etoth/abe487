#!/usr/bin/env perl
use strict;
use warnings;
if ($ARGV[0] eq "") {
die "Please provide a list of numbers.";
}
my $sumeven = 0;
my $sumodd = 0;
for my $n (@ARGV) {
	if (($n % 2) == 0){
		$sumeven += $n;
		}
	else {
		$sumodd += $n;
		}	
}
print "Sum even: $sumeven\n";
print "Odd sum: $sumodd\n";
