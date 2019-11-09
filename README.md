# Raku and Perl6 for Bioinformatics
Raku/Perl6 resources for bioinformatics research by Tao Wang. This github repository serves as an introduction to Raku/Perl6 for bioinformaticians and general programmers, with linkes to more advanced resources listed where appropriate.

I am a bioinformatics scientist and a Perl diehard. Vist my lab website for more bioinformatics resources: https://qbrc.swmed.edu/labs/wanglab/index.php

## Hello bioinformaticians
 
* Download and install raku: https://perl6.org/downloads/ or https://github.com/rakudo/rakudo/releases
* Depending on how raku is installed, you may need to manually install zef, the raku package manager: https://github.com/ugexe/zef
* Raku tutorial to get you started. I found this tutorial to be very good: https://perl6intro.com/
* Full Raku documentation: https://docs.perl6.org/
* More explanations of Raku grammar: https://perl6advent.wordpress.com/
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

| Script         | Release       | SAM           | Time (real)  |  Time (user)   | Time (sys)   | Comment                 |
| -------        | -------       | -----         | ---          | ---            |   ---        |    ---                  |
| benchmark.pl   | v5.22.1       |  test1.sam    |   0.195      |   0.184        |  0.005       |                         |
| benchmark1.p6  | 2019.03       |  test1.sam    |   9.975      |   10.454       |  0.153       |                         |
| benchmark1.p6  | 2019.07.1     |  test1.sam    |   6.376      |   6.704        |  0.176       |                         |
| benchmark2.p6  | 2019.07.1     |  test1.sam    |   1.888      |   5.698        |  0.178       | credit goes to lizmat!  |

Raku does have a built-in profiler for measuring performance of codes, but I do find it hard to understand its output

```shell
perl6 --profile=profile.html benchmark.p6 --sam_file=test1.sam
```

## Math in Raku

Bioinformatics involves a lot of math, statistics, machine learning, data science ... Let's see how Raku does in terms of handling numbers and formula

Reference: https://docs.perl6.org/language/math

## Make Perl great again
  
You can help make Perl great again (or more exactly, make Perl6/Raku great) in so many ways!
* Contribute your own Perl6/Raku modules: https://modules.perl6.org/
* Basic instructions for creating Raku modules: https://docs.perl6.org/language/modules
* I have created a trivial Raku module that is nothing more than a skeleton Raku module but can serve as a good reference point of starting a Raku module. Check the ["/Make Perl great again/trivial"](https://github.com/wtwt5237/raku-4-bioinformatics/tree/master/Make%20Perl%20great%20again/trivial) folder
* If you find bugs in Raku, you can report here: https://github.com/rakudo/rakudo/issues
* Raku discussion forum, home to many passionate Raku folks: https://webchat.freenode.net/#raku
