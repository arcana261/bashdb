#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source $DIR/../bashdb.sh

bashdb_set testdb a 1
value=$(bashdb_contains testdb a)
if [ "$value" != "1" ]; then
  exit -1
fi
