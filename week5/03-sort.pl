#!/usr/bin/env perl
use strict;
use warnings;
if ($ARGV[0] eq "") {
die "Please provide a list of numbers.";
}
my @defsort = sort @ARGV;
print "Default sort: @defsort\n";
my @numsort = sort {$a <=> $b} @defsort;
print "Numerical sort: @numsort\n";
my @revnumsort = sort {$b <=> $a} @numsort;
print "Reverse numerical sort: @revnumsort\n";
