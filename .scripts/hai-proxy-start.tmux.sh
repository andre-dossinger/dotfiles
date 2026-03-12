#!/bin/sh

tmux has-session -t hai 2>/dev/null || tmux new-session -d -s hai 'hai proxy start'
