#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source $DIR/../bashdb.sh

bashdb_set testdb hello world

value=$(bashdb_get testdb hello)
if [ "$value" != "world" ]; then
  exit -1
fi
