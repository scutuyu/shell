#! /bin/sh

hello=$1
if [ -z $hello ]
then 
	echo "please input param like this:%n./judge.sh 1"
else
	flag= `[ $hello -eq 0 ]`
	if [ $? -ne 0 ] 
	then
	echo "the param is not a number"
	else
		if [ $hello -eq 0 ] 
		then
			echo "the number is 0"
		else
			echo "the number is not equal 0"
		fi
	fi
fi
