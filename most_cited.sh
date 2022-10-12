#!/bin/bash

ANNEE=$1
TYPE=$2

echo $ANNEE

cat Fichiers/$ANNEE*.ann | grep $TYPE | cut --output-delimiter="\t" --field 3 | sed "s/T1//g" | sort | uniq --count | sort -n --reverse
