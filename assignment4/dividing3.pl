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
my $z = ($x/$y);
print "$z \n";
#`echo "$z" > out.txt`;
#`2>error.txt`;
#fin

__END__

Instructions were to take two numbers from the command line.

Semicolons end statements not blocks (no semi's after curly brackets).

Let the user sort out STDERR/STDOUT:

  $ prog 1>out 2>err

Half off.
