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
    , className =? "Firefox"       --> doF  (W.shift "web"  )
    , className =? "Thunderbird"   --> doF  (W.shift "mail" )
    , className =? "Mplayer"       --> doF  (W.shift "movie")
    , className =? "Transmission"  --> doF  (W.shift "bt"   )
    ]

myWide = Mirror $ Tall nmaster delta ratio
    where
        -- The default number of windows in the master pane
        nmaster = 1
        -- Percent of screen to increment by when resizing panes
        delta   = 3/100
        -- Default proportion of screen occupied by master pane
        ratio   = 80/100

myTall = Tall nmaster delta ratio
    where
        -- The default number of windows in the master pane
        nmaster = 1
        -- Percent of screen to increment by when resizing panes
        delta   = 3/100
        -- Default proportion of screen occupied by master pane
        ratio   = 80/100



myWebLayout = noBorders Full ||| myWide 
myTermLayout = noBorders Full ||| myTall
myDefLayout = noBorders Full ||| myTall ||| myWide 

mylayoutHook = onWorkspace "web" myWebLayout$
               onWorkspace "term" myTermLayout
	       myDefLayout
	       



startup :: X ()
startup = do
          spawn "firefox"
          spawn "thunderbird"


main = do
	xmproc <- spawnPipe "/usr/local/bin/xmobar /home/apallatto/.xmobarrc"
	xmonad $ defaultConfig { 
                workspaces = ["web","mail","term","emacs","docs","6","movie","bt","im"],
		manageHook = myManageHook <+> manageDocks <+> manageHook defaultConfig,
		layoutHook = avoidStruts $ mylayoutHook,
                startupHook = startup,
		logHook = dynamicLogWithPP $ xmobarPP { 
			ppOutput = hPutStrLn xmproc,
                        ppTitle = xmobarColor "green" "" . shorten 50
                        },
		modMask = mod4Mask 	-- Rebind Mod to the Windows key
		} `additionalKeys`
		[ ((mod4Mask .|. shiftMask, xK_z), spawn "xscreensaver-command -lock"),
		  ((controlMask, xK_Print), spawn "sleep 0.2; scrot -s"),
		  ((0, xK_Print), spawn "scrot")
		]

