#!/bin/bash
tmux has-session -t main
if [ $? != 0 ]
then
    tmux new-session -s main -n "Main" -d

    tmux new-window -n "CHIA" -t main
    tmux split-window -h -t main:1
    tmux send-keys -t main:1.0 '. ./chia-blockchain/activate' C-m
    tmux send-keys -t main:1.1 'htop' C-m


    tmux new-window -n "XMRig" -t main
    tmux split-window -h -p 34
	tmux send-keys -t main:2.0 './xmrig -o rx.unmineable.com:3333 -u MATIC:0x848c1f5A8c437edb78Be969F629E03846321a8ca.B580#66pa-za5r -p B580 --threads=3' C-m
	tmux send-keys -t main:2.1 'htop' C-m

    tmux select-window -t main:1
    tmux select-pane -t 0
    tmux select-window -t main:0
fi
tmux attach -t main
