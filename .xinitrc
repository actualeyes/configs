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

# Xmonad Related Commands and Variables

xsetroot -cursor_name left_ptr
xrdb -merge ~/.Xresources

export XMODIFIERS=@im=uim
export GTK_IM_MODULE="uim"
trayer --edge top --align right --SetDockType true --SetPartialStrut true \
 --expand true --width 8 --transparent true --tint 0x191970 --height 12 &

if [ -x /usr/bin/uim-xim ] ; then
   uim-xim &
fi



if [ -x /usr/bin/uim-toolbar-gtk-systray ] ; then
   uim-toolbar-gtk-systray &
fi

# Launch Commands

# Screensaver 
if [ -x /usr/bin/xscreensaver ] ; then
    xscreensaver -no-splash &
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
if [ -x /usr/bin/volwheel ] ; then
   volwheel &
fi

# Load Custom Keyboard Mapping
if [ -f $HOME/lib/X11/Xmodmap ]; then
    /usr/bin/xmodmap $HOME/lib/X11/Xmodmap
fi

exec ck-launch-session xmonad

# # Network Manager 
# if [ -x /usr/bin/nm-applet ] ; then
#    nm-applet --sm-disable &
# fi

