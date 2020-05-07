#!/bin/sh

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
cp ${BASEDIR}/.gdbinit ~/

#
cp ${BASEDIR}/.wgetrc ~/

#
cp ${BASEDIR}/.sqliterc ~/

#
cp ${BASEDIR}/.psqlrc ~/

# nvim
mkdir -p ~/.config || true
ln -fs ../.vim ~/.config/nvim

# vim
mkdir -p ~/.vim/ || true
rsync -a ${BASEDIR}/.vim/ ~/.vim/
chmod 700 ~/.vim/
vim +PlugUpdate +PlugClean\! +q +q
