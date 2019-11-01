#!/usr/bin/perl
use strict;
use warnings;

my ($sam_file)=@ARGV;
my (@items,$line,%store);

foreach ((0..20))
{
  # report
  print "Starting iteration ".$_."\n";
  open(FILE_IN,$sam_file); # read sam file

  # working
  while ($line=<FILE_IN>)
  {
    @items=split("\t",$line);
    $store{$items[0]}={ # store into a hash
      "flag"=>$items[1],
      "chr"=>$items[2],
      "start"=>$items[3],
      "CIGAR"=>$items[5],
      "seq"=>$items[9],
      "qual"=>$items[10],
      "MD"=>$items[13]
     };

     $store{$items[0]}->{"MD"}=~s/^MD\:Z\://; # modify the MD field
     if ($store{$items[0]}->{"CIGAR"}=~s/^([0-9]+)S//) # clip the sequence field
       {$store{$items[0]}->{"seq"}=substr $store{$items[0]}->{"seq"},$1;}
     if ($store{$items[0]}->{"CIGAR"}=~s/([0-9]+)S$//) # clip the sequence field
       {$store{$items[0]}->{"seq"}=substr $store{$items[0]}->{"seq"},0,length($store{$items[0]}->{"seq"})-$1;}
     $store{$items[0]}->{"end"}=$store{$items[0]}->{"start"}-1; # calculate the end of the alignment
     while ($store{$items[0]}->{"CIGAR"}=~/([0-9]+)([A-Z]+)/g)
     {
       if ($2 eq "I") {next;}
       $store{$items[0]}->{"end"}+=$1;
     }
  }

  # clean up
  close(FILE_IN);
}

