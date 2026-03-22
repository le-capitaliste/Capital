#!/bin/bash

dir="$HOME/Wallpapers"

SELECTED=$(find "$dir" -type f \( \
  -iname "*.jpg" -o \
  -iname "*.png" -o \
  -iname "*.gif" -o \
  -iname "*.jpeg" \
  \) | wofi --dmenu --prompt "Choose Wallpaper")

[ -z "$SELECTED" ] && exit 0

swww img "$SELECTED" --transition-type wipe --transition-duration 1
