#!/usr/bin/env perl
use strict;
use warnings;
use feature 'say';

my $text = join('', @ARGV);
$text =~ s/\p{Punct}//;    #remove punctuation
$text =~ s/^\s+//i;
$text =~ s/\s+$//i;
$text =~ tr/A-Z/a-z/;

#$text =~ s/[^a-zA-Z0-9]//g; <=== this is the only sub needed

my $rtext = reverse $text;
if ($text eq $rtext) {
    say "Yes";
}
else {
    say "No";
}
