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

    # CLI
    zsh
    oh-my-zsh
    zsh-autosuggestions
    zsh-completions
    eza
    bat
    atuin
    thefuck
    yazi
    ffmpegthumbnailer
    jq
    poppler
    fd
    ripgrep
    fzf
    zoxide

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
