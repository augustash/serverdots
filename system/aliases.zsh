# navigation
alias ..='cd ..'
alias ...='cd ..; cd ..;'

# search
alias f='find'
alias grep='grep --color -i'

# misc. system aliases
alias vi='/usr/bin/vim'
alias diff='diff -ubB'
alias untar='tar -zxvf'
alias cp_folder='cp -Rpv'
alias reload!='. ~/.zshrc'
alias screen='screen -U'
alias cd..='cd ..'
alias fixpermd='find . -type d -exec chmod 755 {} \;'
alias fixpermf='find . -type f -exec chmod 644 {} \;'
alias nsopen='netstat -lptu'
alias updatedb='sudo /usr/libexec/locate.updatedb'
alias flushdns='sudo dscacheutil -flushcache'
alias boot64='sudo systemsetup -setkernelbootarchitecture x86_64'

# human-readable filesizes
alias du='du -h'
alias du1='du -h --max-depth=1'
alias df='df -h'
alias free='free -m'
alias hi='history | tail -20'

# ask before clobbering a file
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
