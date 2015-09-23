#!/usr/bin/perl
use strict;
use warnings;
print "FEED ME: ";
my $x = <STDIN>;
chomp $x;
die if ($x eq "");
print "FEED ME SEYMOUR: ";
my $y = <STDIN>;
chomp $y;
die if ($y eq "");
if ($x < 0) {
	die "I hate negatives."
};
if ($y < 0) {
	die "I hate negatives."
};
if ($y == 0) {
	die "+++ DIVIDE BY CUCUMBER ERROR REINSTALL UNIVERSE AND REBOOT +++"
};
#fin
