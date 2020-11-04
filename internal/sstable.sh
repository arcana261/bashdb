
function _arcana261_bashdb_sstable_set() {
  sstable=$1
  key=$2
  value=$3

  if [ ! -f $sstable ]; then
    echo "$key|$value" >> $sstable
  else
    new_file=$(mktemp)
    temp_file=$(mktemp)

    echo "$key|$value" >> $new_file
    sort -m -u -t '|' -k 1,1 $new_file $sstable > $temp_file
    mv -f $temp_file $sstable
    rm -f $new_file
  fi
}

function _arcana261_bashdb_sstable_count() {
  sstable=$1

  if [ ! -f $sstable ]; then
    echo "0"
  else
    wc -l $sstable | awk '{print $1}'
  fi
}

function _arcana261_bashdb_sstable_size() {
  sstable=$1

  if [ ! -f $sstable ]; then
    echo "0"
  else
    ls -la $sstable | awk '{print $5}'
  fi
}

function _arcana261_bashdb_sstable_contains() {
  sstable=$1
  key=$2

  value=$(_arcana261_bashdb_sstable_get $sstable $key)

  if [ "$value" == "" ] || [ "$value" == "<REMOVED>" ]; then
    echo "0"
  else
    echo "1"
  fi
}

function _arcana261_bashdb_sstable_get() {
  sstable=$1
  key=$2

  if [ ! -f $sstable ]; then
    echo ""
  else
    look -b -t '|' $key $sstable | cut -d '|' -f 2
  fi
}

function _arcana261_bashdb_sstable_remove() {
  sstable=$1
  key=$2

  _arcana261_bashdb_sstable_set $sstable $key "<REMOVED>"
}
