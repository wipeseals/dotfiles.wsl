{ config, pkgs, ...}:

{
  home = {
    username = "nixos";
    homeDirectory = "/home/nixos";
      packages = with pkgs; [
        # shell
        fish
        # altenative tools
        ripgrep # grep replacement
        bat # cat replacement
        fzf # fuzzy finder
        fd # replacement for find
    ];
    stateVersion = "24.11";
  };

  programs = {
    home-manager.enable = true;
    fish.enable = true;
    git = {
      enable = true;
      userName = "wipeseals";
      userEmail = "wipeseals@gmail.com";
    };
  };
  users.users.nixos = {
    shell = pkgs.fish;
  };
}