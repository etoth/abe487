#!/usr/bin/env perl

use strict;
use warnings;
use autodie;
use feature 'say';
use Getopt::Long;
use Pod::Usage;
use Cwd 'cwd';
use Bio::SeqIO;
use Getopt::Long;
use File::Spec;
use Pod::Usage;
use Bio::DB::Fasta;
use File::Basename 'fileparse';
use File::Path qw(make_path remove_tree);
use Data::Dumper;

my %opts = get_opts();
if ($opts{'help'} || $opts{'man'}) {
    pod2usage({
        -exitval => 0,
        -verbose => $opts{'man'} ? 2 : 1
    });
}

@ARGV == 2 or die "Only two arguments.\n";
my $file = $ARGV[0];
my $pattern = $ARGV[1];
(my $out_file = $pattern) =~ s/\W//g;
$out_file .= '.fa';

say "Searching '$file' for '$pattern'";
my $db = Bio::DB::Fasta->new($file);
my $fileout = Bio::SeqIO->new(-file=> ">$out_file.fa", -format=>'fasta');
my @ids = grep { /$pattern/ } $db->get_all_primary_ids;
for my $id (@ids) {
    my $seq = $db->get_Seq_by_id($id);
    $fileout->write_seq($seq);
}

my $i = @ids;
printf "Found %s id%s \n", $i, $i == 1? '' : 's';
say "See results in '$out_file'"; 

# --------------------------------------------------
sub get_opts {
    my %opts;
    GetOptions(
        \%opts,
        'help',
        'man',
        'pattern=s',
    ) or pod2usage(2);

    return %opts;
}

__END__

# --------------------------------------------------

=pod

=head1 NAME

02-fasta-search.pl - a script

=head1 SYNOPSIS

  02-fasta-search.pl 

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


