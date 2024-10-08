{inputs, username, host, ...}: {
  imports =
    #   [(import ./aseprite/aseprite.nix)]
    #   [(import ./audacious.nix)]                 # changed to libinput
       [(import ./bat.nix)]                       # better cat command
    ++ [(import ./btop.nix)]                      # resouces monitor 
    # ++ [(import ./cava.nix)]                      # audio visualizer
    ++ [(import ./discord/discord.nix)]                   # discord with catppuccin theme
    ++ [(import ./fastfetch.nix)]                       # fetch tool
    ++ [(import ./floorp/floorp.nix)]             # firefox based browser
    ++ [(import ./fzf.nix)]                       # fuzzy finder
    # ++ [(import ./gaming.nix)]                    # packages related to gaming
    ++ [(import ./git.nix)]                       # version control
    ++ [(import ./gnome.nix)]                       # gnome apps
    ++ [(import ./gtk.nix)]                       # gtk theme
    ++ [(import ./hyprland)]                      # window manager
    ++ [(import ./kitty.nix)]                     # terminal
    # ++ [(import (./. + "/libinput.nix"))]
    ++ [(import ./micro.nix)]                     # nano replacement
    ++ [(import ./nvim.nix)]                      # neovim editor
    ++ [(import ./packages.nix)]                  # other packages
    # ++ [(import ./retroarch.nix)]
    ++ [(import ./rofi.nix)]                      # launcher
    ++ [(import ./scripts/scripts.nix)]           # personal scripts
    ++ [(import ./spicetify.nix)]                 # spotify client
    ++ [(import ./starship.nix)]                  # shell prompt
    ++ [(import ./swaylock.nix)]                  # lock screen
    ++ [(import ./swaync/swaync.nix)]             # notification deamon
    ++ [(import ./vscodium.nix)]                  # vscode forck
    ++ [(import ./waybar)]                        # status bar
    ++ [(import ./xdg-mimes.nix)]                 # xdg config
    ++ [(import ./zsh.nix)];
}
