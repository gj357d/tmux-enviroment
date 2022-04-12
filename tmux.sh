#!/bin/bash
tmux has-session -t main
if [ $? != 0 ]
then
    tmux new-session -s main -n "Main" -d

    tmux new-window -n "Second" -t main
    tmux split-window -h -t main:1
    tmux send-keys -t main:1.0 
    tmux send-keys -t main:1.1 'htop' C-m


    tmux new-window -n "Last" -t main
    tmux split-window -h -p 34
	tmux send-keys -t main:2.0
	tmux send-keys -t main:2.1 'htop' C-m

    tmux select-window -t main:1
    tmux select-pane -t 0
    tmux select-window -t main:0
fi
tmux attach -t main
