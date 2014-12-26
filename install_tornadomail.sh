#!/bin/bash
cd /tornadomail
python setup.py install
cat /smtp.py >/usr/local/lib/python2.7/dist-packages/tornadomail/backends/smtp.py

