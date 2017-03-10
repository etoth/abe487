#!/usr/bin/env perl
use strict;
use warnings;
use autodie;
unless (@ARGV == 2) {
	die "Please provide only 2 sequences.\n";
}

if ($ARGV[0] eq '') {
	die "Please provide sequences.";
}
if ($ARGV[1] eq '') {
	die "Please provide sequences.";
}

for my $seq (@ARGV) {
	my $seqlen = length $seq;
	print "++++++++++\n";
	print "Seq: $seq\n";
	print "Sequence length: $seqlen\n";
	my $count1 = ($seq =~ tr/GCgc//);
	print "#GC: $count1\n";
	my $percent = ($count1/$seqlen)*100;
	my $roundpercent = sprintf("%.2f", $percent);
	print "%GC = $roundpercent %\n";
	print "++++++++++\n";
}

__END__

Remember DRY: Don't Repeat Yourself
If you find yourself copying/pasting code, you're doing it wrong.

You failed to create the expected output.  In the future, you will 
receive no points unless it matches exactly.
