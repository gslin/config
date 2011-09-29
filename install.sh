#!/bin/sh

BASEDIR=`dirname $0`

# vim
cp ${BASEDIR}/.vimrc ~/.vimrc
cp -R ${BASEDIR}/.vim/ ~/.vim/
