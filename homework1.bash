#!/bin/bash

FILE_DIR=usr/share/dict/words
WORD_COUNT=$(cat $FILE_DIR | wc -l)
RANDOM_NUM=$(($RANDOM % $WORD_COUNT+1))

cat usr/share/dict/words | grep -v "'" | head -n $RANDOM_NUM | tail -n 1
