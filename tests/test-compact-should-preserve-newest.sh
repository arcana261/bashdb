#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source $DIR/../bashdb.sh

bashdb_set testdb a 1

function _arcana261_bashdb_sscollection_should_split() {
  echo "1"
}

bashdb_set testdb a 2
bashdb_set testdb a 3
bashdb_set testdb a 4

_arcana261_bashdb_sscollection_compact testdb

value=$(bashdb_get testdb a)

if [ "$value" != "4" ]; then
  exit -1
fi
