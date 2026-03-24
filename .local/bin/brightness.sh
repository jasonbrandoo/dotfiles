#!/bin/bash

read c < /sys/class/backlight/intel_backlight/brightness
read m < /sys/class/backlight/intel_backlight/max_brightness
p=$((c * 100 / m))

notify-send -h int:value:$p -h string:x-canonical-private-synchronous:brightness -h boolean:transient:true -t 800 "Brightness" "$p%"
