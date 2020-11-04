DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

source $DIR/sstable.sh

function _arcana261_bashdb_sscollection_set() {
  collection=$1
  key=$2
  value=$3

  should_split=$(_arcana261_bashdb_sscollection_should_split $collection)
  if [ "$should_split" == "1" ]; then
    _arcana261_bashdb_sscollection_split $collection
  fi

  if [ ! -f $collection/meta ]; then
    mkdir -p $collection
    echo "1" > $collection/meta
  fi

  n=$(cat $collection/meta)
  _arcana261_bashdb_sstable_set $collection/$n.db $key $value

  should_compact=$(_arcana261_bashdb_sscollection_should_compact $collection)
  if [ "$should_compact" == "1" ]; then
    _arcana261_bashdb_sscollection_compact $collection
  fi
}

function _arcana261_bashdb_sscollection_count() {
  collection=$1

  if [ ! -f $collection/meta ]; then
    echo "0"
  else
    result="0"
    n=$(cat $collection/meta)
    for i in $(seq 1 $n); do
      value=$(_arcana261_bashdb_sstable_count $collection/$i.db)
      result=$(( $result + $value ))
    done

    echo $result
  fi
}

function _arcana261_bashdb_sscollection_size() {
  collection=$1

  if [ ! -f $collection/meta ]; then
    echo "0"
  else
    result="0"
    n=$(cat $collection/meta)
    for i in $(seq 1 $n); do
      value=$(_arcana261_bashdb_sstable_size $collection/$i.db)
      result=$(( $result + $value ))
    done

    echo $result
  fi
}

function _arcana261_bashdb_sscollection_contains() {
  collection=$1
  key=$2

  value=$(_arcana261_bashdb_sscollection_get $collection $key)

  if [ "$value" == "" ]; then
    echo "0"
  else
    echo "1"
  fi
}

function _arcana261_bashdb_sscollection_get() {
  collection=$1
  key=$2

  if [ ! -f $collection/meta ]; then
    echo ""
  else
    result=""
    n=$(cat $collection/meta)

    for i in $(seq 1 $n); do
      value=$(_arcana261_bashdb_sstable_get $collection/$i.db $key)
      if [ "$value" != "" ]; then
        result=$value
      fi
    done

    if [ "$result" == "" ] || [ "$result" == "<REMOVED>" ]; then
      echo ""
    else
      echo $result
    fi
  fi
}

function _arcana261_bashdb_sscollection_remove() {
  collection=$1
  key=$2

  if [ -f $collection/meta ]; then
    n=$(cat $collection/meta)
    _arcana261_bashdb_sstable_remove $collection/$n.db $key
  fi
}

function _arcana261_bashdb_sscollection_should_split() {
  collection=$1

  if [ ! -f $collection/meta ]; then
    echo "0"
  else
    n=$(cat $collection/meta)
    size=$(_arcana261_bashdb_sstable_size $collection/$n.db)
    if [ "$size" -gt "4096" ]; then
      echo "1"
    else
      echo "0"
    fi
  fi
}

function _arcana261_bashdb_sscollection_should_compact() {
  collection=$1

  if [ ! -f $collection/meta ]; then
    echo "0"
  else
    n=$(cat $collection/meta)
    if [ "$n" -gt "16" ]; then
      echo "1"
    else
      echo "0"
    fi
  fi
}

function _arcana261_bashdb_sscollection_split() {
  collection=$1

  n="0"
  if [ -f $collection/meta ]; then
    n=$(cat $collection/meta)
  fi

  n=$(( $n + 1 ))

  echo "$n" > $collection/meta
}

function _arcana261_bashdb_sscollection_compact() {
  collection=$1

  if [ ! -f $collection/meta ]; then
    return 0
  fi

  cont="1"
  while [ "$cont" == "1" ]; do
    _arcana261_bashdb_sscollection_compact_once $collection

    n=$(cat $collection/meta)

    if [ "$n" -lt "2" ]; then
      cont="0"
    fi
  done
}

function _arcana261_bashdb_sscollection_compact_once() {
  collection=$1

  if [ ! -f $collection/meta ]; then
    return 0
  fi

  n=$(cat $collection/meta)

  if [ "$n" -lt "2" ]; then
    return 0
  fi

  if [ "$n" == "2" ]; then
    temp_file=$(mktemp)
    sort -m -u -t '|' -k 1,1 $collection/2.db $collection/1.db > $temp_file
    mv -f $temp_file $collection/1.db
    rm -f $collection/2.db
    echo "1" > $collection/meta

    return 0
  fi

  new_n="1"

  for i in $(seq 2 2 $n); do
    next=$(( i + 1 ))
    new_n=$(( new_n + 1 ))

    if [ "$next" -gt "$n" ]; then
      mv -f $collection/$i.db $collection/$new_n.db
    else
      temp_file=$(mktemp)
      sort -m -u -t '|' -k 1,1 $collection/$next.db $collection/$i.db > $temp_file
      mv -f $temp_file $collection/$new_n.db
      rm -f $collection/$next.db
      if [ "$new_n" != "$i" ]; then
        rm -f $collection/$i.db
      fi
    fi
  done

  echo "$new_n" > $collection/meta
}
