#!/bin/bash

# Backend part
workon fareharbor.com
./redis stop
./redis start
./pg stop
./pg start
./clean
python manage.py migrate && pyrun


# FE part
# tmux split-window -h fe_build

