#!/usr/bin/env bash

. env.sh
. ${SH_LIB_DIR}/string.sh

i=0
times=100000

while [ $i -lt $times ]
do
    strLen "len" "hello"
    unset len
    let i=i+1
done

echo "cost ${SECONDS} s calculate the length of 'hello' in $times times"
