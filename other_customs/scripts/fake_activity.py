#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import pyautogui as pg


def move_mouse_left_right(px=1, pause=55):
    while True:
        pg.move(px, 0, pause=pause)
        px *= -1


if __name__ == '__main__':
    move_mouse_left_right()
