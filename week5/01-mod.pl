#!/usr/bin/env perl
use strict;
use warnings;

unless (@ARGV) {
    die "Please provide a list of numbers.\n";
}

for my $n (@ARGV) {
    if ( ( $n % 2 ) == 0 ) {
        print "$n\n";
    }
}

__END__

While this does technically print out the evens, the output does not
match the expected output and therefore fails automated testing.  In the
future, unless you get an "ok" from the test suite, you will not receive
credit.  Also, the "while" isn't right.  It works, but it's not right.
