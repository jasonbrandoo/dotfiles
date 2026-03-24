#!/bin/bash

p=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print int($2*100)}')
echo $p

notify-send -h int:value:$p -h string:x-canonical-private-synchronous:volume -h boolean:transient:true -t 800 "Volume" "$p%"
