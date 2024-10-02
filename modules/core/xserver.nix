{ username, config, lib, ... }: 
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
      # mouse = {
      #   accelProfile = "flat";
      # };
    };
  };
  # To prevent getting stuck at shutdown
  systemd.extraConfig = "DefaultTimeoutStopSec=10s";

}
