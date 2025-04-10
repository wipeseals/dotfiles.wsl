{ config, pkgs, ...}:

{
  home = {
    username = "nixos";
    homeDirectory = "/home/nixos";
      packages = with pkgs; [
        git
        vim
        curl
        wget
        zellij # terminal multiplexer
        gh # github cli
        lazygit # git tui
        jq # json processor
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
    gh = {
      enable = true;
      settings.editor = "vim";
    };
  };
}