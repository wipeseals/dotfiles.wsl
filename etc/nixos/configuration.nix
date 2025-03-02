{ config, lib, pkgs, ... }:

{
    environment.systemPackages = with pkgs; [
        git
        vim
        curl
        wget
        nix-ld-rs # https://github.com/nix-community/nix-ld
    ];

    programs = {
        nix-ld.enable = true;
    };
}