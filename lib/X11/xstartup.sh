#!/bin/bash
export XMODIFIERS=@im=ibus
export GTK_IM_MODULE="ibus"
trayer --edge top --align right --SetDockType true --SetPartialStrut true \
 --expand true --width 6 --transparent true --tint 0x191970 --height 12 &
 
# Set the background color
 
xsetroot -solid midnightblue
 
# Fire up appletts 
xscreensaver -no-splash &
 
if [ -x /usr/bin/nm-applet ] ; then
   nm-applet --sm-disable &
fi
 
if [ -x /usr/bin/gnome-power-manager ] ; then
   sleep 3
   gnome-power-manager &
fi

if [ -x /usr/bin/ibus-daemon ] ; then
   sleep 3
   ibus-daemon --xim &
fi

if [ -x /usr/bin/gnome-volume-control-applet ] ; then
   sleep 3
   gnome-volume-control-applet &
fi

# Keyboard  mapping
if [ -f $HOME/lib/X11/Xmodmap ]; then
    /usr/bin/xmodmap $HOME/lib/X11/Xmodmap
fi

