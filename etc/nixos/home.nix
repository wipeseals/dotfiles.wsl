{ config, pkgs, ...}:

{
  home = {
    username = "nixos";
    homeDirectory = "/home/nixos";
      packages = with pkgs; [
        (pkgs.python3.withPackages (ppkgs: [
          ppkgs.pip
          ppkgs.uv
          ppkgs.ruff
          ppkgs.mypy
          ppkgs.pytest
          ppkgs.rich
        ]))
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