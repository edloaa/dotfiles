#!/usr/bin/env python3
# -*- coding: utf-8 -*-


import time
import datetime
import os


TMUX_SOCKET_NAME="default"
TMUX_CHANGE_COLOR_CMD='tmux -L {:s} setw -g clock-mode-colour "{:s}"'


def set_tmux_clock_colour(colour_id):
    cmd = TMUX_CHANGE_COLOR_CMD.format(TMUX_SOCKET_NAME, colour_id)
    print(cmd)
    os.system(cmd)


def quasi_random_colours():
    colour_list = range(20, 256)

    while True:
        for colour in colour_list:
            set_tmux_clock_colour("colour{:d}".format(colour))
            time.sleep(60)


def colour_gradient():
    colour_gradient = {
        0: '#3eb36e',
        1: '#00b194',
        2: '#00adaf',
        3: '#0090ba',
        4: '#006fc4',
        5: '#0048bd',
        6: '#190097',
        7: '#000ac5',
        8: '#005be9',
        9: '#0080dd',
        10: '#009cbb',
        11: '#00b4a1',
        12: '#19b37d',
        13: '#4baf4e',
        14: '#75a700',
        15: '#8c8700',
        16: '#986500',
        17: '#9c3f00',
        18: '#970000',
        19: '#b70000',
        20: '#af4e00',
        21: '#9f7500',
        22: '#8a9500',
        23: '#70b040',
        }

    while True:
        hour = datetime.datetime.now().hour
        set_tmux_clock_colour(colour_gradient[hour])
        time.sleep(60)


if __name__ == '__main__':
    # quasi_random_colours()
    colour_gradient()

