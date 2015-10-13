#!/usr/bin/env perl
use strict;
use warnings;
unless (@ARGV == 2) {
    die "Please provide only 2 sequences.\n";
}

if ( $ARGV[0] eq '' ) {
    die "Please provide sequences.\n";
}
if ( $ARGV[1] eq '' ) {
    die "Please provide sequences.\n";
}

my $seq1 = ( $ARGV[0] );
my $seq2 = ( $ARGV[1] );
if ( length $seq1 == length $seq2 ) {
    print "Sequences are of equal length.\n";
}
else {
    die "Please provide sequences of equal length.\n";
}

my @s1 = split //, $seq1;
my @s2 = split //, $seq2;
my $i  = 0;
if ( $seq1 ne $seq2 ) {
    print "SNP detected.\n";
}
if ( $seq1 eq $seq2 ) {
    print "No SNP detected.\n";
}
my $mask = $seq1 ^ $seq2;
while ( $mask =~ /[^\0]/g ) {
    print substr( $seq1, $-[0], 1 ), ' -> ', substr( $seq2, $-[0], 1 ),
      ' at position ', $+[0], "\n";
    print $mask;
}

__END__

Does not match expected output!  Points off next time.

I have no idea what's going on from line 33 on.  I've never seen this.
Can you explain it to me?
