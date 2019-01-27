#!/usr/bin/env python3
# -*- coding: utf-8 -*-


import time
import os


TMUX_SOCKET_NAME="default"
TMUX_CHANGE_COLOR_CMD='tmux -L {:s} setw -g clock-mode-colour colour{:d}'


def set_tmux_clock_colour(color_id):
    cmd = TMUX_CHANGE_COLOR_CMD.format(TMUX_SOCKET_NAME, color_id)
    print(cmd)
    os.system(cmd)


def main():
    color_list = range(20, 256)

    while True:
        for color in color_list:
            set_tmux_clock_colour(color)
            time.sleep(60)


if __name__ == '__main__':
    main()

