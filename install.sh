#!/bin/bash

cd $(dirname $0)

echo    "Any existing configuration will be overwritten!"
read -p "Proceed? [y/n] " install
echo

if [[ "$install" = "y" ]]
then
    # CREATE SYMBOLIC LINKS...
    #  -s : symbolic
    #  -r : relative
    #  -v : verbose

    # ==> files
    ln -srvf bashrc    ~/.bashrc
    ln -srvf vimrc     ~/.vimrc
    ln -srvf nethackrc ~/.nethackrc
    ln -srvf taskrc    ~/.taskrc

    # ==> directories
    vim_dir=~/.vim
    terminator_dir=~/.config/terminator

    rm -rf "$vim_dir"
    rm -rf "$terminator_dir"

    ln -srvL vim        "$vim_dir"
    ln -srvL terminator "$terminator_dir"
else
    echo "Abort."
    exit 1
fi

