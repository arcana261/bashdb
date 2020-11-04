#!/bin/bash

result="0"

for t in $(ls tests/); do
  echo -n "$t... "
  rm -rf testdb
  bash tests/$t
  if [ "$?" != "0" ]; then
    printf '\033[0;31m'
    echo "[FAILED]"
    printf '\033[0m'
    result="-1"
  else
    printf '\033[0;32m'
    echo "[OK]"
    printf '\033[0m'
  fi
done

exit $result
