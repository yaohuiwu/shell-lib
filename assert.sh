#!/usr/bin/env sh

TRUE=1
FALSE=0

# is two integer equal to each other ?
# parameters
# 	$1 	:	original integer
#	$2 	:	expected integer
#	$3  : 	message to print if test failed
assert_i_equal(){
	if [ $1 -ne $2 ];then
		echo "$1 not equal to $2 : $3"
	else
		echo 'OK'
	fi
}

# is a integer true ?
#	$1	: 	original integer
#	$2	:	message to print if $1 not true
assert_i_true(){
	assert_i_equal $1 $TRUE "$2"
}


# is a integer false ?
#	$1	: 	original integer
#	$2	:	message to print if $1 not true
assert_i_false(){
	assert_i_equal $1 $FALSE "$2"
}
