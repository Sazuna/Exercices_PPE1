#!/bin/bash

while (test "$#" -gt "0"); do
	ls Fichiers/$1*.ann > $1.txt
	shift
done
