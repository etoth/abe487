#!/usr/bin/env perl

use strict;
use warnings;
use autodie;
use feature 'say';
use Getopt::Long;
use Pod::Usage;
use Data::Dumper;
use Bio::DB::GenBank;



my %opts = get_opts();
my @args = @ARGV;
my $seq;
my $gname;
@ARGV > 0 or pod2usage "Provide arguments\n";
if ($opts{'help'} || $opts{'man'}) {
    pod2usage({
        -exitval => 0,
        -verbose => $opts{'man'} ? 2 : 1
    });
}
my $in = new Bio::SeqIO(-file => "@args", -format => 'genbank');
my $acc;
for my $f (@ARGV) {
    while (my $seq = $in->next_seq()) {
        my @cds = ();
        my $acc = $seq->accession();
        for my $feat ($seq->get_SeqFeatures() ) {
            if ($feat->primary_tag eq 'CDS') {
               push @cds, $feat->get_tag_values('translation');  
            }
        }
        my $i = scalar (@cds);
        my $n = 0;
        printf "$acc has %s CDS%s\n", $i, $i==1 ? '' : 's';
        for (@cds){
            $n++;
            print "$n : $_\n";
        }
    }    
}
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

03-find-cds.pl - a script

=head1 SYNOPSIS

  03-find-cds.pl 

Options:

  --help   Show brief help and exit
  --man    Show full documentation

=head1 DESCRIPTION

Describe what the script does, what input it expects, what output it
creates, etc.

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
