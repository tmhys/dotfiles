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

シンボリックリンクを使っていい感じにしてください。

例)
C:\Windows\system32>mklink /D AAAAA BBBBB
AAAAA:シンボリックリンク先。まだこの時点ではそこに存在しないフォルダ名にすること。
BBBBB:シンボリックリンク元。ここではdotfiles中の実在フォルダ。

以下のリンクを参考に、もっとまともにgithubを使い込みたい。
https://thom.hateblo.jp/entry/2022/01/09/225345?utm_source=pocket_mylist

# Usage

順番的には

1. scoop自体のインストール
2. scoopを使って各種インストール
3. dotfilesをシンボリックリンク

で環境構築が一瞬で終わるようにしたい


# Note

自分用

プライベートにしてもいいけど、いつか誰かの役に立たないかなあ。

# TODO
- keyboardのマッピングファイルもこのリポジトリにアップする
- nvim
    - keymapもautocmdもlua化したいけど
    - luaのlspが社用PCではうまく動かない件
    - ftdetectの仕様を理解したい
    - packerでインストールしているプラグインの依存関係をはっきりと表記
