#!/usr/bin/env perl

use strict;
use warnings;
use autodie;
use feature 'say';
use Cwd 'cwd';
use Bio::SeqIO;
use Getopt::Long;
use File::Spec;
use Pod::Usage;
use File::Basename 'fileparse';
use File::Path qw(make_path remove_tree);

my %opts = get_opts();
my @args = @ARGV or pod2usage();
my $seq;

if ($opts{'help'} || $opts{'man'}) {
    pod2usage({
        -exitval => 0,
        -verbose => $opts{'man'} ? 2 : 1
    });
}

my $num     = $opts{number}  || 500;
my $out_dir = $opts{out_dir} || cwd();

for my $file (@ARGV) {
    say "file ($file)";
    my $seqio = Bio::SeqIO->new(
        -file => $file,
        -format => "fasta"
    );

    my $count=0;
    my $fileinc = 1;
    my $out = new Bio::SeqIO(-file=> ">$file.$fileinc", -format=>'fasta');
    while (my $seq = $seqio->next_seq()) {
        $count++;
        if ($count > $num) {
            $count = 1;
            $fileinc++;
            $out = new Bio::SeqIO(-file=> ">$file.$fileinc", -format=>'fasta');
            $out->write_seq($seq);
        }

        $out->write_seq($seq);
        
   } 
 }
 say "Done.";
#    $out ->write_seq($seq);
    
# --------------------------------------------------
sub get_opts {
    my %opts;
    GetOptions(
        \%opts,
        'help',
        'man',
        'number:i',
        'out_dir:s',
    ) or pod2usage(2);

    return %opts;
    }

__END__

# --------------------------------------------------

=pod

=head1 NAME

01-fasta-splitter.pl - a script

=head1 SYNOPSIS

  01-fasta-splitter.pl 

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

