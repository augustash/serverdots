#
# Defines environment variables.
#
# This file is sourced by all instances of Zsh, and thus, it should be kept as
# small as possible and should only define environment variables.
#

#
# Exports
#

export EDITOR='vim'
export GIT_EDITOR='$EDITOR'
export SVN_EDITOR='$EDITOR'
export VISUAL='vim'
export PAGER='less'
export LESS='-F -g -i -M -R -S -w -X -z-4'

#
# Language
#

if [[ -z "$LANG" ]]; then
  export LC_ALL='en_US.UTF-8'
  export LANG='en_US.UTF-8'
fi

#
# Paths
#

path=($HOME/.bin /usr/local/{bin,sbin} $path)
