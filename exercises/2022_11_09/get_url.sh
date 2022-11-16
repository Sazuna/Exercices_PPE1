#!/bin/bash
WORD=$1
OUTPUT_NUMBER=0

if [ ! -d $WORD ]
then
	mkdir $WORD
fi

echo "getting URLs of $2..."
#for URL in $(cat $2)
while read -p text URL;
do
	if [[ "$URL" =~ ^https?:// ]]
	then
		echo "url : $URL"
		FILE="$WORD/$OUTPUT_NUMBER.txt"
		curl -i $URL > $FILE
		RESPONSE=$(./analyze_response.sh $FILE)
		echo $RESPONSE

		echo "$RESPONSE" > $WORD/$OUTPUT_NUMBER\_res.txt
		OUTPUT_NUMBER=$(expr $OUTPUT_NUMBER + 1 )
	else
		echo "$URL is not a valid url."
	fi
done < $2
