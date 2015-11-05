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
@ARGV > 0 or pod2usage "Provide arguments\n";
if ($opts{'help'} || $opts{'man'}) {
    pod2usage({
        -exitval => 0,
        -verbose => $opts{'man'} ? 2 : 1
    });
}
for my $file (@ARGV) {
    my $seqio = Bio::SeqIO->new(
        -file => $file,
        -format => "fasta"
    );
    while (my $seq = $seqio->next_seq()) {
        foreach my $feat ($seq->top_SeqFeatures) {
            if ($feat->primary_tag eq 'CDS') {
                # ex - coded_by = U05745.1:1..133
                my @coded_by = $feat->each_tag_value('coded_by');
                my ($nun_acc, $loc_str) = split /\:/, $coded_by[0];
                my $nun_obj = $gb->get_Seq_by_acc($nun_acc);
                # create bio::location object from string
                my $loc_object = $loc_factory->from_string($loc_str);
                #create feature object by using location
                my $feat_obj = Bio::SeqFeature::Generic->new(-location =>$loc_object);
                # associate the feature object with nucleotide sequence object
                $nun_obj->add_SeqFeature($feat_obj);
                my $cds_obj = $feat_obj->spliced_seq;
                say "CDS sequence is",$cds_obj->seq,;
            }
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
