#!/bin/bash

# run scripts/2_work.expect 24m times
#+ unless those titles already exist

END=24000
NUM=$(find titles/ -name 'title*' -type f |wc -l)
if [ $NUM == $END ]; then
	echo "already have $END titles"
	exit 0
else
	START=1
	for (( c=$START; c<=$END; c++ )); do
		echo "creating title number $i"
		mkdir -p titles/$c/
		cd  titles/$c/
		../../scripts/2_create.expect
		cd ../../
	done
fi
