{
  description = "A simple NixOS flake";

  inputs = {
    # NixOS official package source, here using the nixos-23.11 branch
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: {
    # The host with the hostname `my-nixos` will use this configuration
    nixosConfigurations.cucumbermachine = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./cucumbermachine
        ./modules/hyprland
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;

          home-manager.backupFileExtension = "hm-backup";

          home-manager.users.cucumbercodedev = import ./home;
        }
      ];
    };
  };
}
