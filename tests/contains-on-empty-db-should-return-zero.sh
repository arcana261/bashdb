#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source $DIR/../bashdb.sh

value=$(bashdb_contains testdb a)
if [ "$value" != "0" ]; then
  exit -1
fi
