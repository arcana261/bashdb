DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

source $DIR/internal/sscollection.sh

function bashdb_set() {
  db=$1
  key=$2
  value=$3

  _arcana261_bashdb_sscollection_set $db $key $value
}

function bashdb_get() {
  db=$1
  key=$2

  _arcana261_bashdb_sscollection_get $db $key
}

function bashdb_remove() {
  db=$1
  key=$2

  _arcana261_bashdb_sscollection_remove $db $key
}

function bashdb_contains() {
  db=$1
  key=$2

  _arcana261_bashdb_sscollection_contains $db $key
}

function bashdb_count() {
  db=$1

  _arcana261_bashdb_sscollection_count $db
}

function bashdb_size() {
  db=$1

  _arcana261_bashdb_sscollection_size $db
}
