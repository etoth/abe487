#!/usr/bin/env perl
use strict;
use warnings;
my @sequence = qw(ATGCCCGGCCCGGC GCGTGCTAGCAATACGATAAACCGG ATATATATCGAT ATGGGCCC);
my @sortseq = sort {$a cmp $b} @sequence;
print "Sorted: @sortseq\n";
my @revsortseq = sort {$b cmp $a} @sequence;
print "Reverse sorted: @revsortseq\n";

__END__

Fails to take input from the command line.  

Fails to meet expected output.

One point off.
