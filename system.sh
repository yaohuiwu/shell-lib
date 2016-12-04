#!/usr/bin/env sh

TRUE=0
FALSE=1

# is a group exists ?
sysGroupExist(){
	if [ -z `cat /etc/group | awk -F: '{if($1 ~ /^'"$1"'$/) print $1}'` ];then
		return $FALSE 
	else
		return $TRUE
	fi 
}

# is a user exists ?
sysUserExist(){
	if [ -z `cat /etc/passwd | awk -F: '{if($1 ~ /^'"$1"'$/) print $1}'` ];then
		return $FALSE 
	else
		return $TRUE
	fi 
}

# check if a command is in PATH by 'which' and exit if not.
#
# $1 the command
sysRequire(){
    cmdPath=`which $1`
    if [ -z "$cmdPath" ];then
	echo "require $1 in PATH. I will exit."
	exit 1
    else
	echo "found $1 in $cmdPath"
    fi	    
}

# check if all command in argument list is in PATH and exit if any of them not.
# 
sysRequireAll(){
      for f in "$@"
      do
	sysRequire $f
      done    
}
