{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Applications
    firefox
    telegram-desktop
    # discord
    neohtop
    wezterm
    alacritty
    vscode
    obsidian

    # important
    vim
    neovim
    curl
    git
    nixfmt-rfc-style # .nix formatter
    shfmt # shell formatter

    # CLI (user-level tools managed by home-manager)
    yazi
    bat
    ffmpegthumbnailer
    jq
    poppler
    fd
    ripgrep
    fzf

    # VPN - Core
    xray
    v2ray
    openvpn
    # VPN - GUI
    v2rayn
    hiddify-app

    # Office
    libreoffice-qt
    hunspell
    hunspellDicts.ru_RU
    hunspellDicts.en_US

    # Rust
    rustc
    cargo
    rustfmt
    clippy
    rust-analyzer

    gcc
    clang

    # Python
    uv
    python3Full
    jupyter-all
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];
}
