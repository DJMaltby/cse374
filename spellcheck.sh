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
        if
          grep $word # dictionary
        else
          $word >> linus.txt.spelling 
          ((counter++))
        fi
    done
done <"linus.txt" 

echo "The number of misspelled words are: $counter"

exit 0