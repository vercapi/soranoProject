import XMonad
import XMonad.Config.Desktop
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.SetWMName
import qualified Data.Map as M

main = xmonad =<< statusBar myBar myPP toggleStrutsKey desktopConfig
    { terminal    = "termite"
    , modMask     = mod4Mask
    , keys        = \c -> myKeys c `M.union` keys defaultConfig c
    , startupHook = setWMName "LG3D"
    }
  where
    -- keybindings
    myKeys (XConfig {modMask = mod4Mask}) = M.fromList $
         [ ((mod4Mask, xK_r), spawn launcher)
         , ((mod4Mask .|. controlMask, xK_l), spawn lock)]

myBar = "xmobar"

launcher = "rofi -combi-modi drun,ssh -show combi"

lock = "light-locker-command -l"

myPP = xmobarPP { ppCurrent = xmobarColor "#429942" "" . wrap "<" ">" }

toggleStrutsKey XConfig {XMonad.modMask = modMask} = (modMask, xK_b)