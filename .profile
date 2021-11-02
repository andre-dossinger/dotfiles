# shellcheck source=/dev/null

# editor settings
export VISUAL=nvim
export EDITOR="$VISUAL"

# default terminal
export TERMINAL=alacritty

# global go binaries
export PATH="$PATH":"$HOME"/go/bin

# set wallpaper
wallpaper=~/.wallpaper
test -f "$wallpaper" && feh --bg-fill "$wallpaper"

# load untracked .profile additions if present
untracked_profile_additions=~/.untracked-profile-additions.sh
test -f "$untracked_profile_additions" && . "$untracked_profile_additions"
