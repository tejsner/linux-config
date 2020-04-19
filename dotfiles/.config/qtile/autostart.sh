#!/bin/sh
dropbox start &
flameshot &
syndaemon -i 0.5 -t -K -R -d
redshift-gtk -l 55.70:12.55 &
