{ pkgs, username, config, lib, ... }: 
{
  services = {
    xserver = {
      enable = true;
      xkb.layout = "us";
    };
    displayManager.autoLogin = {
      enable = true;
      user = "${username}";
    };
    libinput = {
      enable = true;
      touchpad = { 
        clickMethod = "clickfinger";
        disableWhileTyping = true;
        naturalScrolling = true;
        tapping = true;
      };
      # mouse = {
      #   accelProfile = "flat";
      # };
    };
  };
  # To prevent getting stuck at shutdown
  systemd.extraConfig = "DefaultTimeoutStopSec=10s";

# libinput add from Perplexity.ai-------------
  # Install necessary packages for gesture support
  environment.systemPackages = with pkgs; [
    libinput-gestures
    ydotool
    wmctrl
  ];

  # Add user to input group for libinput-gestures
  users.users.${username}.extraGroups = [ "input" ];

  # Autostart libinput-gestures
  systemd.user.services.libinput-gestures = {
    description = "Libinput Gestures";
    wantedBy = [ "graphical-session.target" ];
    partOf = [ "graphical-session.target" ];
    serviceConfig = {
      ExecStart = "${pkgs.libinput-gestures}/bin/libinput-gestures";
      Restart = "always";
      RestartSec = 3;
      Environment = "PATH=/run/current-system/sw/bin:$PATH";
    };
  };

}
