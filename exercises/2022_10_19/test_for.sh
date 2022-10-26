#!/bin/bash

N=0

for ELEMENT in a b c d e
do
	N=$(expr $N + 1)
	echo "le $N ieme élément est $ELEMENT"
done
