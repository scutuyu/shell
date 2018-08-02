#! /bin/sh

a=5
b=7
((a++));echo $a  # 6
((b--));echo $b  # 6
((a == b)); echo $?  #
