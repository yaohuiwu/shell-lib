
# relace a key with given value in a file.
#
# $3 the file
# $1 the key
# $2 the value
prop.setProperty(){
   echo "set ($1,$2) in $3"
   
   sed -i.bak 's/'"$1"'/'"$2"'/g' $3
   if [ "$4" == "removeBak" ];then
       rm -f ${3}.bak
   fi
}

# set the value of multipule property in a file at once. 
#
# $1 : the file
# $2..$n : name value pairs in 'name=value' format. 
prop.setProperties(){
    
    i=2
    while [ $i -le $# ]
    do
	key=`echo "${!i}" | awk -F '=' '{print $1}'`
	value=`echo "${!i}" | awk -F '=' '{print $2}'`

	if [ "$key" -a "$value" ];then
	    cmd=$cmd's/'"$key"'/'"$value"'/g;'
	fi

	let i=i+1
    done
    cmd="${cmd}"

    #echo "$cmd"
    sed -i.bak "$cmd" $1
}

# get value of a key from a property file
#
# $2 the file
# $1 the key
prop.getProperty(){
   echo `cat $2 | sed -n '/^'"$1"='/p'| awk -F '=' '{print $2}'`   
}

# replace the place holders in config files.
#
# $1 the placeholder file
# $2 the config directory
prop.replacePlaceholders(){
    target_file=''

    while read line
    do
        # test first char
        head_ch=${line:0:1}
        if [ "$head_ch" = '#' ];then
            target_file=$2/${line:1}
            continue
        fi

        key=`echo "$line" | awk -F '=' '{print $1}'`
        # skip empty line
        if [ -z "$key" ];then
            continue
        fi
        value=`echo "$line" | awk -F '=' '{print $2}'`

        if [ -e $target_file ];then
            prop.setProperty "$key" "$value" $target_file
	else
	    echo "ERROR: $target_file not exists!"
        fi
    done < $1
}

