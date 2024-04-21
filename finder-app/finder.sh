#!/bin/bash

if [ $# -ne 2 ]; then
    echo "Usage: $0 <FILESDIR> <SEARCHSTR>"
    exit 1
fi

FILESDIR=$1
SEARCHSTR=$2

if [ ! -d $FILESDIR ]; then
    echo "\"$FILESDIR\" is not a directory"
    exit 1
fi

NUMFILES=$(find $FILESDIR -type f | wc -l)

FILES=$(find $FILESDIR -type f)
ALL_MATCHES=0
for f in $FILES; do
    MATCHES=$(grep -c $SEARCHSTR $f)
    ALL_MATCHES=$((ALL_MATCHES + MATCHES))
done

echo "The number of files are $NUMFILES and the number of matching lines are $ALL_MATCHES"
exit 0 
