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
if [ -e ~/.vim ]; then
    rsync -a ${BASEDIR}/.vim/ ~/.vim/
    chmod 700 ~/.vim/
    vim +BundleClean\! +BundleUpdate +q +q
else
    mkdir -p ~/.vim/
    rsync -a ${BASEDIR}/.vim/ ~/.vim/
    chmod 700 ~/.vim/
    vim +BundleClean\! +BundleInstall +q +q
fi
