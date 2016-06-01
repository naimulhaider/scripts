#!/bin/bash


name=${1:-.env}

while read -r line
do
	line=`echo "$line" | sed -e 's/^ *//' -e 's/ *$//'`

	if [[ X"" = X"$line" ]]
	then
		continue
	fi

	key=${line%%=*}
	value=${line#*=}

	export $key=$value
done < $name
