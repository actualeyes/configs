import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Layout.NoBorders
import XMonad.Layout.PerWorkspace
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import qualified XMonad.StackSet as W
import System.IO


myManageHook = composeAll
    [ className =? "Gimp"          --> doFloat
    , className =? "Mplayer"       --> doFloat
    , className =? "Chromium"      --> doF  (W.shift "web"   )
    , title     =? "WebConsole"    --> doF  (W.shift "web"   )
    , className =? "Mplayer"       --> doF  (W.shift "movie" )
    , className =? "Transmission"  --> doF  (W.shift "bt"    )
    , className =? "Emacs"         --> doF  (W.shift "emacs" )
    , title     =? "EmacsConsole"  --> doF  (W.shift "emacs" )
    , title     =? "Org"           --> doF  (W.shift "org" )
    , title     =? "Buddy List"    --> doF  (W.shift "im"    )
    , title     =? "watercooler"   --> doF  (W.shift "im"    )
    , className =? "Thunderbird"   --> doF  (W.shift "mail"  )
    , className =? "Keepassx"      --> doF  (W.shift "keys")
    , className =? "trayer"        --> doIgnore
    ]

myWide = Mirror $ Tall nmaster delta ratio
    where
        -- Default number of windows
        nmaster = 1
        -- Increment Level
        delta   = 3/100
        -- Default proportion of master pane    

        ratio   = 80/100

myTall = Tall nmaster delta ratio
    where
        -- Default number of windows
        nmaster = 1
        -- increment level
        delta   = 3/100
        -- Default proportion of master pane
        ratio   = 70/100



myWebLayout =  myTall ||| myWide |||  Full
myEmacsLayout =  myTall ||| myWide ||| Full
myTermLayout = noBorders Full ||| myTall
myDefLayout = noBorders Full ||| myTall ||| myWide 

mylayoutHook = onWorkspace "web" myWebLayout$
               onWorkspace "term" myTermLayout$
               onWorkspace "emacs" myEmacsLayout$
	       myDefLayout


main = do
	xmproc <- spawnPipe "/usr/bin/xmobar /home/apallatto/.xmobarrc"
	xmonad $ defaultConfig {
                terminal = "/usr/bin/xterm",
                workspaces = ["main","web","emacs","term","docs","org","movie","keys","im"],
		manageHook = myManageHook <+> manageDocks <+> manageHook defaultConfig,
		layoutHook = avoidStruts $ mylayoutHook,
		logHook = dynamicLogWithPP $ xmobarPP { 
			ppOutput = hPutStrLn xmproc,
                        ppTitle = xmobarColor "green" "" . shorten 50
                        },
		modMask = mod4Mask 	-- Rebind Mod to the Windows key
		} `additionalKeys`
		[ ((mod4Mask .|. shiftMask, xK_z), spawn "xscreensaver-command -lock"),
		  ((controlMask, xK_Print), spawn "sleep 0.2; scrot -s"),
		  ((0, xK_Print), spawn "scrot"),
                  ((mod4Mask, xK_p), spawn "dmenu_run")
		]

