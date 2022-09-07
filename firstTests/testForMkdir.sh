#!/bin/bash

RELATIVE="test toto trur toto tutu"
DIRECTORIES=$( echo "$RELATIVE" | rev | cut -f 1 | rev )
echo $DIRECTORIES
i=0;
# for ELEMENT in $RELATIVE
# do
#     echo $ELEMENT
# done