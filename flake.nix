{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    home-manager.url = "github:nix-community/home-manager/release-25.05";
    disko.url = "github:nix-community/disko/latest";
  };
  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      disko,
      ...
    }:
    {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        modules = [
          ./nixos/configuration.nix
        ];
        specialArgs = {
          homeManager = home-manager;
          diskoInput = disko;
        };
      };
      homeConfigurations = {
        lary = home-manager.lib.homeManagerConfiguration {
          modules = [ ./nixos/home.nix ];
        };
      };
    };
}
