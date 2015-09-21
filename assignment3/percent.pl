#!/usr/bin/perl
use strict;
use warnings;
my$i=shift @ARGV;
my$j=shift @ARGV;
if ($i+$j>0) {
	print ($i/($i+$j)*100)
};
else {
	print "+++DIVIDE BY CUCUMBER ERROR PLEASE REINSTALL UNIVERSE AND REBOOT+++"
};
