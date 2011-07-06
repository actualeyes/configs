#!/bin/bash
export XMODIFIERS=@im=ibus
export GTK_IM_MODULE="ibus"
trayer --edge top --align right --SetDockType true --SetPartialStrut true \
 --expand true --width 8 --transparent true --tint 0x191970 --height 12 &
 

# Fire up appletts 
if [ -x /usr/bin/xscreensaver ] ; then
    xscreensaver -no-splash &
fi
# Network Manager 
if [ -x /usr/bin/nm-applet ] ; then
   nm-applet --sm-disable &
fi

# Power Manager 
if [ -x /usr/bin/gnome-power-manager ] ; then
   gnome-power-manager &
fi

# Input Method Switcher
if [ -x /usr/bin/ibus-daemon ] ; then
   ibus-daemon --xim &
fi

# Volume Control 
if [ -x /usr/bin/gnome-sound-applet ] ; then
   gnome-sound-applet &
fi

# Load Custom Keyboard Mapping
if [ -f $HOME/lib/X11/Xmodmap ]; then
    /usr/bin/xmodmap $HOME/lib/X11/Xmodmap
fi

