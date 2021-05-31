#!/bin/sh
TRACK_NAME=`osascript -e 'tell application "Music" to get the name of the current track'`
TRACK_ALBUM=`osascript -e 'tell application "Music" to get the album of the current track'`
TRACK_ARTIST=`osascript -e 'tell application "Music" to get the artist of the current track'`
TRACK_YEAR=`osascript -e 'tell application "Music" to get the year of the current track'`
TRACK_GENRE=`osascript -e 'tell application "Music" to get the genre of the current track'`
TRACK_TIME=`osascript -e 'tell application "Music" to get the finish of the current track'`
TRACK_POS=`osascript -e 'tell application "Music" to get the player position'`

echo \{\"name\":\"$TRACK_NAME\",\"album\":\"$TRACK_ALBUM\",\"artist\":\"$TRACK_ARTIST\",\"year\":\"$TRACK_YEAR\",\"genre\":\"$TRACK_GENRE\",\"duration\":\"$TRACK_TIME\",\"position\":\"$TRACK_POS\"\} 
