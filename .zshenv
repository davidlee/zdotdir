#!/bin/zsh
#
# .zshenv - Zsh environment file, loaded always.
#

# Set ZDOTDIR to re-home Zsh.
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-$HOME/.config}
export ZDOTDIR=${ZDOTDIR:-$XDG_CONFIG_HOME/zsh}

#
# ENV
#
export LANG=en_AU.UTF-8
export EDITOR='nvim'
export DIFFPROG='nvim -d'
export FZF_DEFAULT_COMMAND='rg --no-messages --files --no-ignore --hidden --follow --glob "!.git/*"'
export FZF_DEFAULT_OPTS="--no-separator --layout=reverse --inline-info"
# zoxide directory preview options
export _ZO_FZF_OPTS="--no-sort --keep-right --height=50% --info=inline --layout=reverse --exit-0 --select-1 --bind=ctrl-z:ignore --preview='\command exa --long --all {2..}' --preview-window=right"
# use nvim as man viewer
export MANPAGER='nvim +Man!'

# history
HISTFILE="${ZDOTDIR:-$HOME}/.zsh_history"       # The path to the history file.
HISTSIZE=1000000000              # The maximum number of events to save in the internal history.
SAVEHIST=1000000000              # The maximum number of events to save in the history file.

# highlight style
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets cursor root line)
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#4e4e4e"
ZSH_HIGHLIGHT_STYLES[cursor]='bg=#4e4e4e'

setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ':start:elapsed;command' format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Do not execute immediately upon history expansion.

# You can use .zprofile to set environment vars for non-login, non-interactive shells.
if [[ ( "$SHLVL" -eq 1 && ! -o LOGIN ) && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi

if [[ ( "$SHLVL" -eq 1 && ! -o LOGIN ) && -s "${ZDOTDIR:-$HOME}/.zsh_secrets" ]]; then
  source "${ZDOTDIR:-$HOME}/.zsh_secrets"
fi
