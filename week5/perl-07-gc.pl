#!/usr/bin/env perl
use strict;
use warnings;
use autodie;
if ($ARGV[2]) {
	die "Please provide only 2 sequences.";
}
if ($ARGV[0] eq '') {
	die "Please provide sequences.";
}
if ($ARGV[1] eq '') {
	die "Please provide sequences.";
}

for my $seq1 ($ARGV[0]) {
	my $seqlen = length $seq1;
	print "++++++++++\n";
	print "Seq: $seq1\n";
	print "Sequence length: $seqlen\n";
	my $count1 = ($seq1 =~ tr/GCgc//);
	print "#GC: $count1\n";
	my $percent = ($count1/$seqlen)*100;
	my $roundpercent = sprintf("%.2f", $percent);
	print "%GC = $roundpercent %\n";
	print "++++++++++\n";
}

for my $seq2 ($ARGV[1]){
	my $seqlen2 = length $seq2;
	print "++++++++++\n";
	print "Seq: $seq2\n";
	print "Sequence length: $seqlen2\n";
	my $count2 = ($seq2 =~ tr/GCgc//);
	print "#GC: $count2\n";
	my $percent = ($count2/$seqlen2)*100;
	my $roundpercent = sprintf("%.2f", $percent);
	print "%GC = $roundpercent %\n";
	print "++++++++++\n";
}
