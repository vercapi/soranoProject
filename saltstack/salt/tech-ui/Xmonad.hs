import XMonad
import XMonad.Config.Desktop

main = xmonad desktopConfig
    { terminal    = "termite"
    , modMask     = mod4Mask
    }