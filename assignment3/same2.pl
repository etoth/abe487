#!/usr/bin/perl
use strict;
use warnings;
my$x=shift @ARGV;
my$y=shift @ARGV;
if (lc($x) eq lc($y)) {
        print "Same.";
}
else {
        print "Not same." ;
}

