#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source $DIR/../bashdb.sh

bashdb_set testdb hello world
bashdb_set testdb hello another

value=$(bashdb_count testdb)

if [ "$value" != "1" ]; then
  exit -1
fi
