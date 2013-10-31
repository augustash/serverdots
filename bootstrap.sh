#!/usr/bin/env bash
#
# Thanks to Gianni Chiappetta (https://github.com/gf3/dotfiles)

#-----------------------------------------------------------------------------
# Functions
#-----------------------------------------------------------------------------

# Notice title
notice() { echo -e "\033[1;32m=> $1\033[0m"; }

# Error title
error() { echo -e "\033[1;31m=> Error: $1\033[0m"; }

# List item
c_list() { echo -e "  \033[1;32m✔\033[0m $1"; }

# Error list item
e_list() { echo -e "  \033[1;31m✖\033[0m $1"; }

# Check for dependency
dep() {
  type -p $1 &> /dev/null
  local installed=$?
  if [ $installed -eq 0 ]; then
    c_list $1
  else
    e_list $1
  fi
  return $installed
}

backup() {
  mkdir -p $backupdir
  rsync -az --exclude-from=EXCLUDE $HOME/ $backupdir/
}

install() {
  rsync -az --exclude-from=EXCLUDE . $HOME
}

#-----------------------------------------------------------------------------
# Initialize
#-----------------------------------------------------------------------------

backupdir="$HOME/.dotfiles-bak/$(date "+%Y%m%d%H%M.%S")"
dependencies=(git zsh rsync)

#-----------------------------------------------------------------------------
# Dependencies
#-----------------------------------------------------------------------------

notice "Checking dependencies"

not_met=0
for need in "${dependencies[@]}"; do
  dep $need
  met=$?
  not_met=$(echo "$not_met + $met" | bc)
done

if [ $not_met -gt 0 ]; then
  error "$not_met dependencies not met!"
  exit 1
fi


#-----------------------------------------------------------------------------
# Install
#-----------------------------------------------------------------------------

# Assumes $HOME/.dotfiles is *ours*
if [ -d $HOME/.dotfiles ]; then
  pushd $HOME/.dotfiles

  # Update Repo
  notice "Updating"
  git pull origin facelift
  git submodule init
  git submodule update

  # Backup
  notice "Backup up old files ($backupdir)"
  backup

  # Install
  notice "Installing"
  install
  vim +BundleInstall +BundleUpdate +qall 2>/dev/null
else
  # Clone Repo
  notice "Downloading"
  git clone -b facelift --recursive git://github.com/augustash/serverdots.git $HOME/.dotfiles

  pushd $HOME/.dotfiles

  # Backup
  notice "Backup up old files ($backupdir)"
  backup

  # Install
  notice "Installing"
  install
  vim +BundleInstall +BundleUpdate +qall 2>/dev/null
fi


#-----------------------------------------------------------------------------
# Finished
#-----------------------------------------------------------------------------

popd
notice "Done"
exec $SHELL -l
