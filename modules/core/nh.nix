{ configs, pkgs, username, ... }: 
{
  programs.nh = {
    enable = true;
    clean = {
      enable = true;
      extraArgs = "--keep-since 7d --keep 5";
    };
    flake = "/home/${username}/nixos-config";
  };

  environment.systemPackages = with pkgs; [
    libinput-gestures
    nix-output-monitor
    nvd
  ];
  
  # ------ libinput
  users.users.neo.extraGroups = [ "input" ];
  services.libinput.enable = true;

  systemd.user.services.libinput-gestures = {
    enable = true;
    description = "LibInput Gestures";
    wantedBy = [ "graphical-session.target" ];
    partOf = [ "graphical-session.target" ];
    serviceConfig = {
      ExecStart = "${pkgs.libinput-gestures}/bin/libinput-gestures";
      Restart = "always";
    };
  };
  
  environment.etc."libinput-gestures.conf".text = ''
  # Swipe up with 3 fingers to show rofi app launcher
  gesture swipe up 3 hyprctl dispatch exec "rofi -show drun"

  # Swipe down with 3 fingers to show rofi window switcher
  gesture swipe down 3 hyprctl dispatch exec "rofi -show window"
'';

}
