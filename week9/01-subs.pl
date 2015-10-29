#!/usr/bin/env perl

use strict;
use warnings;
use autodie;
use feature 'say';
use Getopt::Long;
use Pod::Usage;
use Data::Dumper;

#reverse compliment sequence



main();

# --------------------------------------------------
sub main {
    my %args = get_args();
    say Dumper(\%args);

    if ($args{'help'} || $args{'man'}) {
        pod2usage({
            -exitval => 0,
            -verbose => $args{'man'} ? 2 : 1
        });
    }
    my $program = $args{program} or pod2usage ("No program");
    my $argument = $args{argument} or pod2usage ("No argument");
    if ($program eq 'rc') {
        reverse_comp($argument);
    }

}

# --------------------------------------------------
sub get_args {
    my %args;
    GetOptions(
        \%args,
        'help',
        'man',
        'program=s',
        'argument=s',
    ) or pod2usage(2);

    return %args;
}

#-----------------------------
sub reverse_comp {
    my $seq = shift;
    my $reverse = reverse $seq;
    $reverse =~ tr/AGTCagtc/TCAGtcag/;
    say $reverse;
}

__END__

# --------------------------------------------------

=pod

=head1 01-subs.pl

01-subs.pl - a script to print sequence reverse complements.

=head1 SYNOPSIS

  01-subs.pl 

Options:

  --help   Show brief help and exit
  --man    Show full documentation

=head1 DESCRIPTION

Prints reverse complement of sequences given via command line.

Usage:

<INPUT>

01-subs.pl -p rc -a GATTA

<EXPECTED OUTPUT>

TAATC

=head1 SEE ALSO

perl.

=head1 AUTHOR

Erica L. Toth E<lt>toth@pharmacy.arizona.eduE<gt>.

=head1 COPYRIGHT

Copyright (c) 2015 etoth

This module is free software; you can redistribute it and/or
modify it under the terms of the GPL (either version 1, or at
your option, any later version) or the Artistic License 2.0.
Refer to LICENSE for the full license text and to DISCLAIMER for
additional warranty disclaimers.

=cut

