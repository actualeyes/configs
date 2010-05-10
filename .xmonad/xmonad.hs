import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO


myManageHook = composeAll
    [ className =? "Gimp"      --> doFloat
    , className =? "Mplayer"   --> doFloat
    , className =? "Firefox" --> doShift "web"
    , className =? "Thunderbird" --> doShift "email"
    ]


main = do
	xmproc <- spawnPipe "/usr/local/bin/xmobar /home/apallatto/.xmobarrc"
	xmonad $ defaultConfig { 
                workspaces = ["1:web","2:mail","3:term","4:emacs","5:docs","6","7","8","9:pidgin"],
		manageHook = manageDocks <+> manageHook defaultConfig,
		layoutHook = avoidStruts  $  layoutHook defaultConfig,
		logHook = dynamicLogWithPP $ xmobarPP { 
			ppOutput = hPutStrLn xmproc,
                        ppTitle = xmobarColor "green" "" . shorten 50
                        }
		,modMask = mod4Mask 	-- Rebind Mod to the Windows key
		} `additionalKeys`
		[ ((mod4Mask .|. shiftMask, xK_z), spawn "xscreensaver-command -lock"),
		  ((controlMask, xK_Print), spawn "sleep 0.2; scrot -s"),
		  ((0, xK_Print), spawn "scrot")
		]

