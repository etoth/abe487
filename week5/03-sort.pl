#!/usr/bin/env perl
use strict;
use warnings;

unless (@ARGV) {
    die "Please provide a list of numbers.\n";
}

my @defsort = sort @ARGV;
print "Default sort: @defsort\n";

my @numsort = sort { $a <=> $b } @defsort;
print "Numerical sort: @numsort\n";

my @revnumsort = sort { $b <=> $a } @numsort;
print "Reverse numerical sort: @revnumsort\n";

__END__

Note that this still fails the test becuase the test isn't exactly
the expected output.
