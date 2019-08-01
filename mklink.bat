REM Last Change: 31-Jul-2019.
REM Maintainer:  TH

REM Scoopインストール
powershell  -Command Set-ExecutionPolicy RemoteSigned -Scope CurrentUser -Force
powershell  -Command iex (New-Object net.webclient).downloadstring('https://get.scoop.sh')

REM Scoopでまずgitをインストール
scoop install git

REM Scoopでbucket install
scoop bucket add iyokan-jp https://github.com/tetradice/scoop-iyokan-jp
scoop bucket add jp https://github.com/rkbk60/scoop-for-jp

REM Scoopで各種インストール
scoop install emacs-nt vim-kaoriya winmerge-jp 7zip ag bat fd fzf less make pt sudo
scoop install main/sudo
sudo scoop install cica -g

REM シンボリックリンク作成
mklink %homepath%".vim\_vimrc"  %homepath%"dotfiles\_vimrc
mklink %homepath%".vim\_gvimrc" %homepath%"dotfiles\_gvimrc
mklink %homepath%".vim\rc\dein.toml"  %homepath%\dotfiles\dein.toml
mklink %homepath%".vim\rc\dein_lazy.toml"  %homepath%\dotfiles\dein_lazy.toml
mklink %homepath%".vim\rc\color.toml"      %homepath%\dotfiles\color.toml
mklink %homepath%"AppData\Local\nvim\ginit.vim" %homepath%\dotfiles\_gvimrc
mklink %homepath%"AppData\Local\nvim\init.vim" %homepath%\dotfiles\_vimrc
