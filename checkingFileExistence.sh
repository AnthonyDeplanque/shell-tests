#!/bin/bash

set -e

ARGUMENTS=$*;

function usage(){
    echo -e "\033[0;33mUsage : $0 \033[0;36m<FILE or FILES...>\033[0m";
}

if [ $# == 0 ]; then 
    usage;
    exit 2;
fi;

for ELEMENT in $ARGUMENTS
do 
    if [ -f $ELEMENT ]; then
        echo -e "\033[4;36m$ELEMENT\033[0;32m exists\033[0m";
    else
        echo -e "\033[4;36m$ELEMENT\033[0;31m doesn't exist\033[0m";
    fi;
done