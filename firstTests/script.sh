#!/bin/bash

#$0 c'est le nom du script
PRENOM=$1
NOM=$2
#peut aller jusqu'à $9

#quitte le script si le code résultat de l'exécution est différent de 0
set -e

usage()
{
	echo -e "\e[0;49;39mUsage\e[0;39;49m: $0  <prénom> <nom>\e[0m"
}

# $# donne le nombre de paramètres
if [ $# != 2 ]; then
	usage;
	exit 1;
fi;

# la commande shift décalera les arguments d'un numéro vers l'arrière

for WORD in $PRENOM $NOM
do
	echo -e "wow la boucle sur ${WORD}!!"
done

# Mettre les variables en lecture seule
readonly PRENOM
readonly NOM

# $* affichera la liste des arguments
echo "vous avez tapé $0 $* ";
echo "Coucou les tagazous, c'est $PRENOM $NOM !!!";
