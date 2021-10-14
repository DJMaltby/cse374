#!/bin/bash   
if [ $# -ne 1 ]; then
  echo “$0 requires 1 argument” >&2
  exit 1
fi

if [ ! -f $1 ]; then
  echo "File does not exist" <& 1
  exit 1
fi

sed 's/[0-9]*//g' $1 > temp.txt

tr -d '[:punct:]' < temp.txt > output.txt

COUNTER=0
while read line; do
    for word in $line; do
      v=$(grep -i -w "$word" /usr/share/dict/words)
      if [ -z "$v" ]; then
        echo $word >> $1.spelling
        ((COUNTER++))
      fi
    done
done <"output.txt" 

echo "The number of misspelled words are: $COUNTER"

exit 0