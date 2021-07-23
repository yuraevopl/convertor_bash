#!/bin/bash

OLDIFS=$IFS
IFS=","

#create .yaml file
echo "Input (.yaml) file name: "
read filename
touch ${filename}.yaml

#if file exists and the write permission is granted.
if [ -w ${filename}.yaml ]
then
    while read -r -s id name amount remark
    do
        echo -e "
-

id: $id\n\
name: $name\n\
amount: $amount\n\
remark: $remark\n\
" >> ${filename}.yaml
    done < $1
else 
    echo ".yaml file not created"
fi

echo "Output file data? (y/n)"
read output
case $output in 
    Y | y)
    if [ -r ${filename}.yaml ]
    then 
    cat -n ${filename}.yaml 
    fi
    ;;
    N | n)
    echo "Conversion was successful, see you soon!" 
    ;;
    *)
    echo "Undefined value, please try again"
    ;;

esac

IFS=$OLDIFS