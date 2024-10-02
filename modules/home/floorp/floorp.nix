{ pkgs, ... }: 
{
  home.packages = with pkgs; [ floorp ];

  # Floorp-specific configuration
  home.file.".config/floorp/user.js".text = ''
    user_pref("gfx.webrender.all", true);
    user_pref("media.ffmpeg.vaapi.enabled", true);
    user_pref("widget.use-xdg-desktop-portal", true);
  '';

  # Create a custom .desktop file for Floorp with Wayland support
  home.file.".local/share/applications/floorp-wayland.desktop".text = ''
    [Desktop Entry]
    Name=Floorp (Wayland)
    Exec=env MOZ_ENABLE_WAYLAND=1 floorp %u
    Icon=floorp
    Type=Application
    Categories=Network;WebBrowser;
    MimeType=text/html;text/xml;application/xhtml+xml;application/vnd.mozilla.xul+xml;text/mml;x-scheme-handler/http;x-scheme-handler/https;
    StartupNotify=true
  '';

  programs.brave = {
    enable = true;
    commandLineArgs = [
      "--enable-features=TouchpadOverscrollHistoryNavigation"
      "--ozone-platform=wayland"
      "--disable-features=TabHoverCards"
    ];
  };
}

