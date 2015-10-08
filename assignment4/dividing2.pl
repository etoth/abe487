#!/usr/bin/env perl

use strict;
use warnings;

print "FEED ME: ";
my $x = <STDIN>;
die if ($x eq "");
chomp $x;
print "FEED ME SEYMOUR: ";
my $y = <STDIN>;
die if ($y eq "");
chomp $y;

if ($x < 0) {
    die "I hate negatives.";
}
if ($y < 0) {
    die "I hate negatives.";
}
if ($y == 0) {
    die "+++ DIVIDE BY CUCUMBER ERROR REINSTALL UNIVERSE AND REBOOT +++";
}
print "$x/$y";
#open my $STOUT > 'out.txt';
#open my $STDERR > 'error.txt';
#fin

