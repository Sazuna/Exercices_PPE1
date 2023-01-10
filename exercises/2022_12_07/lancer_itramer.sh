#!/bin/bash

./itramer.sh ~/Documents/TAL/projet/PPE1/generated/dump-texts/méli-mélo fr
./itramer.sh ~/Documents/TAL/projet/PPE1/generated/dump-texts/dazahui zh
./itramer.sh ~/Documents/TAL/projet/PPE1/generated/dump-texts/batiburrillo es
CONCAT_F="./generated/itramer/concat.xml"

echo "" > $CONCAT_F
for file in $(ls itramer/itramer-*)
do
	cat $file >> $CONCAT_F
done
