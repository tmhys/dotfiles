# dotfiles

各種設定ファイル集です。

# Contents

- nvim init.lua
- vimrc
- ctags config
- scoop install list

# Requirement

windowsユーザーです

# Installation

社用PCの権限ではgit clone後手動でコピペするしかないっぽい

# Usage

順番的には

1. scoop自体のインストール
2. scoopを使って各種インストール
3. dotfilesをシンボリックリンク

で環境構築が一瞬で終わるようにしたい


# Note

自分用


# TODO
- keyboardのマッピングファイルもこのリポジトリにアップする
- nvim
    - [ ] tabキーの挙動がまだよろしくない、普通にタブを入力したいのに補完される
    - [ ] ftdetectの仕様を理解したい
    - [ ] watchdocsの乗り換え
    - [ ] PDF2csvついでにspledsheetに展開
    - [x] nvim treeのキーマップ覚える
    - [x] open_floatがよくわからん　なぜcursorholdで起動しない？
    - [x] keymapもautocmdもlua化したいけど
    - [x] packerでインストールしているプラグインの依存関係をはっきりと表記
    - [x] luaのlspが社用PCではうまく動かない件
    - [x] 基本方針は新しいluaプラグインに極力置き換え
    - [x] 起動速度は極力早く
