[![Build Status](https://travis-ci.com/arcana261/bashdb.svg?branch=main)](https://travis-ci.com/arcana261/bashdb)

# bashdb
A keyvalue database written in bash, for bash!


    look -b -t '|' $key $sstable | cut -d '|' -f 2
## Motivation

This is just a fun project to better learn bash programming! That is all :) If you ever liked this project and found a real life use for it, please feel free to contact me :)

## How It Works

At the core, we use two beautiful commands:

1. `sort` command to merge, sort, unique and overally handle SSTables (Sorted Set Tables) on filesystem.
2. `look` command which does a binary search on out SSTables

An **SSTable** is just a fancy word for a file, sorted on a column. Easy! We use `sort` in the following way:

```bash
    sort -m -u -t '|' -k 1,1 $new_file $sstable > $temp_file
```

In this command:

* `-m` merges two sorted files instead of soring them
* `-u` makes result unique
* `-t '|'` is just our field seperator (column seperator) in the SSTable file
* `-k 1,1` tells sort to just use first column

Using command `sort` we maintain and also compact (merge) multiple SSTables together. Also for lookups, we perform the following:

```bash
    look -b -t '|' $key $sstable | cut -d '|' -f 2
```

In this command:

* `-b` performs a binary search of O(lg n)
* `-t '|'` is just our field seperator (column seperator) in the SSTable file
* `cut -d '|' -f 2` simply selects second column and prints it

## API

**bashdb_set <database> <key> <value>**

Add or overwrite a value to the database

**bashdb_get <database> <key> <value>**

Retrive previously set value in the database

**bashdb_contains <database> <key>**

Prints `1` if the key exists in the database, otherwise prints `0`.

**bashdb_remove <database> <key> <value>**

Removes a key from the database

**bashdb_count <databse>**

Returns number of items in the database
