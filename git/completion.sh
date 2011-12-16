# Uses git's autocompletion for inner commands. Assumes an install of git's
# bash `git-completion` script at $completion below

# Updated file found: https://github.com/git/git/blob/master/contrib/completion/git-completion.bash
completion=/etc/bash_completion.d/git

if test -f $completion
then
  source $completion
fi
