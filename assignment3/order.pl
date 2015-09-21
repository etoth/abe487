#!/usr/bin/perl
use strict;
use warnings;
my$x=shift @ARGV;
my$y=shift @ARGV;
if ('$x' gt '$y') {
	print "Wrong order"
}
else {
	print "Right order"
}
