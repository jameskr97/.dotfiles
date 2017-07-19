#!/bin/sh

B='#00000000'  # blank
C='#ffffff22'  # clear ish
D='#198844ff'  # default
T='#c5c8c6ff'  # text
W='#cc342bff'  # wrong
V='#1d1f21ff'  # verifying

i3lock --clock --indicator --blur 5 --screen 0 \
--insidevercolor=$C   \
--ringvercolor=$V     \
--insidewrongcolor=$C \
--ringwrongcolor=$W   \
--insidecolor=$B      \
--ringcolor=$D        \
--linecolor=$B        \
--separatorcolor=$D   \
--textcolor=$T        \
--timecolor=$T        \
--datecolor=$T        \
--keyhlcolor=$W       \
--bshlcolor=$W        \
--timestr="%H:%M:%S"  \
--datestr="%A, %m %Y" \
--veriftext="Checking..." \
--wrongtext="Try again..." \
#--textsize=20 \
#--modsize=10 \
#--timefont=comic-sans \
#--datefont=monofur \
# etc
