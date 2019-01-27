#!/usr/bin/env bash

tmux new-session \; \
    split-window -h -p 50 \; \
    select-pane -t 1 \; \
    split-window -v -p 50 \; \
    split-window -v -p 30 \; \
    clock-mode -t 3 \; \
    # select-pane -t 5 \; \
    # send-keys 'vim' C-m \; \

