#!/usr/bin/env bash

RECORD_DIR="$HOME/Downloads"
FILE="$RECORD_DIR/recording-$(date +%Y%m%d-%H%M%S).mp4"

mkdir -p "$RECORD_DIR"

if pgrep -x wf-recorder >/dev/null; then
    pkill -INT wf-recorder
    notify-send \
    -a "Screen Recorder" \
    -h string:x-canonical-private-synchronous:recording \
    "Recording Stopped"
else
    notify-send \
    -a "Screen Recorder" \
    -h string:x-canonical-private-synchronous:recording \
    "🔴 Recording"

    wf-recorder \
    --audio \
    --audio-source="$(pactl get-default-sink).monitor" \
    -g "$(slurp)" \
    -f "$FILE" &

    sleep 0.5

    if pgrep -x wf-recorder >/dev/null; then
        notify-send \
        -a "Screen Recorder" \
        "Recording Started"
    fi
fi
