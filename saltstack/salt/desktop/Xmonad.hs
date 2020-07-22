import XMonad
import XMonad.Config.Desktop
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.SetWMName
import qualified Data.Map as M
import XMonad.Hooks.EwmhDesktops
import Colors -- generated with pywal
import XMonad.Layout.Grid
import XMonad.Layout.ResizableTile
import XMonad.Layout.ThreeColumns
import XMonad.Layout.Circle
import XMonad.Layout.NoBorders (noBorders, smartBorders)
import XMonad.Layout.LayoutScreens
import XMonad.Layout.TwoPane
import XMonad.Layout.Gaps

defaultLayouts = smartBorders(

  -- ThreeColMid layout puts the large master window in the center
  -- of the screen. As configured below, by default it takes of 3/4 of
  -- the available space. Remaining windows tile to both the left and
  -- right of the master window. You can resize using "super-h" and
  -- "super-l".
    ThreeColMid 1 (3/100) (3/7)

     -- ResizableTall layout has a large master window on the left,
  -- and remaining windows tile on the right. By default each area
  -- takes up half the screen, but you can resize using "super-h" and
  -- "super-l".
   ||| ResizableTall 1 (3/100) (1/2) []

  -- Mirrored variation of ResizableTall. In this layout, the large
  -- master window is at the top, and remaining windows tile at the
  -- bottom of the screen. Can be resized as described above.
  ||| Mirror (ResizableTall 1 (3/100) (1/2) [])

  -- Full layout makes every window full screen. When you toggle the
  -- active window, it will bring the active window to the front.
  ||| noBorders Full
  -- Circle layout places the master window in the center of the screen.
  -- Remaining windows appear in a circle around it
   ||| Circle

  -- Grid layout tries to equally distribute windows in the available
  -- space, increasing the number of columns and rows as necessary.
  -- Master window is at top left.
  ||| Grid)

main = xmonad =<< statusBar myBar myPP toggleStrutsKey desktopConfig
    { terminal        = "termite"
    , modMask         = mod4Mask
    , keys            = \c -> myKeys c `M.union` keys defaultConfig c
    , startupHook     = myStartupHook
    , handleEventHook = fullscreenEventHook -- Needed for chromium fullscreen to work
    , layoutHook      = defaultLayouts
    }
  where
    -- keybindings
    myKeys (XConfig {modMask = mod4Mask}) = M.fromList $
         [ ((mod4Mask, xK_r), spawn launcher)
         , ((mod4Mask .|. controlMask, xK_l), spawn lock)
         , ((mod4Mask .|. controlMask, xK_s), spawn auto_screen)
         , ((mod4Mask .|. controlMask, xK_space), layoutScreens 2 (gaps [(U,18)] $ TwoPane 0.25 0.75))
         , ((mod4Mask .|. controlMask .|. shiftMask, xK_space), rescreen)]

myStartupHook = do
  setWMName "LG3D" -- needed for java apps (only for HiDPI?)
  spawn     "bash ~/.xmonad/startup.sh" -- start thhis script

myBar = "xmobar"

launcher = "GDK_DPI_SCALE={{ grains['dpi_settings']['GDK_DPI_SCALE'] }} GDK_SCALE={{ grains['dpi_settings']['GDK_SCALE'] }} rofi -combi-modi drun,ssh -show combi"

lock = "light-locker-command -l"

auto_screen = "autorandr -c"

myPP = xmobarPP { ppCurrent = xmobarColor color2 "" . wrap "<" ">"
                , ppTitle = xmobarColor color2 "" . shorten 100
                , ppUrgent = xmobarColor color2 "" . wrap "!" "!" }

toggleStrutsKey XConfig {XMonad.modMask = modMask} = (modMask, xK_b)
