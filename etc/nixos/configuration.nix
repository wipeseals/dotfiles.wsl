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
  ];

  programs = {
    nix-ld.enable = true;
    fish.enable = true;
  };
}
