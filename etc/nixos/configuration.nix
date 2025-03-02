{ config, lib, pkgs, ... }:

{
  nix = {
    settings = { 
      auto-optimise-store = true;
      experimental-features = [ "nix-command" "flakes" ];
    };
  };
  environment.systemPackages = with pkgs; [
    git
    vim
    curl
    wget
    nix-ld-rs # https://github.com/nix-community/nix-ld
    fish
    starship
  ];

  programs = {
    nix-ld.enable = true;
    fish = {
      enable = true;
      interactiveShellInit = ''
        starship init fish | source
      '';
    };
  };
  users.users.nixos.shell = pkgs.fish;
}
