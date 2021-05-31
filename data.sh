#!/bin/sh
RUNNING=`osascript -e 'tell application "System Events" to (name of processes) contains "Music"'`

if [ "$RUNNING" = true ]
then
TRACK_NAME=`osascript -e 'tell application "Music" to get the name of the current track'`
TRACK_ALBUM=`osascript -e 'tell application "Music" to get the album of the current track'`
TRACK_ARTIST=`osascript -e 'tell application "Music" to get the artist of the current track'`
TRACK_YEAR=`osascript -e 'tell application "Music" to get the year of the current track'`
TRACK_GENRE=`osascript -e 'tell application "Music" to get the genre of the current track'`
TRACK_TIME=`osascript -e 'tell application "Music" to get the finish of the current track'`
TRACK_POS=`osascript -e 'tell application "Music" to get the player position'`
IS_PAUSE=`osascript -e 'tell application "Music" to get the player state'`
elif [ "$RUNNING" = false ]
then
TRACK_NAME='Unknown'
TRACK_ALBUM='Unknown'
TRACK_ARTIST='Unknown'
TRACK_YEAR='Unknown'
TRACK_GENRE='Unknown'
TRACK_TIME='0'
TRACK_POS='0'
IS_PAUSE='paused'
fi

echo \{\"name\":\"$TRACK_NAME\",\"album\":\"$TRACK_ALBUM\",\"artist\":\"$TRACK_ARTIST\",\"year\":\"$TRACK_YEAR\",\"genre\":\"$TRACK_GENRE\",\"duration\":\"$TRACK_TIME\",\"position\":\"$TRACK_POS\",\"state\":\"$IS_PAUSE\"\} 
