#!/bin/sh

cp -n gitconfig ~/.gitconfig
cp -n vimrc ~/.vimrc

test -d ~/.vim/skel || mkdir -p ~/.vim/skel
for i in `ls vim/skel/`
do
	cp -n $i ~/.vim/skel
done 
