{ config, pkgs, ...}:

{
  home = {
    stateVersion = "24.11";
    username = "nixos";
    homeDirectory = "/home/nixos";
    packages = with pkgs; [
      git
      gh # github cli
    ];
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
      settings.editor = "hx";
    };
  };
}
