#!/usr/bin/env perl
use strict;
use warnings;
use autodie;
use Data::Dumper;
use feature 'say';

if (@ARGV !=2) {
    die "Please provide two files.\n";
}
my %words1;
my %words2;
my $i;
open my $file1, '<', $ARGV[0];
while (my $line = <$file1>) {
    chomp $line;
    my @words = split /\s+/, $line;
    for my $word (@words) {
        $word =~ s/[^A-Za-z0-9]//g;
        $words1{lc $word} ++;
    }
}
open my $file2, '<', $ARGV[1];
while (my $line = <$file2>) {
    chomp $line;
    my @words = split /\s+/, $line;
    for my $word (@words) {
        $word =~ s/[^A-Za-z0-9]//g;
        $words2{lc $word} ++;
    }
}
for my $key (sort keys %words1) {
    if (exists $words2{$key}) {
        say $key;
        $i++;
    }
}
say "Found $i words in common."

__END__

You get a different answer with case-insensitive matching.
