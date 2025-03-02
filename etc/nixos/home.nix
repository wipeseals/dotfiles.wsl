{ config, pkgs, ...}:

{
  home = {
    username = "nixos";
    homeDirectory = "/home/nixos";
      packages = with pkgs; [
        # altenative tools
        ripgrep # grep replacement
        bat # cat replacement
        fzf # fuzzy finder
        fd # replacement for find

        # dev tools
        gh # github cli
    ];
    stateVersion = "24.11";
    
    # symlink貼る場合はここに書く
    # file = {
    # }
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
      editor = "vim";
    };
  };
}