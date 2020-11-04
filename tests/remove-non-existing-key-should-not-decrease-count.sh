#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source $DIR/../bashdb.sh

bashdb_remove testdb hello
value=$(bashdb_count testdb)

if [ "$value" != "0" ]; then
  exit -1
fi
