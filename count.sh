#!/bin/bash

set -e

read -p "quel est le chiffre ?" CHIFFRE

while [ $CHIFFRE -gt 0 ]
do
    echo "le compteur est à $CHIFFRE"
    CHIFFRE=`expr $CHIFFRE - 1`
done
echo "compteur fini"
exit 0