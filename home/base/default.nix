{ ... }: {
  programs.alacritty = {
    enable = true;
  };
  home.file.".config/alacritty/alacritty.toml" = {
    source = ./alacritty.toml;
    recursive = true;
  };
  imports = [
    ./shell.nix
  ];
} 
