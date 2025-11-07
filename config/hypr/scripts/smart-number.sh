#!/bin/bash

number=$1
active_class=$(hyprctl activewindow -j | jq -r '.class')
address="0x$(hyprctl activewindow | head -n 1 | awk '{print $2}')"

if [[ "$active_class" == "firefox" ]]; then
  hyprctl dispatch sendshortcut ALT, "$number", address:"$address"
fi
