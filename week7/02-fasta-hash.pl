#!/usr/bin/env perl
use warnings;
use strict;
use autodie;
use feature 'say';
#if (!@ARGV) {
#	die;
#}
my $filename = shift || 'Perl_V.genesAndSeq.txt';
my %seq;
my $id;
open my $file, '<', $filename;
while (my $line = <$file>) {
	chomp ($line);
	if (substr ($line, 0, 1) eq '>') {
		$id = substr($line, 1);
		$seq{$id}=0;
	}
	else {
		my $len = length($line);
		$seq{$id} += $len;
	}
}
for my $key (sort {	$seq{$a} <=> $seq{$b} } keys %seq) {
	say $key, ': ', $seq{$key};
}

__END__

Instructions said to have a default argument.
