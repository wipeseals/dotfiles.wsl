{ config, lib, pkgs, ... }:

{
  nix = {
    settings = { 
      auto-optimise-store = true;
      experimental-features = [ "nix-command" "flakes" ];
    };
  };
  environment.systemPackages = with pkgs; [
    # must have tools
    git
    vim
    curl
    wget
    nix-ld-rs # https://github.com/nix-community/nix-ld

    # shell/env tools
    starship
    fish

    # altenative tools
    ripgrep # grep replacement
    bat # cat replacement
    fd # replacement for find
    eza # replacement for ls

    # dev tools
    fzf # fuzzy finder
    direnv # environment variable manager
    gh # github cli
    lazygit # git tui
  ];

  programs = {
    nix-ld.enable = true;
    starship = {
      enable = true;
    };
    fish = {
      enable = true;
      interactiveShellInit = ''
        starship init fish | source
        fzf --fish | source
      '';
    };
    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
  };
  users.users.nixos.shell = pkgs.fish;
}
