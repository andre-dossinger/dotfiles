#!/bin/zsh

# create symlink to platform specific ghostty config
GHOSTTY_CONFIG_DIR="${HOME}/.config/ghostty"

if [[ "$OSTYPE" == "darwin"* ]]; then
    ln -sf config.macos "${GHOSTTY_CONFIG_DIR}/config.platform"
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    ln -sf config.linux "${GHOSTTY_CONFIG_DIR}/config.platform"
fi
