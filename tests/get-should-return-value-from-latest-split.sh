
#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source $DIR/../bashdb.sh

bashdb_set testdb a 1

function _arcana261_bashdb_sscollection_should_split() {
  echo "1"
}

bashdb_set testdb a 2
bashdb_set testdb a 3

value=$(bashdb_get testdb a)

if [ "$value" != 3 ]; then
  exit -1
fi
