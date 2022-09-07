#!/bin/bash
set -e

FILE=$1
COMMAND=$2

# describe the script usage
function usage()
{
    echo -e "Usage: \033[0;33m $0 \033[0;36m<FILE> \033[0;32m<COMMAND : copy / read / delete>\033[0m"
}

# checking if two arguments are provided
if [ $# != 2 ]; then
    usage;
    exit 1;
fi

# checking if the file provided exists
function checkIfFileExists()
{
    if [ -f "$FILE" ]; then
        echo -e "\033[0;32mFile $FILE exists\033[0m";
        return 0;
    else
        echo -e "\033[40m\033[4;91m$FILE\033[0;91m\033[40m does not exists\033[0m";       
        return 1;
    fi
}

checkIfFileExists $FILE
    if [ $? -ne 0 ]; then
    exit 2;
fi

#switch case for command provided
case $COMMAND in

    "copy") #copying case
        echo -e "Copying \033[4;33m${FILE}\033[0m";
        mkdir -p tmp;
        cp $FILE ./tmp;
        if [ $? -eq 0 ]; then 
            echo -e "\033[4;32m$FILE\033[0;32m copied succesfully\033[0m";
            exit 0;
        else 
            echo -e "\033[0;91m\033[40merror\033[0m\033[0;31m copying \033[4;31m$FILE\033[0m";
            exit 3;
        fi;
        ;;

    "read") #reading case
        echo -e "Reading \033[4;33m${FILE}\033[0m";
        cat $FILE;
        if [ $? -eq 0 ]; then 
            echo -e "\033[0;32m$FILE \033[4;32mread succesfully\033[0m";
            exit 0;
        else 
            echo -e "\033[0;91m\033[40merror\033[0m\033[0;31m reading \033[4;31m$FILE\033[0m";
            exit 4;
        fi;
        ;;

    "delete") #deleting case
        echo -e "deleting \033[4;33m${FILE}\033[0m";
        rm $FILE;
        if [ $? -eq 0 ]; then 
            echo -e "\033[4;32m$FILE\033[0;32m deleted succesfully\033[0m";
            exit 0;
        else 
            echo -e "\033[0;91m\033[40merror\033[0m\033[0;31m deleting \033[4;31m$FILE\033[0m";
            exit 5;
        fi;
        ;;

    *) #if another case is provided, we describe the script usage
        usage;
        exit 6;
        ;;
esac