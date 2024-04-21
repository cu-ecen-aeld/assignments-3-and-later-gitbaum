#!/bin/bash

if [ $# -ne 2 ]; then
    echo "Usage: $0 <WRITEFILE> <STR>"
    exit 1
fi

FILE=$1
STR=$2

FILEPATH=$(dirname $FILE)
mkdir -p "$FILEPATH"
RESULT=$?
if [ $RESULT -ne 0 ]; then
   echo "Path \"$FILEPATH\" couldnt be created"
   exit 1
fi
   
echo $STR > $FILE
RESULT=$?
if [ $RESULT -ne 0 ]; then
   echo "File \"$FILE\" couldnt be written"
   exit 1
fi

exit 0
