{ config, pkgs, ...}:

{
  home = {
    username = "nixos";
    homeDirectory = "/home/nixos";
      packages = with pkgs; [
        # altenative tools
        ripgrep # grep replacement
        bat # cat replacement
        fd # replacement for find
        eza # replacement for ls

        # shell/env tools
        starship # shell prompt
        tmux
        byobu

        # dev tools
        fzf # fuzzy finder
        direnv # environment variable manager
        gh # github cli
        lazygit # git tui
    ];
    stateVersion = "24.11";

    file = {
      # ".config".source = ./.config;
    };
  };

  programs = {
    home-manager.enable = true;
    git = {
      enable = true;
      userName = "wipeseals";
      userEmail = "wipeseals@gmail.com";
    };
    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
    gh = {
      enable = true;
      settings.editor = "vim";
    };
  };
}