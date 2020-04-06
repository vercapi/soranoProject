import XMonad
import XMonad.Config.Desktop
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.SetWMName
import qualified Data.Map as M
import XMonad.Hooks.EwmhDesktops

main = xmonad =<< statusBar myBar myPP toggleStrutsKey desktopConfig
    { terminal    = "termite"
    , modMask     = mod4Mask
    , keys        = \c -> myKeys c `M.union` keys defaultConfig c
    , startupHook = myStartupHook
    , handleEventHook    = fullscreenEventHook -- Needed for chromium fullscreen to work
    }
  where
    -- keybindings
    myKeys (XConfig {modMask = mod4Mask}) = M.fromList $
         [ ((mod4Mask, xK_r), spawn launcher)
         , ((mod4Mask .|. controlMask, xK_l), spawn lock)]

myStartupHook = do
  setWMName "LG3D" -- needed for java apps (only for HiDPI?)
  spawn     "bash ~/.xmonad/startup.sh" -- start thhis script

myBar = "xmobar"

launcher = "GDK_DPI_SCALE=0.5 GDK_SCALE=2 rofi -combi-modi drun,ssh -show combi"

lock = "light-locker-command -l"

myPP = xmobarPP { ppCurrent = xmobarColor "#429942" "" . wrap "<" ">" }

toggleStrutsKey XConfig {XMonad.modMask = modMask} = (modMask, xK_b)
