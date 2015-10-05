#!/usr/bin/env perl

use strict;
use warnings;
use autodie;

open my $INPUT, "universe.txt";
undef $/;
my $in = <INPUT>;
close INPUT;
print uc "$in";
$/ = "\n";

__END__

"use autodie"!

l. 7: Use scalars instead of global filehandles

Overall, this is clever with the use of $/, but try running this on 
an input file that exceeds your system's available memory and it
will fail.  Even if you have 256G of RAM, you really don't want to 
read that much into memory!

A minimal script that would do this:

[gila@~/work/students/etoth/assignment4]$ perl -e 'while (<>) { print uc }' universe.txt
THERE IS A THEORY WHICH STATES THAT
IF EVER ANYONE DISCOVERS EXACTLY WHAT THE
UNIVERSE IS FOR AND WHY IT IS HERE, IT WILL
INSTANTLY DISAPPEAR AND BE REPLACED BY SOMETHING
EVEN MORE BIZARRE AND INEXPLICABLE.  THERE IS ANOTHER
THEORY THAT STATES THAT THIS HAS ALREADY HAPPENED.
