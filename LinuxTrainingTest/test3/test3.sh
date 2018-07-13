#!/bin/bash

#--------------------------------------
#本脚本实现获取文件夹下最大的前n个文件
#日期：2018/7/13
#作者：庾聪晖
#--------------------------------------

#usage
Usage(){
    echo "usage: ./test3.sh [-n N] [-d DIR]"
    echo "Show top N largest files/directories"
}

#输出此路径下文件
printPwd(){
    echo "The largest files/directories in $(pwd) are:"
    ls -sh | sort -rn | awk '{ print "\t" NR "\t"  $1 "\t" $2}'
}

#输出指定路径下前n个文件
printIntent(){
    local path=$2
    local n=$1
    n="1,"$n"p"
    echo "The largest files/directories in $2 are:"
    ls -sh $path | sort -rn | sed -n $n | awk '{ print "\t" NR "\t"  $1 "\t" $2}'
    exit
}


if [ -z $1 ]; then
    printPwd;
elif [[ $1 = "-n" && $3 = "-d" ]]; then
    printIntent $2 $4;
else
    Usage;
fi
