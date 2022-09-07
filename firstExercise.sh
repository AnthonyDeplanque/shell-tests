#!/bin/bash

set -e

echo -e "Bonjour à tous, je m'appelle Anthony"
echo -e "Formation Bash"

read -p "Quel est votre nom ? " NAME

read -p "Quel est votre age ? " AGE

echo -e "Bonjour ${NAME}, tu as ${AGE}ans"