#!/bin/bash

#--------------------
#本脚本实现阶乘函数
#日期：2018/7/12
#作者：庾聪晖
#-------------------

factorial()
{
    #声明内部变量 n
    local n=$1
    # n > 0
    if test $[n] -gt 0
    then
        #递归调用
        factorial `expr $n - 1`
        #通过reslut这个全局变量传参
        reslut=`expr $n \* $reslut`
        echo "$1!=$reslut"
    elif test $[n] -eq 0
    then
        reslut=1
        echo "$1!=1"
    fi
    return $reslut;
}
#USAGE
usage()
{
    echo "USAGE: test1.sh [Nonnegative integer n]"
    echo "out put [n!]"
}



parameter=$1
if [ -z $parameter ]
then
    usage
elif test $parameter -gt 0
    then
    factorial $1
else
    echo "请输入非负整数!"
fi

