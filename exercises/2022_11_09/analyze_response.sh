#!/bin/bash

RESPONSE=$(egrep -m 1 "HTTP" $1 | cut -d' ' -f2)
echo $RESPONSE
