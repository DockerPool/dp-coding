#!/bin/bash
/usr/sbin/sshd &
cd /dockerpool
python index.py
