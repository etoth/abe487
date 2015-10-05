#!/usr/bin/env perl

use strict;
use warnings;
use autodie;

my $file = 'perl_iii.fastq';
my ($lines, $chars) = (0, 0);
open my $file_fh, '<', $file;

while (my $line = <$file_fh>) {
    #chomp($line); a newline is a char that should be counted
    $lines++;
    $chars += length($line);
}

print "The number of lines is $lines \n";
print "The number of characters is $chars \n";
my $z = ($chars / $lines);
print "The average characters per line is $z \n";

#fin

__END__

The summary stats should come outside the loop.  You should get the 
same numbers as "wc":

 [gila@~/work/students/etoth/assignment4]$ perl counting2.pl
 The number of lines is 120
 The number of characters is 7919
 The average characters per line is 65.9916666666667
 [gila@~/work/students/etoth/assignment4]$ wc perl_iii.fastq
      120     150    8039 perl_iii.fastq


After I removed the "chomp" (l. 12):  

 [gila@~/work/students/etoth/assignment4]$ perl counting2.pl
 The number of lines is 120
 The number of characters is 8039
 The average characters per line is 66.9916666666667

One point off.
