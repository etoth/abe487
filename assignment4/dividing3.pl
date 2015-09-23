#!/usr/bin/perl
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
	die "I hate negatives."
};
if ($y < 0) {
	die "I hate negatives."
};
if ($y == 0) {
	die "+++ DIVIDE BY CUCUMBER ERROR REINSTALL UNIVERSE AND REBOOT +++"
};
my $z = ($x/$y);
print "$z \n";
`echo "$z" > out.txt`;
`2>error.txt`;
#fin
