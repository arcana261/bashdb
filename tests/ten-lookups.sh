
#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source $DIR/../bashdb.sh

bashdb_set testdb j 10
value=$(bashdb_get testdb j)
if [ "$value" != "10" ]; then
  exit -1
fi

bashdb_set testdb i 9
value=$(bashdb_get testdb i)
if [ "$value" != "9" ]; then
  exit -1
fi
value=$(bashdb_get testdb j)
if [ "$value" != "10" ]; then
  exit -1
fi

bashdb_set testdb h 8
value=$(bashdb_get testdb h)
if [ "$value" != "8" ]; then
  exit -1
fi
value=$(bashdb_get testdb i)
if [ "$value" != "9" ]; then
  exit -1
fi
value=$(bashdb_get testdb j)
if [ "$value" != "10" ]; then
  exit -1
fi

bashdb_set testdb g 7
value=$(bashdb_get testdb g)
if [ "$value" != "7" ]; then
  exit -1
fi
value=$(bashdb_get testdb h)
if [ "$value" != "8" ]; then
  exit -1
fi
value=$(bashdb_get testdb i)
if [ "$value" != "9" ]; then
  exit -1
fi
value=$(bashdb_get testdb j)
if [ "$value" != "10" ]; then
  exit -1
fi

bashdb_set testdb a 1
value=$(bashdb_get testdb a)
if [ "$value" != "1" ]; then
  exit -1
fi
value=$(bashdb_get testdb g)
if [ "$value" != "7" ]; then
  exit -1
fi
value=$(bashdb_get testdb h)
if [ "$value" != "8" ]; then
  exit -1
fi
value=$(bashdb_get testdb i)
if [ "$value" != "9" ]; then
  exit -1
fi
value=$(bashdb_get testdb j)
if [ "$value" != "10" ]; then
  exit -1
fi

bashdb_set testdb b 2
value=$(bashdb_get testdb a)
if [ "$value" != "1" ]; then
  exit -1
fi
value=$(bashdb_get testdb b)
if [ "$value" != "2" ]; then
  exit -1
fi
value=$(bashdb_get testdb g)
if [ "$value" != "7" ]; then
  exit -1
fi
value=$(bashdb_get testdb h)
if [ "$value" != "8" ]; then
  exit -1
fi
value=$(bashdb_get testdb i)
if [ "$value" != "9" ]; then
  exit -1
fi
value=$(bashdb_get testdb j)
if [ "$value" != "10" ]; then
  exit -1
fi

bashdb_set testdb c 3
value=$(bashdb_get testdb a)
if [ "$value" != "1" ]; then
  exit -1
fi
value=$(bashdb_get testdb b)
if [ "$value" != "2" ]; then
  exit -1
fi
value=$(bashdb_get testdb c)
if [ "$value" != "3" ]; then
  exit -1
fi
value=$(bashdb_get testdb g)
if [ "$value" != "7" ]; then
  exit -1
fi
value=$(bashdb_get testdb h)
if [ "$value" != "8" ]; then
  exit -1
fi
value=$(bashdb_get testdb i)
if [ "$value" != "9" ]; then
  exit -1
fi
value=$(bashdb_get testdb j)
if [ "$value" != "10" ]; then
  exit -1
fi

bashdb_set testdb e 5
value=$(bashdb_get testdb a)
if [ "$value" != "1" ]; then
  exit -1
fi
value=$(bashdb_get testdb b)
if [ "$value" != "2" ]; then
  exit -1
fi
value=$(bashdb_get testdb c)
if [ "$value" != "3" ]; then
  exit -1
fi
value=$(bashdb_get testdb e)
if [ "$value" != "5" ]; then
  exit -1
fi
value=$(bashdb_get testdb g)
if [ "$value" != "7" ]; then
  exit -1
fi
value=$(bashdb_get testdb h)
if [ "$value" != "8" ]; then
  exit -1
fi
value=$(bashdb_get testdb i)
if [ "$value" != "9" ]; then
  exit -1
fi
value=$(bashdb_get testdb j)
if [ "$value" != "10" ]; then
  exit -1
fi

bashdb_set testdb d 4
value=$(bashdb_get testdb a)
if [ "$value" != "1" ]; then
  exit -1
fi
value=$(bashdb_get testdb b)
if [ "$value" != "2" ]; then
  exit -1
fi
value=$(bashdb_get testdb c)
if [ "$value" != "3" ]; then
  exit -1
fi
value=$(bashdb_get testdb d)
if [ "$value" != "4" ]; then
  exit -1
fi
value=$(bashdb_get testdb e)
if [ "$value" != "5" ]; then
  exit -1
fi
value=$(bashdb_get testdb g)
if [ "$value" != "7" ]; then
  exit -1
fi
value=$(bashdb_get testdb h)
if [ "$value" != "8" ]; then
  exit -1
fi
value=$(bashdb_get testdb i)
if [ "$value" != "9" ]; then
  exit -1
fi
value=$(bashdb_get testdb j)
if [ "$value" != "10" ]; then
  exit -1
fi

bashdb_set testdb f 6
value=$(bashdb_get testdb a)
if [ "$value" != "1" ]; then
  exit -1
fi
value=$(bashdb_get testdb b)
if [ "$value" != "2" ]; then
  exit -1
fi
value=$(bashdb_get testdb c)
if [ "$value" != "3" ]; then
  exit -1
fi
value=$(bashdb_get testdb d)
if [ "$value" != "4" ]; then
  exit -1
fi
value=$(bashdb_get testdb e)
if [ "$value" != "5" ]; then
  exit -1
fi
value=$(bashdb_get testdb f)
if [ "$value" != "6" ]; then
  exit -1
fi
value=$(bashdb_get testdb g)
if [ "$value" != "7" ]; then
  exit -1
fi
value=$(bashdb_get testdb h)
if [ "$value" != "8" ]; then
  exit -1
fi
value=$(bashdb_get testdb i)
if [ "$value" != "9" ]; then
  exit -1
fi
value=$(bashdb_get testdb j)
if [ "$value" != "10" ]; then
  exit -1
fi
