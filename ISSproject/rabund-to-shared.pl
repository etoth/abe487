#!/usr/bin/env perl

use strict;
use warnings;
use autodie;
use feature 'say';
use Getopt::Long;
use File::Spec;
use Pod::Usage;

my %opts = get_opts();
@ARGV == 1 or pod2usage;
my $file = shift;

if ($opts{'help'} || $opts{'man'}) {
    pod2usage({
        -exitval => 0,
        -verbose => $opts{'man'} ? 2 : 1
    });
}

open my $fh, '<', $file;
while (my $line = <$fh>) {
    chomp $line;
    my @cols = split ("\t", $line);
    my $first = shift @cols;
    say join ("\t", $first, "Group1", @cols);
}
print "Done.";
    
# --------------------------------------------------
sub get_opts {
    my %opts;
    GetOptions(
        \%opts,
        'help',
        'man',
    ) or pod2usage(2);

    return %opts;
    }

__END__

# --------------------------------------------------

=pod

=head1 NAME

rabund-to-shared.pl - a script

=head1 SYNOPSIS

  rabund to shared 

Options:

  --help   Show brief help and exit
  --man    Show full documentation

=head1 DESCRIPTION

Alters .rabund file to look like .shared file.  Inserts group name into file.
Useful when you have only one group and cannot use mothur to generate a .shared file, but need
a shared file for further analyses.

Input - .rabund file.  Format of file should be as follows:

0.01 3 5 66 3 12 1 0 9 
   2 5 9 1  4 10 0 8 4 etc

Output will be as follows:

0.01 Group1 3 5 66 3 12 1 0 9
          2 5 9 1  4 10 0 8 4 etc

=head1 SEE ALSO

perl.

=head1 AUTHOR

Erica Lynne Toth E<lt>etoth@email.arizona.eduE<gt>.

=head1 COPYRIGHT

Copyright (c) 2015 etoth

This module is free software; you can redistribute it and/or
modify it under the terms of the GPL (either version 1, or at
your option, any later version) or the Artistic License 2.0.
Refer to LICENSE for the full license text and to DISCLAIMER for
additional warranty disclaimers.

=cut

