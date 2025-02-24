# dotfiles

## 概要

このリポジトリは、[chezmoi](https://www.chezmoi.io/) を使用して dotfiles を管理するためのものです。[chezmoi](https://www.chezmoi.io/) は、複数のマシン間で設定ファイルを簡単に同期するためのツールです。

## 使い方

### インストール

see <https://www.chezmoi.io/install/>

```sh
# Windows
$ winget install chezmoi

# Ubuntu
$ curl https://github.com/twpayne/chezmoi/releases/download/v2.60.0/chezmoi_2.60.0_linux_amd64.deb
$ sudo dpkg -i chezmoi_2.60.0_linux_amd64.deb
```

### 初期設定

chezmoi を初期化し、リポジトリをクローンします。

```sh
chezmoi init --apply https://github.com/wipeseals/dotfiles.git
```

### dotfiles の管理

既存の設定ファイルを chezmoi で管理するには、以下のコマンドを使用します。

```sh
chezmoi add <ファイルパス>
```

### 変更の適用

変更を適用するには、以下のコマンドを実行します。

```sh
chezmoi apply
```

### 変更の取得・適用

リポジトリの変更を取得し、適用するには、以下のコマンドを実行します。

```sh
chezmoi update
```

### 変更のプッシュ

変更をリポジトリにプッシュするには、通常の Git コマンドを使用します。

```sh
chezmoi cd
git add .
git commit -m "Update dotfiles"
git push
```
