#!/bin/sh

name=$(date +%Y-%m-%d_%I:%M:%S-$RANDOM)
outfile=~/Images/screenshot/$name.png
program=$(
  wofi -d -n -b -L 3 -- <<EOF
selection
screen
window
EOF
)

case $program in
selection)
  grim -g "$(slurp)" "$outfile" && wl-copy --type image/png <"$outfile"
  dunstify "Saved & copied: $name"
  ;;

screen)
  grim "$outfile" && wl-copy --type image/png <"$outfile"
  dunstify "Saved & copied: $name"
  ;;

window)
  # On Hyprland, you'll need to use slurp instead of swaymsg
  grim -g "$(slurp)" "$outfile" && wl-copy --type image/png <"$outfile"
  dunstify "Saved & copied: $name"
  ;;
esac
