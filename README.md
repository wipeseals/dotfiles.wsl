# dotfiles


## install

<https://nix-community.github.io/NixOS-WSL/install.html>

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

# NixOS を起動
> wsl -d NixOS
```



