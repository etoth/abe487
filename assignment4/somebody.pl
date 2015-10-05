#!/usr/bin/env perl

use strict;
use warnings;
use autodie;

my $file = 'perl_iii_nobody.txt';
open my $filein_fh, '<', $file;

while (my $line = <$filein_fh>) {
    chomp($line);
    #if (my $y = (index("$line", ('somebody', 0)))) {
    my $y = index($line, 'somebody');
    if ($y >= 0) {
        warn("Somebody is here: $y");
    }

    #if (my $z = (index("$line", ('Nobody', 0)))) {
    my $z = index($line, 'Nobody');
    if ($z >= 0) {
        print "Nobody is: $z \n";
    }
}

__END__

use autodie!

You program's output:

[gila@~/work/students/etoth/assignment4]$ perl somebody.pl
Useless use of a constant ("somebody") in void context at somebody.pl line 12.
Useless use of a constant ("Nobody") in void context at somebody.pl line 15.
Somebody is here: -1 at somebody.pl line 13, <$_[...]> line 1.
Nobody is: -1
Somebody is here: -1 at somebody.pl line 13, <$_[...]> line 2.
Nobody is: -1
Somebody is here: -1 at somebody.pl line 13, <$_[...]> line 3.
Nobody is: -1
Somebody is here: -1 at somebody.pl line 13, <$_[...]> line 4.
Nobody is: -1
Somebody is here: -1 at somebody.pl line 13, <$_[...]> line 5.
Nobody is: -1
Somebody is here: -1 at somebody.pl line 13, <$_[...]> line 6.
Nobody is: -1
Somebody is here: -1 at somebody.pl line 13, <$_[...]> line 7.
Nobody is: -1

After corrections:

la@~/work/students/etoth/assignment4]$ perl somebody.pl
Nobody is: 0
Nobody is: 17
Nobody is: 19
Nobody is: 56
Nobody is: 7
Somebody is here: 85 at somebody.pl line 15, <$_[...]> line 6.
Nobody is: 85

Then I realized that the input file was missing many newlines.  I 
corrected that and ran again:

[gila@~/work/students/etoth/assignment4]$ perl somebody.pl
Nobody is: 0
Nobody is: 0
Nobody is: 0
Nobody is: 0
Nobody is: 0
Nobody is: 0
Nobody is: 0
Nobody is: 0
Nobody is: 0
Nobody is: 0
Nobody is: 0
Nobody is: 32
Nobody is: 14
Nobody is: 33
Nobody is: 22
Somebody is here: 12 at somebody.pl line 15, <$_[...]> line 20.
Nobody is: 0

One point off.
