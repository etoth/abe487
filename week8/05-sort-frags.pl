#!usr/bin/env/perl
use warnings;
use strict;

my $in = shift @ARGV;
my $seq = "";
open(my $fh,'<',$in) or die "Can't open $in: $!\n";
while( my $line = <$fh>)
{
  chomp $line;
  if ($line !~ m/^>/)
  {
    $seq .= $line;
  }
}
close($fh);                                                                                                                              

print "Original\n";
print "$seq\n";
print "\n\n";

# match and sub                                                                                           
$seq =~ s/([AG])(AATT[CT])/$1\^$2/g;
                                                                                                                            
print "Modified\n";
print $seq,"\n";

# split to array and sort                                                                                             
print "Fragments\n";
my @fragments = sort {length($b) <=> length($a)} split(/\^/,$seq);
print join("\n",@fragments),"\n";
