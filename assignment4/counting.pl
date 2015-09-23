#!/usr/bin/perl
use strict;
`wc -l perl_iii.fastq > linecount.txt`;
`wc -m perl_iii.fastq > charcount.txt`;
open INPUT, 'linecount.txt';
undef $/;
my$x = <INPUT>;
close INPUT;
open INPUT, 'charcount.txt';
undef $/;
my$y = <INPUT>;
close INPUT;
my$z=($y/$x);
print "The line count is: $x\n";
print "The character count is: $y\n";
printf"The average line length is: $z \n";
#fin
