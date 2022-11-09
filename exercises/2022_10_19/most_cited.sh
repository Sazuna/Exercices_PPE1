#!/bin/bash

ANNEE=$1
TYPE=$2

cat Fichiers/$ANNEE*.ann | egrep $TYPE | cut --output-delimiter="\t" --field 3 | sed "s/T1//g" | sort | uniq -c | sort -n --reverse

#remplacer ancien par nouveau
#sed "s/ancien/nouveau/g"
