#!/bin/bash
STRING="test toto tata tutu tété titi"
#convert a string into STRING
FOLDERS=($STRING)
#last array iteration
FILE=${FOLDERS[-1]}

unset FOLDERS[-1]
ROOT_FOLDER=$PWD

for FOLDER in ${FOLDERS[@]}
do
    mkdir $FOLDER
    cd $FOLDER
done
touch $FILE
cd $ROOT_FOLDER