#!/bin/sh

tmux has-session -t ollama 2>/dev/null || tmux new-session -d -s ollama 'OLLAMA_HOST=0.0.0.0 OLLAMA_CONTEXT_LENGTH=64000 ollama serve'
