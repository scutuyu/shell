#! /bin/bash

baseUrl=./
words="hello world"
if [ "$1" == "" ]; then 
    echo "没有传参数，使用默认参数"
    echo $baseUrl
else
    baseUrl=$1
    echo $baseUrl
fi
if [ "$2" == "" ] ; then
    echo "没有传入需要插入的文本，使用默认文本"
    echo $words
else
    words=$2
    echo $words
fi

files=`find $baseUrl -type f -name "*.md" -mindepth 2 -maxdepth 2`

for i in $files
do
    lines=`cat $i | wc -l`
    echo "${i} has ${lines} lines"
    if [ $lines -ge 100 ] ; then
        sed "100 a\  
        ${words}
        " $i > back
	cat back > $i
	rm -f back
    fi
done
