{ pkgs, ... }:
{  
  hardware = {
    bluetooth.enable = true;
    graphics = {
      enable = true;
      extraPackages = with pkgs; [
      ];
    };
    sane = { # for scanning
      enable = true;
      extraBackends = [ pkgs.sane-airscan ];
    };
  };
  hardware.enableRedistributableFirmware = true;
}
