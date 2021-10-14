#!/bin/bash   
if [ $# -ne 1 ]; then
  echo “$0 requires 1 argument” >&2
  exit 1
fi

if [ ! -f $1 ]; then
  echo "File does not exist" <& 1
  exit 1
fi

dictionary = cat '/usr/share/dict/words'

while read line; do
    for word in $line; do
        if [ grep -c $word dictionary -lt 1 ]; then
          echo $word >> $1.spelling
          ((counter++))
        fi
    done
done

echo "The number of misspelled words are: $counter"

exit 0