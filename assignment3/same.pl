#!/usr/bin/perl
use strict;
use warnings;
my$x=shift @ARGV;
my$y=shift @ARGV;
if fc($x) eq fc($y) {
	print "Same."
};
else {
	print "Not same." 
};
