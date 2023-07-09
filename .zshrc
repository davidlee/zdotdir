#!/bin/zsh
#
# .zshrc - Zsh file loaded on interactive shell sessions.
#

# NOTE: .zshenv symlinked at ~/.zshenv, otherwise won't run

# Binary dependencies: 
# brew - for packages
# zoxide - no more cd
# exa - vastly better ls
# fzf - absolute terminal gamechanger
# ripgrep - faster and better grep
# nvim - better vim
# tldr - super-condensed man
# lsd - better ls / tree

# brew install zoxide exa fzf ripgrep nvim tldr

# Zsh options.
setopt extended_glob
# show hidden files in completion
setopt glob_dots

##
# ANTIDOTE
##

# Autoload functions you might want to use with antidote.
ZFUNCDIR=${ZFUNCDIR:-$ZDOTDIR/functions}
fpath=($ZFUNCDIR $fpath)
fpath+=(/opt/homebrew/share/zsh-completions)
autoload -Uz $fpath[1]/*(.:t)

# Source zstyles you might use with antidote.
[[ -e ${ZDOTDIR:-~}/.zstyles ]] && source ${ZDOTDIR:-~}/.zstyles

# Clone antidote if necessary.
[[ -d ${ZDOTDIR:-~}/.antidote ]] ||
  git clone https://github.com/mattmc3/antidote ${ZDOTDIR:-~}/.antidote

# Initialize antidote
source ${ZDOTDIR:-~}/.antidote/antidote.zsh

# statically load plugins from ${ZDOTDIR:-~}/.zsh_plugins.txt
antidote load

# use emacs bindings
bindkey -e
