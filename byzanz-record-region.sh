#!/bin/bash
# Ref: http://askubuntu.com/questions/107726/how-to-create-animated-gif-images-of-a-screencast

# Delay before starting
DELAY=2

# Default recording duration
DEFDUR=5

# Standard screencast folder
FOLDER="$HOME/Pictures"

# Time and date
TIME=$(date +"%Y-%m-%d_%H%M%S")

# Sound notification to let one know when recording is about to start (and ends)
beep() {
    paplay /usr/share/sounds/freedesktop/stereo/message-new-instant.oga &
}

# Custom recording duration as set by user
USERDUR=$(gdialog --title "Duration?" --inputbox "Please enter the screencast duration in seconds" 200 100 2>&1)

# Duration and output file
if [ $USERDUR -gt 0 ]; then
    D=$USERDUR
    DURATION="--duration=${D}"
    notify-send "GIFRecorder" "Recording duration set by user to $D seconds. Recording will start in ${DELAY} seconds."
else
    D=$DEFDUR
    DURATION="--duration=${D}"
    notify-send "GIFRecorder" "Recording duration set by default to $D seconds. Recording will start in ${DELAY} seconds."
fi

# xrectsel from https://github.com/lolilolicon/xrectsel
ARGUMENTS=$(xrectsel "--x=%x --y=%y --width=%w --height=%h") || exit -1

echo -e "Byzanz will start after $DELAY seconds."
for (( i=$DELAY; i>0; --i )) ; do
    echo $i
    sleep 1
done

beep
byzanz-record -c --verbose --delay=0 ${ARGUMENTS} ${DURATION} ${FOLDER}/GIFrecord_${TIME}.gif
beep

# Notify the user of end of recording.
notify-send "GIFRecorder" "Screencast saved to $FOLDER/GIFrecord_$TIME.gif"
