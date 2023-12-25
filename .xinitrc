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


# Start a D-Bus session
# source /etc/X11/xinit/xinitrc.d/30-dbus

# Xmonad Related Commands and Variables
if [ -x /usr/bin/xsetroot ] ; then
    xsetroot -cursor_name left_ptr &
fi
if [ -x /usr/bin/xrdb ] ; then
    xrdb -merge ~/.Xresources 
fi
#export XMODIFIERS=@im=uim
#export GTK_IM_MODULE="uim"
trayer --edge top --align right --SetDockType true --SetPartialStrut true \
 --expand true --width 14 --transparent true --height 18 &

# if [ -x /usr/bin/uim-xim ] ; then
#    uim-xim &
# fi

if [ -x /usr/bin/uim-toolbar-gtk-systray ] ; then
   uim-toolbar-gtk-systray &
fi

# Launch Commands
# Org
if [ -x /usr/bin/emacs ] ; then
   emacs -f org-agenda-list  -T Org &
fi

if [ -x /usr/bin/emacs ] ; then
   emacs -f erc-initiate-connections -T IM &
fi

# Conky
if [ -x /usr/bin/conky ] ; then
    conky &
fi

# Power Manager
if [ -x /usr/bin/xfce4-power-manager ] ; then
   xfce4-power-manager &
fi

export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus

# Input Method Switcher
if [ -x /usr/bin/ibus-daemon ] ; then
   ibus-daemon --xim &
fi

# Volume ControlXS
if [ -x /usr/bin/volumeicon ] ; then
    volumeicon &
fi

if [ -x /usr/bin/emacs ] ; then
   emacs -T EmacsConsole &
fi

if [ -x /usr/bin/xscreensaver ] ; then
   xscreensaver &
fi

if [ -x /usr/bin/keepassx ] ; then
    keepassx &
fi

if [ -x /usr/bin/w3m ] ; then
    emacs -f w3m -T EmacsWeb &
fi

if [ -x /usr/bin/xterm ] ; then
    /usr/bin/env LANG=en_US.UTF-8 xterm -name WebConsole &
    /usr/bin/env LANG=en_US.UTF-8 xterm -name EmacsConsole &
fi


if [ -x /usr/bin/wicd-client ] ; then
    wicd-client --tray &
fi
