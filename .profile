# editor settings
export VISUAL=nvim
export EDITOR="$VISUAL"

# default terminal
export TERMINAL=alacritty

# global go binaries
export PATH="$PATH":"$HOME"/go/bin

# load untracked .profile additions if present
untracked_profile_additions=./.untracked-profile-additions.sh
# shellcheck source=/dev/null
test -f "$untracked_profile_additions" && . "$untracked_profile_additions" 2>/dev/null
