#!/usr/bin/env bash

. env.sh
. ${SH_LIB_DIR}/property.sh


tempFile='my1.txt'

prepare(){
 cp myTemplate.txt $tempFile
}

clean(){
rm $tempFile
rm ${tempFile}.bak
}


myName=$(prop.getProperty 'myName' my.txt)
myCompany=$(prop.getProperty 'myCompany' my.txt)

echo "myName is '$myName'"
echo "myCompany is '$myCompany'"

prepare

#lines that begin with the char '#' tell the to be replaced.
#lines after the file name line tells the variables to be processed. 
#
#myPlaceholder.txt : the placeholder file
#.		: the dir that contains the target file.
prop.replacePlaceholders myPlaceholder.txt .

echo "after replaced:"
cat $tempFile

clean


prepare

prop.setProperties $tempFile "yourName=bar" "yourCompany=barCompany"
echo "after replaced:"
cat $tempFile

#clean
