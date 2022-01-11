# dotfiles

各種設定ファイル集です。

# Contents

- nvim init.lua
- vimrc
- ctags config
- scoop install list

# Requirement

自分の環境
- windows10
- XXXXXXXX

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

scoop自体のインストール

↓

scoopを使って各種インストール

↓

dotfilesをシンボリックリンク


で環境構築が一瞬で終わるようにしたい


# Note

自分用

プライベートにしてもいいけど、いつか誰かの役に立たないかなあ。

# TODO
- keyboardのマッピングファイルもこのリポジトリにアップする
- masterにひたすら上書きしていく運用を止める
- nvim
    - luaのlspが社用PCではうまく動かない件
    - tablineプラグインももっといいのほしい
    - cmp sourceを補完時に表示したい
- windows terminal関連の設定ファイルの追加
- フォントの追加
