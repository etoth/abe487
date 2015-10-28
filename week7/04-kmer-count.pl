#!/usr/bin/env perl
use strict;
use warnings;
use autodie;
use Data::Dumper;
use feature 'say';

my $seq       = shift or die "Please provide a sequence.\n";
my $kmer_size = shift || 3;

if (-e $seq) {
	open my $fh, '<', $seq;
	$seq = join '', <$fh>;
}

unless ($seq) {
	die "Zero-length sequence.\n"
}

my $len = length($seq);
my $numkmer = ($len - $kmer_size + 1);
my %kmers;
for (my $i = 0; $i < $numkmer; $i++) {
	my $kmer = substr($seq, $i, $kmer_size);
	$kmers {$kmer}++
}
printf "%-15s %10s\n", "Sequence length", $len;
printf "%-15s %10s\n", "Mer size", $kmer_size;
printf "%-15s %10s\n", "Number of kmers", $numkmer;

my $size = scalar keys %kmers;
printf "%-15s %10s\n", "Unique Kmers", $size;
my $count1;
for my $sortkey (keys %kmers) {
	if ($kmers{$sortkey} == 1) {
    $count1++;
  }
}
printf "%-15s %10s\n", "Num. singletons", $count1;
print "Most abundant\n";
my $i = 0;
foreach my $sortkey (sort {$kmers{$b} <=> $kmers{$a} || $a cmp $b} keys %kmers) {
    last if $kmers{$sortkey} == 1;
	last if ($i++) == 10;

	printf "%-15s %10s\n", $sortkey, $kmers{$sortkey};
}

__END__

I made a few corrections as you had way too much output.  Check the "test-out"
file for more info on what you missed.

One point off.
