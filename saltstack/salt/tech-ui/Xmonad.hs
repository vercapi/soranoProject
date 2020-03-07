import XMonad
import XMonad.Config.Desktop
import XMonad.Hooks.DynamicLog
import qualified Data.Map as M

main = xmonad =<< statusBar myBar myPP toggleStrutsKey desktopConfig
    { terminal    = "termite"
    , modMask     = mod4Mask
    , keys        = \c -> myKeys c `M.union` keys defaultConfig c
    }
  where
    -- keybindings
    myKeys (XConfig {modMask = modm}) = M.fromList $
         [ ((modm, xK_r), spawn launcher)]

myBar = "xmobar"

launcher = "rofi -combi-modi drun,ssh -show combi"

myPP = xmobarPP { ppCurrent = xmobarColor "#429942" "" . wrap "<" ">" }

toggleStrutsKey XConfig {XMonad.modMask = modMask} = (modMask, xK_b)