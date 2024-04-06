#!/bin/bash

timer() {
	local N=$1
	shift

	(sleep $N && zenity --info --title="Time's Up" --text="${*:-BING}") &
	echo "timer set for $N"
}
