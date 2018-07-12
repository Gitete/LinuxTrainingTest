#!/bin/bash

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
    return $reslut
  elif test $[n] -eq 0
  then
    reslut=1
    echo "$1!=1"
    return $reslut;
  #小于0
  else
    echo "请输入非负数!"
    return 0
  fi
}

factorial $1
