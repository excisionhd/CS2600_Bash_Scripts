#!/bin/bash

NUMBER=$(( ($RANDOM % 100)+1 ))

echo "Number is: $NUMBER"

while true; do

	GUESS=$(nc -l 5555)
	#GUESS=$(cat guess.txt)
	
	echo "Player guesses: $GUESS"
	
	sleep 1	
	
	if [ $GUESS -lt $NUMBER ] 
		then echo "Higher" > /dev/tcp/127.0.0.1/5555


	elif [ $GUESS -gt $NUMBER ]
		then echo "Lower" > /dev/tcp/127.0.0.1/5555

	elif [ $GUESS -eq $NUMBER ]
		then 
		echo "Done" > /dev/tcp/127.0.0.1/5555
		echo "Player guessed $GUESS.  Game over."
		exit
	fi



	sleep 1

done

