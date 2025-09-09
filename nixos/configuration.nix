{
  config,
  lib,
  pkgs,
  ...
}:

let
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/release-25.05.tar.gz";
in
{
  imports = [
    "${builtins.fetchTarball "https://github.com/nix-community/disko/archive/master.tar.gz"}/module.nix"
    (import "${home-manager}/nixos")

    /etc/nixos/hardware-configuration.nix
    ./disk-config.nix
    ./packages.nix
    ./services.nix
  ];

  # Home manager
  home-manager.useUserPackages = true;
  home-manager.useGlobalPkgs = true;
  home-manager.backupFileExtension = "backup";
  home-manager.users.lary = import ./home.nix;

  # Automatic updating
  system.autoUpgrade = {
    enable = true;
    dates = "weekly";
  };

  # Automatic cleanup
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };
  nix.settings.auto-optimise-store = true; # Optimise the store every build, this may slow down builds

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  time.timeZone = "Asia/Yekaterinburg";

  i18n.extraLocaleSettings = {
    LC_ALL = "en_US.UTF-8";
  };
  i18n.supportedLocales = [
    # BEWARE: requires a different format with the added /UTF-8
    "en_US.UTF-8/UTF-8"
    "ru_RU.UTF-8/UTF-8"
  ];

  programs.zsh.enable = true;
  users = {
    users.lary = {
      shell = pkgs.zsh;
      isNormalUser = true;
      extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    };
  };

  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };

  system.stateVersion = "25.05"; # DO NOT change this value https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion
}
