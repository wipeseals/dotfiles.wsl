# dotfiles


## Install

Reference

- [Installation - NixOS-WSL](https://nix-community.github.io/NixOS-WSL/install.html)
- [WSL2 で NixOS する - Zenn](https://zenn.dev/kino_ma/articles/3eeb711be6fcbb)

```bat
> mkdir path/to/nixos_wsl_workdir
> cd path/to/nixos_wsl_workdir

# download from NixOS-WSL/releat
# https://github.com/nix-community/NixOS-WSL/releases

> wsl --import NixOS ./ nixos.wsl --version 2

# 以下表示なら成功
> wsl -l --all
Linux 用 Windows サブシステム ディストリビューション:
Ubuntu-24.04 (既定)
docker-desktop-data
docker-desktop
NixOS # <- here

# NixOS を起動 + 初期設定
> wsl -d NixOS
$ sudo nix-channel --add https://nixos.org/channels/nixos-24.11 nixos
$ sudo nix-channel --update
$ sudo nixos-rebuild switch

# 動作確認
$ nix-shell -p neofetch
$ neofetch
```



