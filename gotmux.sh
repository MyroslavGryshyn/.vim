#!/bin/bash
SESSION=$USER

cd ~/Dev

tmux split-window -h
tmux select-pane -t 0
tmux select-pane -t 1
tmux split-window -v

if [ "$1" != "" ]; then
    # tmux select-pane -t 0
    tmux send-keys -t 0 "workon '$1'; vim" C-m
    tmux send-keys -t 1 "workon '$1'" C-m
    tmux send-keys -t 2 "workon '$1'" C-m
fi

tmux new-window -n terminals
if [ "$1" != "" ]; then
    # tmux select-pane -t 0
    tmux send-keys -t 0 "workon '$1'" C-m
fi

# Set default window and pane
tmux select-window -t 0
tmux select-pane -t 0

