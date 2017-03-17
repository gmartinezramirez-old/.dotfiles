import System.Exit
import Data.Maybe (Maybe, isNothing, fromJust)
import qualified Data.List as L
import qualified Data.Map as M
import GHC.IO.Handle

-- Xmonad Core
import XMonad
import qualified XMonad.StackSet as W
import XMonad.Config.Desktop

-- Layouts
import XMonad.Layout.LayoutModifier
import XMonad.Layout.Gaps
import XMonad.Layout.Spacing
import XMonad.Layout.MultiToggle
import XMonad.Layout.NoBorders
import XMonad.Layout.MultiToggle.Instances
import XMonad.Layout.ResizableTile
import XMonad.Layout.BinarySpacePartition
import XMonad.Layout.SimpleFloat
import XMonad.Layout.PerWorkspace (onWorkspace)
import XMonad.Layout.Minimize

-- Actions
import XMonad.Actions.Navigation2D
import XMonad.Actions.GridSelect
import XMonad.Actions.UpdatePointer
import XMonad.Actions.SpawnOn
import XMonad.Actions.CycleWS

-- Hooks
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.SetWMName
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageDocks

-- Utils
import XMonad.Util.NamedScratchpad
import XMonad.Util.WorkspaceCompare
import XMonad.Util.Run
import XMonad.Util.EZConfig


-- Xmonad entry point
main = do
    xmproc <- spawnPipe "/usr/bin/xmobar"
    xmonad $ myConfig xmproc


-- Config
myConfig xmproc = withNavigation2DConfig def {
        defaultTiledNavigation = centerNavigation
      } $ def {
      -- simple stuff
        terminal           = myTerminal,
        focusFollowsMouse  = myFocusFollowsMouse,
        clickJustFocuses   = myClickJustFocuses,
        borderWidth        = myBorderWidth,
        modMask            = myModMask,
        workspaces         = myWorkspaces,
        normalBorderColor  = myNormalBorderColor,
        focusedBorderColor = myFocusedBorderColor,

      -- key bindings
        keys               = myKeys,
        mouseBindings      = myMouseBindings,

      -- hooks, layouts
        layoutHook         = myLayout,
        manageHook         = myManageHook <+> manageHook desktopConfig,
        handleEventHook    = myEventHook <+> handleEventHook desktopConfig,
        logHook            = (myLogHook xmproc) <+> logHook desktopConfig,
        startupHook        = myStartupHook
    } `additionalKeysP` addKeys


-- Log Hook Definition: Custom Xmobar Output + Update Pointer Hook
myLogHook :: Handle -> X ()
myLogHook xmproc = dynamicLogWithPP xmobarPP
                     { ppOutput = hPutStrLn xmproc
                     , ppCurrent = xmobarColor "#83a598" "" . wrap "[" "]"   -- #9BC1B2 #69DFFA
                     , ppTitle = xmobarColor "#d3869b" "" . shorten 50       -- #9BC1B2 #69DFFA
                     , ppSort = fmap (.namedScratchpadFilterOutWorkspace) getSortByTag
                     , ppLayout = xmobarColor "#fabd2f" "" . myIcons
                     } >> updatePointer (0.75, 0.75) (0.75, 0.75)


-- Use urxvt as terminal
myTerminal = "urxvt"


-- Window focus follows mouse
myFocusFollowsMouse = True


-- Clicking on widow focuses and passes the click forward
myClickJustFocuses = False


-- Width of the window border in pixels.
myBorderWidth = 4


-- Defines with mod key to use (mod4mask == super)
myModMask = mod4Mask



------------------------------------------------------------------------
-- Workspaces
-- The default number of workspaces (virtual screens) and their names.
--
wsGEN = "1:GEN"
wsTRM = "2:TRM"
wsWRK = "3:WRK"
wsCOD = "4:COD"
wsVMs = "5:VMs"

myWorkspaces = [wsGEN,wsTRM,wsWRK,wsCOD,wsVMs] ++ map show [6..9]


-- Set border color when unfocused
myNormalBorderColor  = "#474646"


-- Set norder color when focused
myFocusedBorderColor = "#83a598"


-- Scratch Pads
myScratchpads = [NS "zeal" "zeal" (className =? "Zeal") (customFloating $ W.RationalRect (1/6) (1/6) (2/3) (2/3)),
                 NS "telegram" "telegram-desktop" ((className =? "Telegram") <||> (className =? "telegram-desktop") <||> (className =? "TelegramDesktop")) (customFloating $ W.RationalRect (1/6) (1/6) (2/3) (2/3)),
                 NS "termscratch" "termite --class=termscratch -e ~/bin/tmux-stream-dev.sh" (className =? "termscratch") (customFloating $ W.RationalRect (1/10) (1/10) (4/5) (4/5))]


-- Key bindings. Add, modify or remove key bindings here.
myKeys conf@(XConfig {XMonad.modMask = modm}) = M.fromList $

    -- launch a terminal
    [ ((modm .|. shiftMask,  xK_Return), spawn $ XMonad.terminal conf)

    -- launch thunar
    , ((modm .|. shiftMask, xK_f     ), spawn "thunar")

    -- launch rofi
    , ((modm,               xK_p     ), spawn "rofi -show run")
    , ((modm .|. shiftMask, xK_p     ), spawn "rofi -show window")

    -- launch zeal
    , ((modm,               xK_z     ), namedScratchpadAction myScratchpads "zeal")

    -- launch telegram
    , ((modm,               xK_F10   ), namedScratchpadAction myScratchpads "telegram")

    -- close focused window
    , ((modm .|. shiftMask, xK_c     ), kill)

    -- Grid Select
    , ((modm,               xK_g     ), goToSelected def)

     -- Rotate through the available layout algorithms
    , ((modm,               xK_space ), sendMessage NextLayout)

    --  Reset the layouts on the current workspace to default
    , ((modm .|. shiftMask, xK_space ), setLayout $ XMonad.layoutHook conf)

    -- Resize viewed windows to the correct size
    , ((modm .|. shiftMask, xK_r     ), refresh)

    -- Move focus to the next window
    , ((modm,               xK_Tab   ), windows W.focusDown)

    -- Move focus to the next window
    , ((modm .|. controlMask,  xK_j     ), windows W.focusDown)

    -- Move focus to the previous window
    , ((modm .|. controlMask,  xK_k     ), windows W.focusUp)

    -- Minimize selected window
    , ((modm,               xK_m     ), withFocused minimizeWindow)

    -- Restore one minimized window
    , ((modm .|. shiftMask, xK_m     ), sendMessage RestoreNextMinimizedWin)

    -- Maximize selected window
    , ((modm,                           xK_f     ), (sendMessage $ Toggle FULL))

    -- Swap the focused window and the master window
    , ((modm .|. controlMask, xK_Return), windows W.swapMaster)

    -- Move focus to the master window
    , ((modm,                 xK_Return     ), windows W.focusMaster  )

    -- Swap the focused window with the next window
    , ((modm .|. controlMask .|. shiftMask, xK_j     ), windows W.swapDown  )

    -- Swap the focused window with the previous window
    , ((modm .|. controlMask .|. shiftMask, xK_k     ), windows W.swapUp    )

    -- Shrink the master area
    , ((modm .|. controlMask,               xK_h     ), sendMessage Shrink)
    , ((modm .|. controlMask .|. shiftMask, xK_h     ), sendMessage MirrorShrink)

    -- Expand the master area
    , ((modm .|. controlMask,               xK_l     ), sendMessage Expand)
    , ((modm .|. controlMask .|. shiftMask, xK_l     ), sendMessage MirrorExpand)

    -- Toggle Brightness
    , ((modm,               xK_minus ), spawn "light -U 5")
    , ((modm,               xK_equal ), spawn "light -A 5")

    -- Push window back into tiling
    , ((modm,               xK_t     ), withFocused $ windows . W.sink)

    -- Increment the number of windows in the master area
    , ((modm              , xK_comma ), sendMessage (IncMasterN 1))

    -- Decrement the number of windows in the master area
    , ((modm              , xK_period), sendMessage (IncMasterN (-1)))

    -- Switch workspaces and screens
    , ((modm,               xK_Right),  moveTo Next (WSIs hiddenNotNSP))
    , ((modm,               xK_Left),   moveTo Prev (WSIs hiddenNotNSP))
    , ((modm .|. shiftMask, xK_Right),  shiftTo Next (WSIs hiddenNotNSP))
    , ((modm .|. shiftMask, xK_Left),   shiftTo Prev (WSIs hiddenNotNSP))
    , ((modm,               xK_Down),   nextScreen)
    , ((modm,               xK_Up),     prevScreen)
    , ((modm .|. shiftMask, xK_Down),   shiftNextScreen)
    , ((modm .|. shiftMask, xK_Up),     shiftPrevScreen)

    -- Binary Space Partition Functions
    , ((modm .|. altMask,                  xK_l     ), sendMessage $ ExpandTowards R)
    , ((modm .|. altMask,                  xK_h     ), sendMessage $ ExpandTowards L)
    , ((modm .|. altMask,                  xK_j     ), sendMessage $ ExpandTowards D)
    , ((modm .|. altMask,                  xK_k     ), sendMessage $ ExpandTowards U)
    , ((modm .|. altMask .|. shiftMask,    xK_l     ), sendMessage $ ShrinkFrom R)
    , ((modm .|. altMask .|. shiftMask,    xK_h     ), sendMessage $ ShrinkFrom L)
    , ((modm .|. altMask .|. shiftMask,    xK_j     ), sendMessage $ ShrinkFrom D)
    , ((modm .|. altMask .|. shiftMask,    xK_k     ), sendMessage $ ShrinkFrom U)
    , ((modm,                              xK_d     ), sendMessage Rotate)
    , ((modm,                              xK_s     ), sendMessage Swap)
    , ((modm,                              xK_n     ), sendMessage FocusParent)
    , ((modm .|. controlMask,              xK_n     ), sendMessage SelectNode)
    , ((modm .|. shiftMask,                xK_n     ), sendMessage MoveNode)

    -- Directional Navigation & Moving of Windows
   , ((modm,               xK_l), windowGo R False)
   , ((modm,               xK_h), windowGo L False)
   , ((modm,               xK_k), windowGo U False)
   , ((modm,               xK_j), windowGo D False)
   , ((modm .|. shiftMask, xK_l), windowSwap R False)
   , ((modm .|. shiftMask, xK_h), windowSwap L False)
   , ((modm .|. shiftMask, xK_k), windowSwap U False)
   , ((modm .|. shiftMask, xK_j), windowSwap D False)

    -- Toggle the status bar gap
    , ((modm              , xK_b     ), sendMessage ToggleStruts)

    -- Quit xmonad
    , ((modm .|. shiftMask, xK_q     ), io (exitWith ExitSuccess))

    -- Restart xmonad
    , ((modm              , xK_q     ), spawn "xmonad --recompile; xmonad --restart")
    ]
    ++

    -- mod-[1..9], Switch to workspace N
    -- mod-shift-[1..9], Move client to workspace N
    [((m .|. modm, k), windows $ f i)
        | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9]
        , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]
    ++

    -- mod-{w,e,r}, Switch to physical/Xinerama screens 1, 2, or 3
    -- mod-shift-{w,e,r}, Move client to screen 1, 2, or 3
    [((m .|. modm, key), screenWorkspace sc >>= flip whenJust (windows . f))
        | (key, sc) <- zip [xK_w, xK_e, xK_r] [0..]
        , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]


-- Additional keybindings for media keys
addKeys = [ ("<XF86AudioLowerVolume>"        ,spawn "pulseaudio-ctl down 10")
          , ("<XF86AudioRaiseVolume>"        ,spawn "pulseaudio-ctl up 10"  )
          , ("<XF86AudioMute>"               ,spawn "pulseaudio-ctl mute"   )
          , ("<XF86MonBrightnessDown>"       ,spawn "light -U 5"            )
          , ("<XF86MonBrightnessUp>"         ,spawn "light -A 5"            )
          , ("<XF86AudioPlay>"               ,spawn "play-pause-mpd.sh"     )
          , ("<XF86AudioMicMute>"            ,spawn "play-pause-mpd.sh"     )
          , ("<XF86AudioPrev>"               ,spawn "mpc prev"     )
          , ("<XF86AudioNext>"               ,spawn "mpc next"     )
          , ("<XF86PowerOff>"                ,spawn "lock.sh" )
          , ("<F12>"                         ,namedScratchpadAction myScratchpads "termscratch")
          ]


-- Mouse bindings bound to mouse events
myMouseBindings (XConfig {XMonad.modMask = modm}) = M.fromList $
    [ ((modm, button1), (\w -> focus w >> mouseMoveWindow w >> windows W.shiftMaster))
    , ((modm, button2), (\w -> focus w >> windows W.shiftMaster))
    , ((modm, button3), (\w -> focus w >> mouseResizeWindow w >> windows W.shiftMaster))
    , ((modm .|. shiftMask, button1), (\w -> focus w >> mouseResizeWindow w >> windows W.shiftMaster))
    ]


-- Layout definitions & modifiers
myLayout = onWorkspace "6: MEDIA" simpleFloat $
           desktopLayoutModifiers $
           smartBorders $
           minimize $
           mkToggle (NOBORDERS ?? FULL ?? EOT) layouts
  where
     layouts = gaps [(U,5), (R,5), (L,5), (D,5)] $ spacing 5 (tiled ||| Mirror tiled ||| emptyBSP ||| Full)
     -- tiled resiezable tall layout
     tiled = ResizableTall nmaster delta ratio []
     -- The default number of windows in the master pane
     nmaster = 1
     -- Default proportion of screen occupied by master pane
     ratio   = 1/2
     -- Percent of screen to increment by when resizing panes
     delta   = 3/100


-- Defined icons for various layout types
myIcons layout
    | is "Minimize Spacing 5 Mirror ResizableTall"     = "<icon=/home/gilbertw1/.xmonad/icons/layout-mirror.xbm/>"
    | is "Minimize Spacing 5 ResizableTall"            = "<icon=/home/gilbertw1/.xmonad/icons/layout-tall.xbm/>"
    | is "Minimize Spacing 5 BSP"                      = "<icon=/home/gilbertw1/.xmonad/icons/layout-bsp.xbm/>"
    | is "Minimize Spacing 5 Full"                     = "<icon=/home/gilbertw1/.xmonad/icons/layout-full.xbm/>"
    | is "Simple Float"                                = "<icon=/home/gilbertw1/.xmonad/icons/layout-float.xbm/>"
    | otherwise = "<icon=/home/gilbertw1/.xmonad/icons/layout-gimp.xbm/>"
  where is = (`L.isInfixOf` layout)


-- Manage hook defining various window rules
myManageHook = composeAll
    [ className =? "MPlayer"        --> doFloat
    , resource  =? "desktop_window" --> doIgnore
    , resource  =? "kdesktop"       --> doIgnore
    , className =? "Xfce4-notifyd"  --> doIgnore
    , className =? "Pavucontrol"    --> doFloat
    , className =? "Peek"           --> doIgnore
    , className =? "peek"           --> doIgnore
    , isDialog                      --> doFloat]
    <+> (isFullscreen --> doFullFloat)
    <+> (namedScratchpadManageHook myScratchpads)
    <+> manageSpawn

-- EwmhDesktops users should change this to ewmhDesktopsEventHook
myEventHook = mempty


-- Startup hook, not doing anything
myStartupHook = do
  setWMName "LG3D"
  startupHook desktopConfig


-- Function that prevents cycling to workspaces available on other screens
hiddenNotNSP :: X (WindowSpace -> Bool)
hiddenNotNSP = do
  hs <- gets $ map W.tag . W.hidden . windowset
  return (\w -> (W.tag w) /= "NSP" && (W.tag w) `elem` hs)


-- Alias for left alt key modifier
altMask = mod1Mask
