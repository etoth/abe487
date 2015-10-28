#!/usr/bin/perl
use strict;
use warnings;
my$x=shift @ARGV;
my$y=shift @ARGV;
if ("\F", ($x) eq ($y), "\E") {
	print "Same.";
}
else {
	print "Not same." ;
}
