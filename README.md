# Raku and Perl6 for Bioinformatics
Raku/Perl6 resources for bioinformatics research by Tao Wang. This github repository serves as an introduction to Raku/Perl6 for bioinformaticians and general programmers, with linkes to more advanced resources listed where appropriate.

I am a bioinformatics scientist and a Perl diehard. Vist my lab website for more bioinformatics resources: https://qbrc.swmed.edu/labs/wanglab/index.php

## Hello bioinformaticians
 
* Download and install raku: https://perl6.org/downloads/
* Raku tutorial to get you started. I found this tutorial to be very good: https://perl6intro.com/
* Your first raku experience. After you have installed raku, run this in the shell console, and you should get "hello bioinformatics!"
  ```shell
  perl6 -e "'hello bioinformatics!'.say"
  ```
* Your first raku script. Create a script with the name test.p6 using your favorite text editor. This is its content:
  ```raku
  #!/usr/bin/env perl6
  my @array[3];
  @array[0]="bioinformatics";
  @array[1]="is";
  @array[2]="awesome!";
  say @array;
  ```
  Execute by running it in the console
  ```shell
  perl6 test.p6
  ```
  And you should get "[bioinformatics is awesome!]"
* Your first raku bug? Debug it! Type the follwing in the console
  ```shell
  perl6-debug-m test.p6
  ```
  
## Come on, sister

This section provides a benchmark of performance of Raku, for a simple and barely useful job of parsing a small SAM file. A perl5 script is used as a control. An evolving Raku script (with each version documented) is run against the most recent Raku release, and the time it takes for the script to finish is documented. The purpose of this practice is to show how the improvement in the Raku compiler and coding manner can affect performance

| Script         | Release       | Time    | SAM       | Comment  |
| -------        | -------       | -----   | ---       | ---      |
| benchmark.pl   | v5.22.1       |         | test1.sam |          |
| benchmark1.p6  | 2019.03       |         | test1.sam |          |

## Make Perl great again
  
You can help make Perl great again (or more exactly, make Perl6/Raku great) in so many ways!
* Contribute your own Perl6/Raku modules: https://modules.perl6.org/
* Basic instructions for creating Raku modules: https://docs.perl6.org/language/modules
* I have created a trivial Raku module that is nothing more than a skeleton Raku module but can serve as a good reference point of starting a Raku module. Check the ["/Make Perl great again/trivial"](https://github.com/wtwt5237/raku-4-bioinformatics/tree/master/Make%20Perl%20great%20again/trivial) folder
