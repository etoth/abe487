#!/usr/bin/env perl
use strict;
use warnings;
my $name = shift @ARGV;
open my $file, '<', 'nobody.txt';
while (my $line = <$file>) {
        chomp $line;
        $line =~ s/Nobody/$name/g;
        print $line,"\n";
}
