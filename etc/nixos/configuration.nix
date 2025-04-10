{ config, lib, pkgs, ... }:

{
  nix = {
    settings = { 
      auto-optimise-store = true;
      experimental-features = [ "nix-command" "flakes" ];
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 6d";
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
    starship # prompt
    fish
    zellij # terminal multiplexer
    neovim # text editor

    # alternative commands
    bat # cat with wings
    eza # ls with super powers
    fd # find replacement
    ripgrep # grep replacement
    tokei # cloc replacement
    dust # du replacement
    procs # ps replacement
    sd # sed replacement
    zoxide # cd replacement

    # dev tools
    fzf # fuzzy finder
    direnv # environment variable manager
    gh # github cli
    lazygit # git tui
    jq # json processor
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
