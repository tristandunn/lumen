#!/bin/bash

active_class=$(hyprctl activewindow -j | jq -r '.class')
address="0x$(hyprctl activewindow | head -n 1 | awk '{print $2}')"

if [[ "$active_class" == "firefox" ]]; then
  hyprctl dispatch sendshortcut CONTROL, R, address:"$address"
fi
