#!/bin/bash

function comchar() {
    case "$1" in
        java|cpp|c)
            echo '//'
            ;;
        lisp|elisp)
            echo ';'
            ;;
        *)
            echo '#'
            ;;
    esac
}

COMMENT_CHARACTER=$(comchar $2)

#Compute number of lines in the file
NUM_LINES=$(cat $1 | wc -l)

#Compute number of lines that are comments
NUM_COMMENTS=$(grep "^\s*${COMMENT_CHARACTER}" $1 | wc -l)

#Compute number of blank lines
NUM_BLANK=$(grep "^s*$" $1 | wc -l)

#Compute lines with only braces
NUM_BRACES=$(grep "^s*[{}]$" $1 | wc -l)

#Compute code lines aka everything not considered a comment, blank line, or braces.
NUM_CODE=$(($NUM_LINES-$NUM_COMMENTS-$NUM_BLANK-$NUM_BRACES))

echo -e "Total Lines:\t$NUM_LINES" 
echo -e "Comments:\t$NUM_COMMENTS"
echo -e "Blank Lines:\t$NUM_BLANK"
echo -e "Only Braces:\t$NUM_BRACES"
echo -e "Actual Code:\t$NUM_CODE"
