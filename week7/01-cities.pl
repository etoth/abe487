#!/usr/bin/env perl
use strict;
use warnings;
use autodie;
#"All at once":
my %cities =(
	Tucson => 'AZ',
	Pittsburgh => 'PA',
	Portland => 'OR'
	,
	);
use Data::Dumper;
print Dumper(\%cities);
