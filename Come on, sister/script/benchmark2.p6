#!/usr/bin/env perl6

class Sam {
    has $.flag  is required;
    has $.chr   is required;
    has $.start is required;
    has $.CIGAR is required;
    has $.seq   is required;
    has $.qual  is required;
    has $.MD    is required;
    has $.end;

    method from-items(@items)
    {
        self.bless(
          flag  => @items[0],
          chr   => @items[1],
          start => @items[2],
          CIGAR => @items[4],
          seq   => @items[8],
          qual  => @items[9],
          MD    => @items[12]
        )
    }

    method TWEAK(--> Nil)
    {
        $!MD = $!MD.substr(5)
          if $!MD.starts-with("MD:Z:"); # modify the MD field

        $!seq = $!seq.substr($0)
          if $!CIGAR~~s/^(\d+)S//; # clip the sequence field
        $!seq = $!seq.substr(0, * - $0)
          if $!CIGAR~~s/^(\d+)S//; # clip the sequence field

        $!end = $!start - 1; # calculate the end of the alignment
        $!end += $_ for $!CIGAR.match(/ (\d+) <!before I> /, :g);
    }
}

sub MAIN (Str :$sam_file) # raku's way of getting commandline args
{
    for 0..20 -> $i 
    { 
        # report
        say "Starting iteration $i";

        my %store = $sam_file.IO.lines.race.map:
        {
            my ($key,@items) = .split("\t");
            $key => Sam.from-items(@items)
        }
    }
}

