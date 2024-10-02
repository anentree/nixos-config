{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    libinput-gestures
  ];

  users.users.neo.extraGroups = [ "input" ];
  systemd.user.services.libinput-gestures.enable = true;
  services.xserver.libinput.enable = true;

  # Enable the libinput-gestures service
  systemd.user.services.libinput-gestures = {
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

