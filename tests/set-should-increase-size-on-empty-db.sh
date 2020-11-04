#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source $DIR/../bashdb.sh

bashdb_set testdb a 1

value=$(bashdb_size testdb)
if [ "$value" == "0" ]; then
  exit -1
fi
