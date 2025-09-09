{ config, pkgs, ... }:

{
  home = {
    username = "lary";
    homeDirectory = "/home/lary";
  };

  home.stateVersion = "25.05";
  programs.home-manager.enable = true;

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    oh-my-zsh
    zsh-autosuggestions
    zsh-completions
    zoxide
    thefuck
    atuin
    eza
    yazi
    neovim
  ];

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
      ];
      theme = "random";
    };
    shellAliases = {
      ls = "eza --tree --level=1 --icons=always --no-time --no-user --no-permissions";
    };
    initContent = ''
      function yy() {
        local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
        yazi "$@" --cwd-file="$tmp"
        IFS= read -r -d \'\' cwd < "$tmp"
        [ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
        rm -f -- "$tmp"
      }

      eval "$(zoxide init zsh)"
      eval $(thefuck --alias)
      eval "$(atuin init zsh)"
    '';
  };

  programs.git = {
    enable = true;
    userName = "Laroxyss";
    userEmail = "fedorkorolev8100@gmail.com";
  };
}
