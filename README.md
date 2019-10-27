# raku-4-bioinformatics
Raku/Perl6 Resources for bioinformatics research by Tao Wang

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
  
## Make Perl great again
  
You can help make Perl great again (or more exactly, make Perl6/Raku great) in so many ways!
* Contribute your own Perl6/Raku modules: https://modules.perl6.org/
* I have created a trivial Raku module that is truly trivial but can serve as a good example of how to set up a Raku module. Check the ["/Make Perl great again/trivial"](https://github.com/wtwt5237/raku-4-bioinformatics/tree/master/Make%20Perl%20great%20again/trivial) folder
