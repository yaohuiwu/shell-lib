#!/usr/bin/env sh

# get length of a string
# 
# $1 : the variable name that contains the length of $2
# $2 : the string.
strLen(){
    eval "$1=${#2}"	
}

# remove the blank char ' ' at the beginning of a string.
#
# $1 : the name of the result variable
# $2 : the orginal string 
# 
# for example:
#    strTrimLeft "s" "  hello world  "
#
# and then you can get the result using $s. Please unset
# the result variable when you no longer use it like this:
#    unset s
#
strTrimLeft(){
    len=${#2}    
    s="$2"
    i=0
    while [ $i -lt $len  ]
    do
	if [ "${s:${i}:1}" = ' ' ];then
	    let i=i+1
	else
	    break
	fi
    done
    #echo "first none empty index is $i"
    s="${s:${i}}"
    eval "$1='$s'"
}

# remove the blank char ' ' at the end of a string. 
#
# $1 : the name of the result variable 
# $2 : the orignal string
#
strTrimRight(){
    len=${#2}    
    echo "len:$len"
    s="$2"
    i=1
    while [ $i -le $len  ]
    do
	testch="${s:(-${i}):1}"
	if [ "$testch" = ' ' ];then
	    let i=i+1
	else
	    break
	fi
    done
    #echo "first none empty char from right is $i"
    let j=$len-$i+1
    #echo "j:$j i:$i len:$len"
    s="${s:0:j}"
    eval "$1='$s'"
}

# remove the empty chars at the beginning and the end of a string. 
#
# $1 : the name of the result variable
# $2 : the original string.
#
strTrim(){
    v="$2"
    strTrimLeft "$1" "$v"
    echo "trim left:'${!1}'"

    strTrimRight "$1" "${s}"
    echo "trim right:'${!1}'"
    eval "$1='${!1}'"
}

# check if a string starts with another string.
#
# $1 : the name of the result variable. 'True' or 'False'
# $2 : the orginal string.
# $3 : the substring. Always return 'True' if $3 is ''
#
#
strStartWith(){
    lenFull=${#2}
    lenSub=${#3}

    if [ $lenFull -lt $lenSub ];then
	eval "$1='False'"
	return
    fi

    echo "$lenFull : $lenSub"

    i=0
    while [ $i -lt $lenSub -a $i -lt $lenFull ]
    do
	if [ "${2:${i}:1}" != "${3:${i}:1}" ];then
	    break
	fi
	let i=i+1
    done
    
    echo "i:$i"
    
    startW='False'
    if [ $i -eq $lenSub ];then
	startW='True'
    fi
    eval "$1=$startW"
}
