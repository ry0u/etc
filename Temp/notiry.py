#! /usr/bin/env python
# -*- coding: utf-8 -*-

import pynotify

pynotify.init("タイトル")
n = pynotify.Notification("タイトル", "本文(改行\nを用いる)" ,"")
n.show();
