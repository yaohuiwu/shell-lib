#!/usr/bin/env sh

TRUE=1
FALSE=0

#readonly TRUE
#readonly FALSE

# is a group exists ?
# 	0 	:	if empty
#	1 	:	if not empty
sys_is_group_exists(){
	if [ -z `cat /etc/group | awk -F: '{if($1 ~ /^'"$1"'$/) print $1}'` ];then
		echo $FALSE 
	else
		echo $TRUE
	fi 
}

# is a user exists ?
# 	0 	:	if empty
#	1 	:	if not empty
sys_is_user_exists(){
	if [ -z `cat /etc/passwd | awk -F: '{if($1 ~ /^'"$1"'$/) print $1}'` ];then
		echo $FALSE 
	else
		echo $TRUE
	fi 
}
