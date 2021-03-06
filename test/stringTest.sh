#!/usr/bin/env bash

. env.sh
. ${SH_LIB_DIR}/string.sh

strLen "len" "hello"

echo "length of hello is $len"
unset len

echo "length of hello after unset:$len"


s1="  hello world  "
emptys="  "
strTrimLeft "s" "$s1"

echo "'$s1' after trimmed:'$s'"
unset s

strTrimLeft "s" "$emptys"
echo "'$emptys' after trimmed left:'$s'"
unset s

strTrimRight "s" "$s1"
echo "'$s1' after trimmed right:'$s'"
unset s

strTrimRight 's' "$emptys"
echo "'$emptys' after trimmed right:'$s'"
unset s

strTrim 's' "$s1"
echo "'$s1' after trimmed:'$s'"
unset s

strStartWith 's' "$s1" "  h"
echo "'$s1' start with '  h'? $s"
unset s

strStartWith 's' "$s1" "h"
echo "'$s1' start with 'h'? $s"
unset s

strStartWith 's' "$s1" "  hello world  "
echo "'$s1' start with '  hello world  '? $s"

unset s
strStartWith 's' "$s1" ""
echo "'$s1' start with ''? $s"
unset s
