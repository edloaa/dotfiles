#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import sys

import pyautogui as pg


def move_mouse_left_right(px=1, pause=55):
    pg.FAILSAFE = False if pause > 1 else True
    while True:
        pg.move(px, 0, pause=pause)
        px *= -1


if __name__ == '__main__':
    try:
        move_mouse_left_right()
    except KeyboardInterrupt:
        sys.exit(1)
