#!/bin/sh

BASEDIR=`dirname $0`

# vim
cp ${BASEDIR}/.vimrc ~/.vimrc
mkdir -p ~/.vim
cp -R ${BASEDIR}/.vim/* ~/.vim/
