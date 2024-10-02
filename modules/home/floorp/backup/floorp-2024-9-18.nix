{ pkgs, ... }: 
{
  home.packages = with pkgs; [ floorp ];

  programs.brave = {
    enable = true;
    commandLineArgs = [
      "--enable-features=TouchpadOverscrollHistoryNavigation"
      "--ozone-platform=wayland"
      "--disable-features=TabHoverCards"
    ];
  };
}
