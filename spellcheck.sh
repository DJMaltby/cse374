#!/bin/bash   
if [ $# -ne 1 ]; then
  echo “$0 requires 1 argument” >&2
  exit 1
fi

if [ ! -f $1 ]; then
  echo "File does not exist" <& 1
  exit 1
fi

# if word =/= word in dictionary
# ((counter++))
# echo “There were $counter spelling mistakes in the document”
exit 0