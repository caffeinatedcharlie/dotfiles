{ pkgs, lib, ... }:

pkgs.writeShellApplication {
  name = "screenshot-window-bind";

  runtimeInputs = with pkgs; [ grim satty jq ];

  text = ''
    # shellcheck disable=SC2046
    grim -g "$(hyprctl clients -j | jq -r ".[] | select(.workspace.id == "$(hyprctl activewindow -j | jq -r '.workspace.id')\)""| jq -r ".at,.size" | jq -s "add" | jq '_nwise(4)' | jq -r '"\(.[0]),\(.[1]) \(.[2])x\(.[3])"'| slurp)" - | satty --filename - --early-exit --copy-command="wl-copy"
  '';
}
