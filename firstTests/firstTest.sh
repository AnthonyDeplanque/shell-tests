#!/bin/bash
set -e
echo "entre les données du tableau"
read -a TABLEAU

for ELEMENT in ${TABLEAU[@]}
do
    echo ${ELEMENT}
done
exit 0