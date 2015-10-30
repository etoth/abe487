#!/usr/bin/env perl                                                                                                   
use strict;
use warnings;

my $infile = 'sequence.txt';
my $seq;

open(my $fh, '<', $infile) || die "Cannot open infile $!";

while (my $line = <$fh>) {
    chomp $line;
    if ($line !~ m/^>/) {
        $seq .= $line;
    }
}
close($fh);
print $seq, "\n";
my @cut_sites = $seq =~ m/([AG]AATT[CT])/g;

print "@cut_sites\n";
