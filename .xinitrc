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
source /etc/X11/xinit/xinitrc.d/30-dbus
# Start GNOME Keyring
eval $(/usr/bin/gnome-keyring-daemon --start --components=gpg,pkcs11,secrets,ssh)
# You probably need to do this too:
export SSH_AUTH_SOCK
export GPG_AGENT_INFO
export GNOME_KEYRING_CONTROL
export GNOME_KEYRING_PID
# Xmonad Related Commands and Variables

xsetroot -cursor_name left_ptr
xrdb -merge ~/.Xresources

export XMODIFIERS=@im=uim
export GTK_IM_MODULE="uim"
trayer --edge top --align right --SetDockType true --SetPartialStrut true \
 --expand true --width 14 --transparent true --tint black --height 18 &

if [ -x /usr/bin/uim-xim ] ; then
   uim-xim &
fi



if [ -x /usr/bin/uim-toolbar-gtk-systray ] ; then
   uim-toolbar-gtk-systray &
fi

# Launch Commands
# Org
if [ -x /usr/bin/emacs ] ; then
    emacs -f org-agenda-list  -T Org &
fi

# Conky
if [ -x /usr/bin/conky ] ; then
    conky &
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

# Network Manager 
if [ -x /usr/bin/wicd-client ] ; then
   wicd-client --tray &
fi

if [ -x /usr/bin/emacs ] ; then
    emacs &
fi

if [ -x /usr/bin/pidgin ] ; then
    pidgin &
fi

if [ -x /usr/bin/keepassx ] ; then
    keepassx &
fi

if [ -x /usr/bin/chromium ] ; then
    chromium &
fi
if [ -x /usr/bin/xterm ] ; then
    xterm -name WebConsole &
    xterm -name EmacsConsole &
fi


exec xmonad
