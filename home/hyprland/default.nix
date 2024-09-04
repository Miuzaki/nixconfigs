{ pkgs, config, lib, ...} @ args:
{
  imports = [ ./values ];
  home.file.".config/hypr" = {
    source = ./conf;
    recursive = true;
  };

}
