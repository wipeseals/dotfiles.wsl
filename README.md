# dotfiles

## Install NixOS-WSL

Reference

- [Installation - NixOS-WSL](https://nix-community.github.io/NixOS-WSL/install.html)
- [WSL2 で NixOS する - Zenn](https://zenn.dev/kino_ma/articles/3eeb711be6fcbb)

```bat
# Virtual Disk置き場
> mkdir path/to/nixos_wsl_workdir
> cd path/to/nixos_wsl_workdir

# NixOS-WSL/releases から最新版をダウンロード
# https://github.com/nix-community/NixOS-WSL/releases

# WSL に NixOS をインポート
> wsl --import NixOS ./ nixos.wsl --version 2

# NixOS が追加されたことを確認
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

## Install dotfiles

```bash
# configuration.nix を削除して、本リポジトリの configuration.nix をシンボリックリンクで置く
$ sudo rm /etc/nixos/configuration.nix
$ sudo ln -s /full/path/to/dotfiles/configuration.nix  /etc/nixos/configuration.ni
$ sudo nixos-rebuild switch
```
