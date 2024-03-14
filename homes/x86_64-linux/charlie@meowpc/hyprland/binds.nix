let
  mainMod = "SUPER";
  mainModS = "SUPER_SHIFT";
  mainModC = "SUPER_CTRL";
  launchMod = "ALT";
  launchModS = "ALT_SHIFT";
in
[
  "${launchMod}, T, exec, kitty"
  "${launchMod}, Q, exec, firefox"
]
