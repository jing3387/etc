#!/usr/bin/env bash

SOURCE=${BASH_SOURCE[0]}

while [[ -h $SOURCE ]]; do
	DIR=$(cd -P $(dirname $SOURCE) && pwd)
	SOURCE=$(readlink $SOURCE)
	[[ $SOURCE != /* ]] && SOURCE=$DIR/$SOURCE
done

DIR=$(cd -P $(dirname $SOURCE) && pwd)

for i in $(ls $DIR/dot); do
	echo Linking $DIR/dot/$i to $HOME/.$i
	ln -sf $DIR/dot/$i "$HOME/.$i"
done

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
