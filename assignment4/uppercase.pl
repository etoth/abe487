#!usr/bin/perl
use strict;
use warnings;
open INPUT, "universe.txt";
undef $/;
my$in = <INPUT>;
close INPUT;
print uc "$in";
$/ = "\n";
