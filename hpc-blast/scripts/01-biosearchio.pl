#!/usr/bin/env perl

use strict;
use warnings;
use autodie;
use feature 'say';
use autodie;
use Bio::SearchIO;

my $file = @ARGV;
@ARGV == 1 or die 'Provide file';
my $in = new Bio::SearchIO(-format => 'blast',
						   -file => 'query_v_sprot.blastout');
while (my $result = $in->next_result) {
	while (my $hit = $result-> next_hit) {
		while (my $hsp = $hit->next_hsp) {
			if ($hit->significance <= 1e-10) {
			say join "\t",
                    $result->query_name, 
                    $hit->name, 
                    $hit->description, 
                    $hsp->percent_identity, 
                    $hsp->length('total'), 
                    $hsp->evalue;
				
			}
		}
	}
}
