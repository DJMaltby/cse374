#!/bin/bash   
if [ $# -ne 1 ]; then
  echo “$0 requires 1 argument” >&2
  exit 1
fi

if [ ! -f $1 ]; then
  echo "File does not exist" <& 1
  exit 1
fi

COUNTER=0
while read line; do
    for word in $line; do
      v=$(grep -i "$word" /usr/share/dict/words)
      if [ -z "$v" ]; then
        echo $word >> $1.spe
        ((COUNTER++))
      fi
    done
done <"$1" 

echo "The number of misspelled words are: $COUNTER"

exit 0