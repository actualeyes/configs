import XMonad
import XMonad.Util.EZConfig
import XMonad.Config.Desktop (desktopLayoutModifiers)
mport Xmonad.Hooks.ManageHelpers (isFullscreen,doFullFloat)
main = xmonad $ gnomeConfig
	{ terminal = "urxvt"
	, modMask = mod4Mask -- set the mod key to the windows key
	, manageHook gnomeConfig
	, title =? "foo" --> doShift "2"
	-- needs: import Xmonad.Hooks.ManageHelpers (isFullscreen,doFullFloat)
	, isFullscreen --> doFullFloat
	, layoutHook = desktopLayoutModifiers (Tall 1 0.03 0.5 ||| FUll)
	}
	`additionalKeysP`
		[
		-- moving workspaces
		, ("M-<Left>",	prevWS )
		, ("M-<Right>",	nextWS )
		, ("M-S-<Left>",	shiftToPrev )
		, ("M-S-<Right>",	shiftToNext )
		, ("M-m", spawn "echo 'Hi, mom!' | dzen2 -p 4")
		, ("M-<Backspace>", withFocused hide) -- N.B. this is an absurd thing to do.
		, ("M-S-q", spawn "gnome-session-save --gui --logout-dialog")
		, ("M-S-l",    spawn "gnome-screensaver-command -l")
		, ("M1-M-S-l", spawn "gnome-session-save --gui --kill")
		, ("M1-S-'",   spawn "gnome-power-cmd.sh suspend")
		, ("M1-S-,",   spawn "gnome-power-cmd.sh reboot")
		, ("M1-S-.",   spawn "gnome-power-cmd.sh hibernate")
		, ("M1-S-p",   spawn "gnome-power-cmd.sh shutdown")
		]
