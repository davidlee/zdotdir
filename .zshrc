# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

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

# brew install zoxide exa fzf ripgrep nvim tldr lsd ncdu tree

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

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh


# hax from the asdf direnv plugin to load asdf w. improved perf
source "${XDG_CONFIG_HOME:-$HOME/.config}/asdf-direnv/zshrc"
