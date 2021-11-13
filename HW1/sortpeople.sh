#!/bin/sh
set -e

if [ $# -ne 1 ]; then
  echo "$0 requires 1 argument" >2
  exit 1
fi

if [ ! -f $1 ]; then
  echo "File does not exist" >2
  exit 1
fi

cat $1 | cut -d ' ' -f 2 | sort