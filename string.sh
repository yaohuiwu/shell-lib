#!/usr/bin/env sh

TRUE=1
FALSE=0

#readonly TRUE
#readonly FALSE

# is a string is empty
# 	0 	:	if empty
#	1 	:	if not empty
str_is_empty(){
	if [ "$1" != '' -a `expr match "$1" "^\s*$"` -eq 0 ];then
		echo $FALSE 
	else
		echo $TRUE
	fi 
}

# get length of a string
str_len(){
	echo `expr length "$1"`
}
