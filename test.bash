#!/bin/bash
##############################################################################
#
# Randomly pick a BroncoName and extract last name from about file.
#
##############################################################################
STUDENT_DIR=/path/to/students

# Get how many students in the class
NUM_STUDENTS=$(ls -1d $STUDENT_DIR/[a-z]* | wc -l)

# Use $RANDOM environment variable to get a random number
#  between 1 and $NUM_STUDENTS
RANDOM_NUM=$(($RANDOM % $NUM_STUDENTS + 1))

# Obtain the BroncoName of the student without its path information
FULL_BPATH=$(ls -1d $STUDENT_DIR/[a-z]* | head -n $RANDOM_NUM | tail -n 1)
BRONCONAME=$(basename $FULL_BPATH)

# Now get the student's last name.  Display to screen is by default the
#  output of the last command
head -n 4 $STUDENT_DIR/$BRONCONAME/about | tail -n 1 | cut -d',' -f1 
