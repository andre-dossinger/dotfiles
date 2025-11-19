# dotfiles

Here you find my favorite dotfiles (the ones I would miss in case my systems get nuked). Feel free to copy, modify, distribute, merge or make fun of them. If the latter is the case I would appreciate tips for improvement.

*Note:* Compatibility is only verified on NixOS.

## Getting Started

Currently [oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh) is configured to use [Starship](https://github.com/starship/starship) and [zsh-vi-mode](https://github.com/jeffreytse/zsh-vi-mode?tab=readme-ov-file).

``` sh
git clone git@github.com:andre-dossinger/dotfiles.git
cp -r dotfiles/.git .git
rm -rf dotfiles
git add .
git reset <files-to-keep>
git stash
git stash drop

# install oh-my-zsh plugins - make sure to restart your shell and ensure that $ZSH_CUSTOM is set before continuing

# install zsh-vi-mode plugin for oh-my-zsh
git clone https://github.com/jeffreytse/zsh-vi-mode $ZSH_CUSTOM/plugins/zsh-vi-mode
```
