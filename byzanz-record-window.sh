#!/bin/bash

# Delay before starting
DELAY=2

# Sound notification to let one know when recording is about to start (and ends)
beep() {
    paplay /usr/share/sounds/KDE-Im-Irc-Event.ogg &
}

# Duration and output file
if [ -z ${1} ]; then
    echo -e "Default recording duration 10s"
    D="--duration=10"
else
    D="--duration=${1}"
fi

if [ -z ${2} ]; then
    echo -e "Default filename is /tmp/recorded.git"
    FILENAME="/tmp/recorded.gif"
else
    FILENAME="${2}"
    echo -e "Filename: ${FILENAME}"
fi

XWININFO=$(xwininfo)
read X <<< $(awk -F: '/Absolute upper-left X/{print $2}' <<< "$XWININFO")
read Y <<< $(awk -F: '/Absolute upper-left Y/{print $2}' <<< "$XWININFO")
read W <<< $(awk -F: '/Width/{print $2}' <<< "$XWININFO")
read H <<< $(awk -F: '/Height/{print $2}' <<< "$XWININFO")

echo Delaying $DELAY seconds. After that, byzanz will start
for (( i=$DELAY; i>0; --i )) ; do
    echo $i
    sleep 1
done

beep
byzanz-record --verbose --delay=0 ${D} --x=$X --y=$Y --width=$W --height=$H ${FILENAME}
beep
