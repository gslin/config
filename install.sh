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

#
cp ${BASEDIR}/.tmux.conf ~/

#
cp ${BASEDIR}/.gitconfig ~/
if [ ! -e ~/.gitconfig.local ]; then
    cp ${BASEDIR}/.gitconfig.local ~/
fi

# vim
mkdir -p ~/.vim/
rsync -a ${BASEDIR}/.vim/ ~/.vim/
chmod 700 ~/.vim/
vim +BundleClean +BundleInstall +q +q
