#!/bin/bash

set -e

echo -e "this script will generate a Random number"
echo -e "You have to retrieve it !"

LIMIT=50
RANDOM=$$
R=$(($(($RANDOM%$LIMIT))))
NUMBER=0
while [ $NUMBER -ne $R ]
do 
    read -p "you have to find the number, what is it ? " NUMBER

    if [ $R -gt $NUMBER ]
    then
        echo "it's more !"

    elif [ $R -lt $NUMBER ]
    then
        echo "it's less !"
    fi
done

echo "number ${R} found !"
exit 0