#!/usr/bin/env perl

use strict;
use warnings;
use autodie;

my $in  = 'perl_iii.fasta.txt';
my $out = 'split.perl_iii.txt';
open my $in_fh, '<', $in;
while (my $line = <$in_fh>) {
    chomp($line);
    if (substr($line, 0, 1) eq '>') {
        print "$line \n";
    }
    else {
        my $revline = reverse $line;    #reverse compliment
        $revline =~ tr/ACGT/TGCA/;
        print "$revline \n";

    }
}

__END__

Instructions: 

 Make sure to print the output in fasta format including
 the sequence name and a note in the description that this is the
 reverse complement.

l. 16: You fail to handle lowercase sequence (e.g., repeat-masked).

Half off.
