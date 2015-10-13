#!/usr/bin/env perl
use strict;
use warnings;

unless (@ARGV) {
    die "Please provide a list of numbers.\n";
}

my $sumeven = 0;
my $sumodd  = 0;
for my $n (@ARGV) {
    if ( ( $n % 2 ) == 0 ) {
        $sumeven += $n;
    }
    else {
        $sumodd += $n;
    }
}
print "Sum even: $sumeven\n";
print "Odd sum: $sumodd\n";

__END__

Please format your code!
