# dotfiles

Here you find my favorite dotfiles (the ones I would miss in case my systems get nuked). Feel free to copy, modify, distribute, merge or make fun of them. If the latter is the case I would appreciate tips for improvement.

*Note:* Compatibility is only verified on Arch Linux.

## Getting Started on NixOS
Generate a base system and clone this repo in the home (~) directory. Afterwards symlink selected `.nix` files:
``` sh
git clone git@github.com:andre-dossinger/dotfiles.git
cp -r dotfiles/.git .git
rm -rf dotfiles
git add .
git stash
git stash drop

sudo rm /etc/nixos/configuration.nix
sudo ln .nixos/configuration.nix /etc/nixos/configuration.nix # adjust imports according to selected .nix files
sudo ln .nixos/<other-config-files>.nix
```

For now oh-my-zsh and powerlevel10k must be installed manually:
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```

**Note:** For newly onboarded systems it is recommended to use BTRFS. To enable DUP profile also on the data use `sudo btrfs balance start -dconvert=dup  -mconvert=dup /`. You can check the effect using `sudo btrfs filesystem df /`.

