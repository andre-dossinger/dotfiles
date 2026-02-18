#!/bin/zsh

if [[ "$OSTYPE" == "darwin"* ]]; then
    # install starship prompt
    eval "$(/opt/homebrew/bin/starship init zsh)"
    #rancher desktop
    export PATH="/Users/D064955/.rd/bin:$PATH"
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    eval "$(starship init zsh)"
fi
