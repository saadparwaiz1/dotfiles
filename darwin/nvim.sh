#!/usr/bin/env bash

mkdir -p ~/Library/Application\ Support/nvim/site/pack/packages/opt

for i in $(cat plugins.txt)
do
  dir=$(basename "$i" | sed 's/\.git//g')
  git clone --depth=1 "$i"
  mv "$dir" ~/Library/Application\ Support/nvim/site/pack/packages/opt
done
