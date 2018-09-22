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
        neovim \
        nethack \
        taskwarrior \
        templates \
        terminator \
        vim \
    )

    for app in ${app_list[@]}; do
        stow --verbose --target=$HOME $app
    done
else
    echo "Abort."
    exit 1
fi

