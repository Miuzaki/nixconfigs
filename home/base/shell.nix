{ pkgs, ... }: {

  programs.nushell = {
    enable = true;
    package = pkgs.nushell;
    configFile.source = ./config.nu;
  };
  programs.starship = {
    enable = true;
    package = pkgs.starship;
  };
  home.file.".config/starship.toml" = {

    source = ./starship.toml;
  };
}