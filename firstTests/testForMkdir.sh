#!/bin/bash
STRING="./test/toto/tata/tutu/tété/titi.txt"

ARRAY=$(sed 's/[\/]/ /g' <<< $STRING)

FOLDERS=($ARRAY)
#last array iteration
FILE=${FOLDERS[-1]}
unset FOLDERS[-1]
ROOT_FOLDER=$PWD

# for (FOLDER in ${FOLDERS[@]})
# do
#     mkdir $FOLDER
#     cd $FOLDER
# done

for (( i=0; i<${#FOLDERS[@]}; i++ ));
do
    FOLDER=${FOLDERS[i]}
    if [ $FOLDER != '.' ]; then
        echo $FOLDER
        mkdir -p $FOLDER
        cd $FOLDER
    fi
done

touch $FILE
cd $ROOT_FOLDER

# not finished yet
# I am trying to get an array with the provided file name like "./test/directory/directory/file"
# the period will be deleted, and the slash are used to separate my array iterations
# all array iterations are directories to create
# and the last iteration is the file name to create
