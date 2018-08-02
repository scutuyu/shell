#! /bin/bash

words="hello world"

#file="/Users/tuyu/learn/learnshell/readfile/hello.md"
file="world.md"

sed  "70 a\ 
$words
" $file
#cat back > $file

