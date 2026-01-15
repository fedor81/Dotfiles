{
  config,
  lib,
  pkgs,
  homeManager,
  diskoInput,
  ...
}:

let
  # Flake inputs (required) — we use them directly (flakes-only)
  homeManagerPath = homeManager;
  disko = diskoInput;
in
{
  imports = [
    "${disko}/module.nix"
    (import "${homeManagerPath}/nixos")

    ./hardware-configuration.nix
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

  nix = {
    # Nix garbage collection and settings (consolidated)
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };

    settings = {
      max-jobs = "auto";
      cores = 0;
      auto-optimise-store = true; # Optimise the store every build, this may slow down builds
    };
  };

  nix.settings.experimental-features = "nix-command flakes";

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking = {
    hostName = "nixos";
    networkmanager.enable = true;

    firewall = {
      enable = true;
      allowedTCPPorts = [
        22
        80
        443
      ];
      allowedTCPPortRanges = [
        {
          # KDE Connect
          from = 1714;
          to = 1764;
        }
      ];
      allowedUDPPortRanges = [
        {
          # KDE Connect
          from = 1714;
          to = 1764;
        }
      ];
    };
  };

  time.timeZone = "Asia/Yekaterinburg";

  i18n = {
    extraLocaleSettings = {
      LC_ALL = "en_US.UTF-8";
    };
    supportedLocales = [
      "en_US.UTF-8/UTF-8"
      "ru_RU.UTF-8/UTF-8"
    ];
    defaultLocale = "en_US.UTF-8";
  };

  programs.kdeconnect.enable = true;
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
