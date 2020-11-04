#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source $DIR/../bashdb.sh

bashdb_set testdb hello world
bashdb_remove testdb hello
value=$(bashdb_get testdb hello)

if [ "$value" != "" ]; then
  exit -1
fi
