#!/bin/bash

if [ -f config.sh ]
then
	source config.sh
else
	source config.example.sh
fi

import "$path/$name.png"
$editor "$path/$name.png"

upload=$(curl -F 'files[]'="@$path/$name.png;type=image/png" http://vanchester.ru/pic)

if [[ "$upload" =~ \"name\":\"([a-z0-9]+)\" ]] 
then
	url="http://vanchester.ru/pic/${BASH_REMATCH[1]}"
	notify-send --expire-time=1000 "Screenshot uploaded successfuly!" "$name.png<br>$url"
	echo $url | xclip
else
	notify-send "Sreenshot upload error :("
fi
