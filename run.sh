#!/bin/bash
/usr/sbin/sshd &
pushd /dockerpool && python index.py
