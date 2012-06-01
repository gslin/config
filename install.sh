#!/bin/sh

BASEDIR=`dirname $0`

#
umask 077

# submodule init
git submodule update --init

#
cp ${BASEDIR}/.inputrc ~/

#
cp ${BASEDIR}/.profile ~/
cp ${BASEDIR}/.bashrc ~/

# vim
cp ${BASEDIR}/.vimrc ~/
mkdir -p ~/.vim/
rsync -a ${BASEDIR}/.vim/ ~/.vim/
chmod 700 ~/.vim/
