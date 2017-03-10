#!/usr/bin/perl
use strict;
use warnings;
my $i = shift @ARGV;
my $j = shift @ARGV;
my $z = ( $i / ( $i + $j ) * 100 );
if ( $i + $j > 0 ) {
    print($z);
}
else {
    print "+++DIVIDE BY CUCUMBER ERROR PLEASE REINSTALL UNIVERSE AND REBOOT+++";
}
