#!/usr/bin/perl
use strict;
use warnings;
my$x=shift @ARGV;
my$y=shift @ARGV;
my@names= qq($x $y);
if ("$x" gt "$y") {
	print sort @names;
}
else {
	print($x $y);
}
