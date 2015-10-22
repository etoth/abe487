#!/usr/bin/env perl
use strict;
use warnings;
use autodie;
use feature 'say';
my $i = 0;
my $file = shift @ARGV;
my $pattern;
open my $fh, '<', $file;
while (my $line = <$fh>) {
        chomp $line;
        $pattern = '>';
        if ($line =~ s/^$pattern//) {
        		$i++;
                print "$i: $line \n";
        }

}
printf "Found %s sequence%s.\n", $i, $i == 1 ? '' : 's';
