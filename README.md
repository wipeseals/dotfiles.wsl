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

### NixOS

`/etc/nixos/configuration.nix` を差し替える。 configuration.nix を削除して、本リポジトリの configuration.nix をシンボリックリンクで置く

```bash
$ sudo rm /etc/nixos/configuration.nix
$ sudo ln -s /full/path/to/dotfiles/configuration.nix /etc/nixos/configuration.ni

# 以後 configuration.nix の変更後はこれで再ビルド
$ sudo nixos-rebuild switch
```

### dotfiles/devbox

`/home/user` にシンボリックリンクを貼る (もしくは repo の内容をばらまく)

```bash
$ sudo rm -r /home/user
$ sudo ln -s /mnt/e/repos/dotfiles/ /home/user
$ ls -al /home
total 12
drwxr-xr-x  3 root root  4096 Mar  1 15:57 .
drwx---r-x 20 root root  4096 Mar  1 15:44 ..
drwx------  4 user users 4096 Mar  1 15:29 nixos
lrwxrwxrwx  1 root root    25 Mar  1 15:57 user -> /mnt/e/repos/dotfiles/

# 以後 devbox の Shell に入るときはこれ
$ devbox shell
```
