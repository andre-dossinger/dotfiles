# shellcheck source=/dev/null

# editor settings
export VISUAL=nvim
export EDITOR="$VISUAL"
#set -o vi

# default terminal
export TERMINAL=ghostty

# global go binaries
export PATH="${PATH}:${HOME}/go/bin"

# rust cargo packages
export PATH="${PATH}:${HOME}/.cargo/bin"

# flatpak executables
export PATH="${PATH}:/var/lib/flatpak/exports/bin"

# custom executables
export PATH="${PATH}:${HOME}/.bin"

# custom scripts
export PATH="${PATH}:${HOME}/.scripts"

# refresh dmenu cache
rm -rf .cache/dmenu_run

# set wallpaper
wallpaper=~/.wallpaper
if [[ -f "$wallpaper" ]]; then
	feh --bg-fill "$wallpaper"
fi
