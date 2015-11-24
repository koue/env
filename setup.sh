#!/bin/sh

cp -n gitconfig ~/.gitconfig
cp -n vimrc ~/.vimrc

test -d ~/.vim/skel || mkdir -p ~/.vim/skel
for i in `ls vim/skel/`
do
	cp -n vim/skel/$i ~/.vim/skel
done 

test -d ~/bin || mkdir -p ~/bin
for i in `ls bin/`
do
	cp -n bin/$i ~/bin
done

test -d ~/.fluxbox || mkdir -p ~/.fluxbox
for i in `ls fluxbox/`
do
	cp -n fluxbox/$i ~/.fluxbox
done
