# dotfiles

Here you find my favorite dotfiles (the ones I would miss in case my systems get nuked). Feel free to copy, modify, distribute, merge or make fun of them. If the latter is the case I would appreciate tips for improvement.

*Note:* Compatibility is only verified on Arch Linux.

## Getting Started on NixOS
Generate a base system and clone this repo in the home (~) directory. Afterwards symlink the `configuration.nix`:
```
git clone git@github.com:andre-dossinger/dotfiles.git
cp -r dotfiles/.git .git
rm -rf dotfiles
git add .
git stash
git stash drop

sudo rm /etc/nixos/configuration.nix
sudo ln configuration.nix /etc/nixos/configuration.nix
```

For now installing oh-my-zsh and powerlevel10k must be installed manually:
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```

