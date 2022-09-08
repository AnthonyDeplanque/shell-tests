#!/bin/bash

set -e

function usage(){
    clear
    echo ""
    echo -e "\033[1;33m1. \033[1;32mCréer\033[0m un fichier"
    echo -e "\033[1;33m2. \033[1;31mSupprimer\033[0m un fichier"
    read -p "Que voulez vous faire ?" CHOIX;
    echo ""
    echo ""
}

function checkingFileExistence(){
    if [ -f $FICHIER ]; then
        echo -e "\033[4;36m$FICHIER\033[0;32m existe\033[0m";
        R=0;
    else
        echo -e "\033[4;36m$FICHIER\033[0;31m n'existe pas\033[0m";
        R=1;
    fi;
}


function createPathAndFile(){

    ARRAY=$(sed 's/[\/]/ /g' <<< $FICHIER)

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
        
        #do nothing if the first array iteration is a period
        if [ $FOLDER != '.' ]; then
            echo -e "\033[1;33m$FOLDER\033[0m créé dans \033[0;36m$PWD\033[0m"
            mkdir -p $FOLDER
            cd $FOLDER
        fi
    done

    touch $FILE
    cd $ROOT_FOLDER
}

function createFile(){
    read -p "
Voulez vous insérer du contenu ? (y/n)" CHOIX_INSERTION
    while [[ $CHOIX_INSERTION != "y" && $CHOIX_INSERTION != "n" ]]
    do
        read -p "
Voulez vous insérer du contenu ? (y/n)" CHOIX_INSERTION
    done
    createPathAndFile
    echo ""
    if [ $CHOIX_INSERTION == "y" ]; then
        read -p "
Tapez ici ce que vous voulez insérer :" INSERTION
        `echo -e $INSERTION > $FICHIER`
    fi
    checkingFileExistence
    if [ $R == 0 ]; then
        echo -e "Le fichier a bien été créé !"
    else
        exit 4
    fi
}

function deleteFile(){
    rm $FICHIER
    checkingFileExistence
    if [ $R == 1 ]; then
        echo -e "Le fichier a bien été supprimé !"
    else
        exit 3
    fi
}

function abort(){
    echo -e "\033[1;31mAnnulation\033[0m";
    exit 0;
}


#########################################################
#                                                       #
#                   - SCRIPT START -                    #
#                                                       #
#########################################################



usage;

while [[ $CHOIX != 1 && $CHOIX != 2 && $CHOIX != "exit" ]]
do
    usage;
done

case $CHOIX in
    1) 
        echo -e "\033[1;32mCréer\033[0m un fichier";
        read -p "Donnez le nom du fichier à créer : " FICHIER
        checkingFileExistence
        while [ $R == 0 ]
        do
            read -p "Donnez le nom du fichier à créer : " FICHIER
            checkingFileExistence
        done
        echo -e "\033[1;32mCONFIRMER LA CREATION\033[0m (y/n): "
        read CHOIX
        while [[ $CHOIX != "y" && $CHOIX != "n" ]]
        do
            echo -e "\033[1;32mCONFIRMER LA CREATION\033[0m (y/n): "
            read CHOIX
        done
        if [[ $CHOIX == 'y' ]]; then
            createFile
        else 
            abort
        fi 
        ;;
    
    2)  
        echo -e "\033[1;31mSupprimer\033[0m un fichier";
        read -p "Donnez le nom du fichier à supprimer : " FICHIER
        checkingFileExistence
        while [ $R == 1 ]
        do
            read -p "Donnez le nom du fichier à supprimer : " FICHIER
            checkingFileExistence
        done
        echo -e "\033[1;31mCONFIRMER LA SUPPRESSION\033[0m (y/n): "
        read CHOIX
        while [[ $CHOIX != "y" && $CHOIX != "n" ]]
        do
            echo -e "\033[1;31mCONFIRMER LA SUPPRESSION\033[0m (y/n): "
            read CHOIX
        done
        if [ $CHOIX == 'y' ]; then
            deleteFile
        else
            abort;
        fi
        ;;
    
    "exit")
        abort;
        ;;
    
    *)
        exit 2;
        ;;
esac
echo ""
ls -l $FICHIER
echo ""
exit 0;