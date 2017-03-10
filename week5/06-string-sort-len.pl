#!/usr/bin/env perl
use strict;
use warnings;
my @sequence = qw(AACT TACCTAG TTACAG);
my @sortseq = sort {length $a <=> length $b} @sequence;
print "Sorted: @sortseq\n";
my @revsortseq = sort {length $b <=> length $a} @sequence;
print "Reverse sorted: @revsortseq\n";

__END__

Fails to take input from the command line.  

Fails to meet expected output.

One point off.
