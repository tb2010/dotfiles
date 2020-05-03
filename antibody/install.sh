#!/bin/sh
if command -v brew >/dev/null 2>&1; then
	brew install antibody
else
	curl -sL https://git.io/antibody | sudo sh -s -- -b /usr/local/bin
fi
antibody bundle <"$DOTFILES/antibody/bundles.txt" >~/.zsh_plugins.sh
antibody update
