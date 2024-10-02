{ pkgs, ... }: 
{
  home.packages = (with pkgs; [ 
  onedrivegui
  onedrive
  teams-for-linux
  ]);
}
