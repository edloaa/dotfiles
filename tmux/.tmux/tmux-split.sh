#!/usr/bin/env bash

tmux new-session \; \
    split-window -h -p 50 \; \
    send-keys 'vim' C-m \; \
    split-window -v -p 50 \; \
    select-pane -t 1 \; \
    split-window -v -p 50 \; \
    split-window -v -p 25 \; \
    select-pane -t 5 \; \

