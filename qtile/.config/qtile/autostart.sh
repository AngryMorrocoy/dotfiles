#!/bin/bash

udiskie -t -n -m nested &
redshift-gtk -l 0:0 -t 4700:4700 &
xfce4-power-manager &
volumeicon &
nm-applet &
picom --experimental-backend &
nitrogen --restore &
eww open vertical-bar
