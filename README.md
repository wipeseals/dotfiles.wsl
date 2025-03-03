# dotfiles

## Description

My dotfiles for NixOS-WSL. They may be updated periodically.

## File Structure

- `etc/nixos/`: NixOS configuration files
- `test/`: flake test directory
  - `test-cpp-meson-ninja`: C++ project with meson and ninja
  - `test-cpp-meson-ninja-rv32`: C++ project with meson and ninja for RV32 cross compile
  - `test-csharp`: C# Console project
  - `test-deno/`: Deno project
  - `test-python-uv` Python project with uv
  - `test-rust`: Rust project
  - `test-verilog`: Verilog project

## Install NixOS-WSL

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

### dotfiles の取得

```bash
$ cd ~ && git clone https://github.com/wipeseals/dotfiles.git

# 別の場所にcloneしてシンボリックリンクを貼る場合
$ git clone https://github.com/wipeseals/dotfiles.git /path/to/dotfiles
$ ln -s /path/to/dotfiles/ ~
```

### `/etc/nixos/` の差し替え

````bash
$ sudo rm -r /etc/nixos/
$ sudo ln -s ~/dotfiles/etc/nixos/ /etc/nixos

### ビルド

```bash
# 初回だけはgitが必要. hotfix用にvimも持っておく
$ sudo nix-shell -p git vim

# nixos build. (以後 configuration.nix の変更後はこれで再ビルド)
$ sudo nixos-rebuild switch
````

## Tips

### WSL2 の再起動をしたい

shutdown cmd で WSL2 を停止して、再度起動する

```bash
> wsl --shutdown NixOS
> wsl -d NixOS
```

## Reference

- [Installation - NixOS-WSL](https://nix-community.github.io/NixOS-WSL/install.html)
- [WSL2 で NixOS する - Zenn](https://zenn.dev/kino_ma/articles/3eeb711be6fcbb)
- [NixOS で最強のデスクトップを作ろう - Zenn](https://zenn.dev/asa1984/articles/nixos-is-the-best#home-manager)
- [nixos 入門 1: wsl で使う nixos (Linux 初心者のための究極な OS)](https://zenn.dev/tositada/books/1c1564531ec8fc)
