#!/usr/bin/env perl6

my Str ($line,$sam_file,@items);
my Int ($i);
my ($fh,%store,$match);

sub MAIN (Str :$sam_file) # raku's way of getting commandline args
{
  for [0..20] -> $i 
  { 
    # report
    say "Starting iteration "~$i;
    $fh=open $sam_file,:r;

    while !$fh.eof # one of the ways to read file line by line in raku
    {
      $line=$fh.get;

      @items=split("\t",$line);
      %store{@items[0]}={
        "flag"=>@items[1],
        "chr"=>@items[2],
        "start"=>@items[3],
        "CIGAR"=>@items[5],
        "seq"=>@items[9],
        "qual"=>@items[10],
        "MD"=>@items[13]};

      %store{@items[0]}{"MD"}~~s/^MD\:Z\://; # modify the MD field
      if (%store{@items[0]}{"CIGAR"}~~s/^(\d+)S//) # clip the sequence field
        {%store{@items[0]}{"seq"}=substr %store{@items[0]}{"seq"},$0;}
      if (%store{@items[0]}{"CIGAR"}~~s/(\d+)S$//) # clip the sequence field
        {%store{@items[0]}{"seq"}=substr %store{@items[0]}{"seq"},0,%store{@items[0]}{"seq"}.chars-$0;}
      %store{@items[0]}{"end"}=%store{@items[0]}{"start"}-1; # calculate the end of the alignment
      for %store{@items[0]}{"CIGAR"}~~m:g/(\d+)(<upper>+)/ -> $match
      {
        if ($match[1] eq "I") {next;}
        %store{@items[0]}{"end"}+=$match[0];
      }
    }

    $fh.close;
  }
}

