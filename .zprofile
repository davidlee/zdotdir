#!/bin/zsh
#
# .zprofile - Zsh file loaded on login.
#

# load aliases
source ${ZDOTDIR:-~}/.aliases

#
# Browser
#

if [[ "$OSTYPE" == darwin* ]]; then
  export BROWSER="${BROWSER:-open}"
fi

#
# Editors
#

export EDITOR="${EDITOR:-nvim}"
export VISUAL="${VISUAL:-nvim}"
export PAGER="${PAGER:-less}"


#
# Paths
#

# Ensure path arrays do not contain duplicates.
typeset -gU path fpath

# Set the list of directories that zsh searches for commands.
path=(
  $HOME/{,s}bin(N)
  /opt/{homebrew,local}/{,s}bin(N)
  /usr/local/{,s}bin(N)
  $HOME/Library/Application Support/JetBrains/Toolbox/scripts
  $HOME/Library/Python/3.9/bin
  $path
)

### Golang
export GOPATH=$HOME/go
export GOROOT="$(brew --prefix golang)/libexec"

### Python
eval "$(pyenv init -)"

# Set editor default keymap to emacs (`-e`) or vi (`-v`)
bindkey -e

### this should always be last
. /opt/homebrew/opt/asdf/libexec/asdf.sh