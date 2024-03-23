let
  mainMod = "SUPER";
  mainModS = "SUPER_SHIFT";
  mainModC = "SUPER_CTRL";
  launchMod = "ALT";
  launchModS = "ALT_SHIFT";
in
[
  # Applications
  "${launchMod}, T, exec, kitty"
  "${launchMod}, Q, exec, firefox"

  # Screenshot
  ", Print, exec, sh ${./scripts/screenshot.sh}"
]
