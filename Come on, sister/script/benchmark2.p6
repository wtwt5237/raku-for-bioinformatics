#!/usr/bin/env perl6

class Sam {
    has $.flag  is required; # use of "is required": https://docs.perl6.org/routine/is%20required
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
        $!MD = $!MD.substr(5); # modify the MD field

        $!seq = $!seq.substr($0)
          if $!CIGAR~~s/^(\d+)S//; # clip the sequence field
        $!seq = $!seq.substr(0, * - $0)
          if $!CIGAR~~s/(\d+)S$//; # clip the sequence field

        $!end = $!start - 1; # calculate the end of the alignment
        $!end += $_ for $!CIGAR.match(/ (\d+) <!before I> /, :g); # <!beforer XXX>: https://docs.perl6.org/language/regexes#Capture_markers:_%3C(_)%3E
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

=begin comment

comments from lizmat:

Original runs at about 4 seconds on my machine. The alternate version runs
between 1.2 and 1.6 seconds. This range is probably caused by the fact that
that parallelizing does not really heat up for such a small workload, so it
is very dependent on outside influences.

What did I change? I guess the most important part is that I created a class
for keeping / updating the information about a Sam line. This feels contrary
when coming from Perl, but in Raku classes / object building is heavily
optimised: that is needed because everything in Raku is an object. So
instead of a hash of hashes, a hash of Sam objects is created. Accessing
attributes in the object uses the same name as the keys that were used.

Secondly, when at all possible, cheaper versions of regular expressions were
used. Or no regular expression at all (the starts-with).

Thirdly, it is always better to think of these types of processes as pipelines.
Why? Because then less storage is needed for intermediate vaues. But more
importanty, when set up properly, they lend themselves to be parallelized.

So by making it a map on the lines from the file, the only thing that is needed
to parallelize, is to add the "race" to make it attempt to use all available
cores. Since the result is stored in an unordered hash, "race" can be used.
If you needed resuls in the same order as the original values, then you should
use "hyper".

Finally, in case you wondered, for $filename.IO.lines is really the idiom for
lazily reading lines from a file. AKA, this will not slurp all lines into
memory in Raku.

=end comment


