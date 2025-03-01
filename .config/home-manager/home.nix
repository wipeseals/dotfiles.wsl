{ config, lib, pkgs, ... }:

with lib;
{
    home.username = "user";
    home.homeDirectory = "/home/user";
    home.stateVersion = "24.11";
    programs.home-manager.enable = true;

    home.packages = with pkgs; [
        tmux
        byobu
        jq
    ];
}
