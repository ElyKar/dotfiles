import XMonad
import XMonad.Config.Azerty
import XMonad.Prompt
import XMonad.Prompt.Shell


main = xmonad $ azertyConfig
    { terminal           = "urxvt"
    , borderWidth        = 2
    , normalBorderColor  = "#cccccc"
    , focusedBorderColor = "#8d00cb"
}

myFont = "xft:Monoisome:size=10"
myXPConfig = defaultXPConfig {
    font = myFont
}

newKeys conf@(XConfig {XMonad.modMask = modm}) = [
    ((modm, xK_p), shellPrompt myXPConfig),
    ((modm, xK_n), spawn "xscreensaver-command --lock")
    ]
