#!/bin/bash

LOW=1
HIGH=100
CLOSEST_NUM=0
TRIES=0

while true; do
	TRIES=$(( $TRIES + 1 ))

	#GENERATE NUMBER FROM LOW TO HIGH
	PLAYER_GUESS=$((LOW + RANDOM%(1+HIGH-LOW)))

	#GUESS=$(( ($RANDOM % MAX_NUMBER) + 1 ))

	sleep 1

	echo $PLAYER_GUESS  > /dev/tcp/127.0.0.1/5555

	RESPONSE=$(nc -l 5555)
	
	if [ $RESPONSE == "Higher" ]
		then 
		LOW=$(( $PLAYER_GUESS + 1 ))
		HIGH=$HIGH
		echo "Number is Higher, LOW: $LOW HIGH: $HIGH; I Guess $PLAYER_GUESS"
		

	elif [ $RESPONSE == "Lower" ]
		then
		LOW=$LOW
		HIGH=$(( PLAYER_GUESS - 1 ))
		echo "Number is Lower, LOW: $LOW HIGH: $HIGH; I Guess $PLAYER_GUESS"

	elif [ $RESPONSE == "Done" ] 
		then
		echo "I finished in $TRIES tries."
		exit

	fi

	sleep 1


done
