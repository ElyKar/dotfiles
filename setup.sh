#!/bin/bash
files=( ".vimrc" ".xinitrc" ".dir_colors" ".shrc_custom" ".zshrc" ".Xresources" )
for f in "${files[@]}"
do
    echo $f
    rm ~/$f
    ln -s `pwd`/$f ~/$f
done

rm ~/.xmonad/xmonad.hs
ln -s `pwd`/xmonad.hs ~/.xmonad/xmonad.hs
