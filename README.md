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
    - [ ] null-lsの設定、改行コードeol

# MEMO
nvimは極力luaプラグインを使う。
設定もlua化する。
起動時間は頑張って短くする。
