# dotfiles

Here you find my favorite dotfiles (the ones I would miss in case my systems get nuked). Feel free to copy, modify, distribute, merge or make fun of them. If the latter is the case I would appreciate tips for improvement.

*Note:* Compatibility is only verified on Arch Linux and NixOS.


## Getting Started

``` sh
git clone git@github.com:andre-dossinger/dotfiles.git
cp -r dotfiles/.git .git
rm -rf dotfiles
git add .
git reset <files-to-keep>
git stash
git stash drop
```
