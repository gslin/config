#!/bin/sh

set -e

BASEDIR=`dirname $0`

#
umask 077

# submodule init
git submodule update --init

#
cp ${BASEDIR}/.inputrc ~/

#
cp ${BASEDIR}/.bashrc ~/
cp ${BASEDIR}/.profile ~/
cp ${BASEDIR}/.zshrc ~/
if [ ! -e ~/.bashrc.local ]; then
    cp ${BASEDIR}/.bashrc.local ~/
fi
if [ ! -e ~/.zshrc.local ]; then
    cp ${BASEDIR}/.zshrc.local ~/
fi

#
if [ ! -e ~/.screenrc ]; then
    cp ${BASEDIR}/.screenrc ~/
fi
cp ${BASEDIR}/.tmux.conf ~/

#
cp ${BASEDIR}/.gitconfig ~/
if [ ! -e ~/.gitconfig.local ]; then
    cp ${BASEDIR}/.gitconfig.local ~/
fi

#
if [ ! -e ~/.npmrc ]; then
    cp ${BASEDIR}/.npmrc ~/
fi

#
cp ${BASEDIR}/.gdbinit ~/

#
cp ${BASEDIR}/.psqlrc ~/

#
cp ${BASEDIR}/.sqliterc ~/

#
cp ${BASEDIR}/.wgetrc ~/

# nvim
mkdir -p ~/.config || true
ln -fs ../.vim ~/.config/nvim

# vim
mkdir -p ~/.vim/ || true
rsync -a ${BASEDIR}/.vim/ ~/.vim/
chmod 700 ~/.vim/

if command -v nvim > /dev/null; then
    nvim +PlugUpdate +PlugClean\! +q +q
else
    vim +PlugUpdate +PlugClean\! +q +q
fi
#
diff -ruN --color .bashrc.local ~/.bashrc.local
diff -ruN --color .zshrc.local ~/.zshrc.local
