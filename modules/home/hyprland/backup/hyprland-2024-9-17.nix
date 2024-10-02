{ config, lib, inputs, pkgs, ...}: 
{
  home.packages = with pkgs; [
    # swww
    swaybg
    inputs.hypr-contrib.packages.${pkgs.system}.grimblast
    hyprpicker
    grim
    slurp
    wl-clip-persist
    wf-recorder
    glib
    wayland
    direnv
    pyprland
  ];
  systemd.user.targets.hyprland-session.Unit.Wants = [ "xdg-desktop-autostart.target" ];
  wayland.windowManager.hyprland = {
    enable = true;
    # extraConfig = "
        # exec-once = pypr
        # exec-once = spotify
        # exec-once = teams-for-linux
        # bind = SUPER, S, exec, pypr toggle spotify
        # bind = SUPER, T, exec, pypr toggle teams
    ";
    xwayland = {
      enable = true;
      # hidpi = true;
    };
    # enableNvidiaPatches = false;
    systemd.enable = true;
  };
  
  # added for pyprland -------
  xdg.configFile."hypr/pyprland.json".text = builtins.toJSON {
    pyprland = {
      plugins = [ "scratchpads" ];
    };
    scratchpads = {
      spotify = {
        command = "spotify";
        animation = "fromRight";
        margin = 50;
        size = "75% 75%";
        unfocus = "noop";
      };
      #teams = {
        #command = "teams-for-linux";
        #animation = "fromRight";
        #margin = 50;
        #size = "75% 75%";
        #unfocus = "noop";
      };
    };
  };
}
