#!/bin/bash

active_class=$(hyprctl activewindow -j | jq -r '.class')
address="0x$(hyprctl activewindow | head -n 1 | awk '{print $2}')"

if [[ "$active_class" == "firefox" ]]; then
  hyprctl dispatch sendshortcut SHIFT+CONTROL, TAB, address:"$address"
elif [[ "$active_class" == "kitty" ]]; then
  hyprctl dispatch sendshortcut SHIFT+CONTROL, LEFT, address:"$address"
fi
