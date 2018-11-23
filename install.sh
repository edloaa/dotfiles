#!/bin/bash

cd $(dirname $0)

echo    "Any existing configuration will be overwritten!"
read -p "Proceed? [y/n] " install
echo

if [[ "$install" = "y" ]]
then
    app_list=( \
        bash \
        conky \
        editorconfig \
        fzf \
        neovim \
        nethack \
        taskwarrior \
        templates \
        terminator \
        tmux \
        vim \
    )

    for app in ${app_list[@]}; do
        stow --verbose --target=$HOME $app
    done
else
    echo "Abort."
    exit 1
fi

