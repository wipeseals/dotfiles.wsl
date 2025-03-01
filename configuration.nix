{ config, lib, pkgs, ... }:

{
    imports = [
        # include NixOS-WSL modules
        <nixos-wsl/modules>
    ];

    wsl.enable = true;
    wsl.defaultUser = "user";
    system.stateVersion = "24.11";

    nix.extraOptions = ''
        experimental-features = nix-command flakes
    '';
    environment.systemPackages = with pkgs; [
        git
        curl
        wget
        vim
    ];
}
