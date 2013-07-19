#!/bin/bash
BASEDIR=$(dirname $0)

if [ -f "$BASEDIR/config.sh" ]
then
	source "$BASEDIR/config.sh"
else
	source "$BASEDIR/config.example.sh"
fi

notify-send --expire-time=5000 "$BASEDIR"

import "$path/$name.png"
$editor "$path/$name.png"

upload=$(curl -F 'files[]'="@$path/$name.png;type=image/png" http://vanchester.ru/pic)

if [[ "$upload" =~ \"name\":\"([a-z0-9]+)\" ]] 
then
	url="http://vanchester.ru/pic/${BASH_REMATCH[1]}"
	notify-send --expire-time=5000 "Screenshot uploaded successfuly!" "$name.png<br>$url"
	echo $url | xclip
else
	notify-send "Sreenshot upload error :("
fi
