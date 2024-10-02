{ config, lib, pkgs, ... }:

{
  # Enable libinput for both X11 and Wayland
  services.xserver.libinput = {
    enable = true;
    touchpad = {
      tapping = true;
      naturalScrolling = true;
      clickMethod = "clickfinger";
      disableWhileTyping = true;
    };
  };

  # Enable libinput for Wayland
  hardware.libinput = {
    enable = true;
    touchpad = {
      tapping = true;
      naturalScrolling = true;
      clickMethod = "clickfinger";
      disableWhileTyping = true;
    };
  };

  # Install necessary packages for gesture support
  environment.systemPackages = with pkgs; [
    libinput-gestures
    xdotool
    wmctrl
  ];

  # Add user to input group for libinput-gestures
  users.users.neo.extraGroups = [ "input" ];

  # Autostart libinput-gestures
  systemd.user.services.libinput-gestures = {
    description = "Libinput Gestures";
    wantedBy = [ "graphical-session.target" ];
    partOf = [ "graphical-session.target" ];
    serviceConfig = {
      ExecStart = "${pkgs.libinput-gestures}/bin/libinput-gestures";
      Restart = "always";
      RestartSec = 3;
    };
  };
}

