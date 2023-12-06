# dotfiles

Here you find my favorite dotfiles (the ones I would miss in case my systems get nuked). Feel free to copy, modify, distribute, merge or make fun of them. If the latter is the case I would appreciate tips for improvement.

*Note:* Compatibility is only verified on Arch Linux and NixOS.

## Getting Started on NixOS
Generate a base system and clone this repo in the home (~) directory. Afterwards change the NixOS configuration location to a fitting leaf configuration in your home directory:
``` sh
git clone git@github.com:andre-dossinger/dotfiles.git
cp -r dotfiles/.git .git
rm -rf dotfiles
git add .
git reset .ssh
git stash
git stash drop

sudo nix-channel --add https://nixos.org/channels/nixos-unstable nixos
sudo nixos-rebuild switch --upgrade
sudo nixos-rebuild switch -I nixos-config=/home/ad/.nixos/<wanted-leaf-configuration>.leaf.nix
sudo rm /etc/nixos/configuration.nix
```
After changing the NixOS configuration location the system can be rebuild as per usual using `sudo nixos-rebuild switch --upgrade`.

For now oh-my-zsh and powerlevel10k must be installed manually:
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```

**Note:** For newly onboarded systems it is recommended to use BTRFS. To enable DUP profile also on the data use `sudo btrfs balance start -dconvert=dup  -mconvert=dup /`. You can check the effect using `sudo btrfs filesystem df /`.

