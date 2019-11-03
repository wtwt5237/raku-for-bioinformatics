In this folder

-------------------------------

Folder: sam

Description: The SAM file used for the benchmarking purpose. test2.sam is 10 times the size of test1.sam and test3.sam is 10 times the size of test2.sam

-------------------------------

Folder: script

Description: This folder contains the perl5 and Raku scripts for benchmarking. Run it by, for example

```shell
time perl benchmark.pl test1.sam
time perl6 benchmark.p6 --sam_file=test1.sam
```
