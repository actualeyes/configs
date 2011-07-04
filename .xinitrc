#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

xsetroot -cursor_name left_ptr

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
if [ -x /usr/bin/volumeicon ] ; then
   volumeicon &
fi

# Load Custom Keyboard Mapping
if [ -f $HOME/lib/X11/Xmodmap ]; then
    /usr/bin/xmodmap $HOME/lib/X11/Xmodmap
fi

exec xmonad
