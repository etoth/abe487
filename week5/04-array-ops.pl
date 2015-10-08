#!/usr/bin/env perl
use strict;
use warnings;
my @given = (101, 2, 15, 22, 95, 33, 2, 27, 72, 15, 52);
print join (',', @given), "\n";
my $lastnum = pop (@given), "\n";
print join (',', "Popped array:", @given), "\n";
my $firstnum = shift (@given);
print join (',', "Shifted array:", @given), "\n";
push @given, 12;
print join (',', "Pushed array:", @given), "\n";
unshift @given, 4;
print join (',', "Unshifted array:", @given), "\n";
