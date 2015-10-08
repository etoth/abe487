#!/usr/bin/env perl
use strict;
use warnings;
my @sequence = qw(AACT TACCTAG TTACAG);
my @sortseq = sort {length $a <=> length $b} @sequence;
print "Sorted: @sortseq\n";
my @revsortseq = sort {length $b <=> length $a} @sequence;
print "Reverse sorted: @revsortseq\n";
