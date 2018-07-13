#!/bin/bash

#--------------------------------------
#本脚本实现根据文件的后缀名进行解压
#日期：2018/7/13
#作者：庾聪晖
#--------------------------------------

#USAGE
Usage(){
    echo "usage: test2.sh [--list] or [Source compressed file]"
    echo "       [Destination path]"
    echo "Self compression accroding to the file name suffix"  
}

#提示支持的解压类型
List(){
    echo "Supported file types: zip tar tar.gz tar.bz2"
}

#要解压的文件
filename=$1
#解压到路径名
path=$2
#获取文件名的后缀
ext="${filename##*.}" 

#如果未输入path，获取当前路径
if [ -z $path ]
then
    path=$(cd `dirname $0`; pwd)
fi

if [ -z $filename ]
then
    Usage
elif [ $filename = '--list' ]
then 
    List
elif [[ -n $filename && -n $path ]]
then
    #根据后缀名解压
    case $ext in
        'tar')
            eval "tar xvf $filename -C $path";;
        'gz')
            eval "tar zxvf $filename -C $path";;
        'bz2')
            eval "tar jxvf $filename -C $path";;
        'zip')
            eval "unzip $filename -d $path";;
        *)
            echo 'error(101) This type is not supported(tar|gz|bz2|zip)';;
    esac
    echo "right"
fi
