#!/bin/bash
sudo apt install goaccess -y
goaccess ../04/*.log --config-file=goaccess.conf
goaccess ../04/*.log -p goaccess.conf -o report.html
