#!/bin/bash

if [ -z $1 ]; then
  NUMBER=1000
else
  NUMBER=$1
fi
rm foo*.c > /dev/null

for a in $(seq 1 $NUMBER); do
  echo "__root int foo$a() { return $a; }" > foo$a.c
done
