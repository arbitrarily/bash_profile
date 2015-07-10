# alias for sublime
alias subl='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'

# for those using edit
alias edit='subl'

# change to root
alias ~="cd ~"

# clear
alias c='clear'

# shorter back out
alias ..='cd ..'
alias ...='cd ../../../'
alias ....='cd ../../../../'
alias .....='cd ../../../../'

# bash
alias bash='vim ~/.bash_profile'

# reload shell
alias reload='source ~/.bash_profile'

# edit httpd.conf
alias httpd='sudo vim /etc/apache2/httpd.conf'

# edit httpd-vhosts.conf
alias vhosts='sudo vim /private/etc/apache2/extra/httpd-vhosts.conf'

# colored search in files
alias grep='grep --color=auto'

# common projects
alias lexi='cd /Users/arbitrarily/Git/lexichronic-v3/'
alias lexisass='cd /Users/arbitrarily/Git/lexichronic-v3/wp-content/themes/lexiv3/grunt'
alias aggro='cd /Users/arbitrarily/Git/datnexus'
alias aggrosass='cd /Users/arbitrarily/Git/datnexus/wp-content/themes/datnexus/grunt'
alias nt='cd /Users/arbitrarily/Git/jetway'

# hosts
alias hosts='sudo vim /etc/hosts'

# keys
alias keys='pbcopy < ~/.ssh/id_rsa.pub'

# find todos
alias todos='ack -n --nogroup "(TODO|FIND|FIX(ME)?):"'

# find by name
alias qfind="find . -name "

# mute
alias stfu='osascript -e "set volume output muted true"'

# copy pwd
alias cpwd='pwd|tr -d "\n"|pbcopy'
# alias cl='fc -e -|pbcopy'

# remove .git
alias ungit='find . -name '.git' -exec rm -rf {} \;'

# IP info
alias ip='curl http://ipecho.net/plain; echo'
# alias ip="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"

# computer power options
alias reboot='sudo /sbin/reboot'
alias shutdown='sudo /sbin/shutdown'
alias lock='/System/Library/CoreServices/"Menu Extras"/User.menu/Contents/Resources/CGSession -suspend'
# alias poweroff='sudo /sbin/poweroff'
# alias halt='sudo /sbin/halt'

# git log detailed
alias glg='git log --date-order --all --graph --format="%C(green)%h%Creset %C(yellow)%an%Creset %C(blue bold)%ar%Creset %C(red bold)%d%Creset%s"'

# git log files changed
alias glg2='git log --date-order --all --graph --name-status --format="%C(green)%H%Creset %C(yellow)%an%Creset %C(blue bold)%ar%Creset %C(red bold)%d%Creset%s"'

# history
alias h='history'

# don't record these commands in the history
export HISTIGNORE='pwd:ls:history:subl:open:h'

# keep the history size up to 4096 lines
export HISTSIZE=4096

# timestamps in history
export HISTTIMEFORMAT='%F %T '

# record only the most recent duplicated command (see above)
export HISTCONTROL=ignoreboth

# time
alias now='date +"%T"'
alias nowtime=now
alias nowdate='date +"%d-%m-%Y"'

# open with chrome
# alias chrome='open -a \"Google Chrome\"'

# alias for detailed, colored ls
alias ls='ls -lhaG'

# Set the default editor to vim.
export EDITOR=vim

# Clean VIM swp
alias vimclean="find . -iname '*sw[po]' -print -delete"

# cd - then list
# cd() { builtin cd "$@"; ls; }

# count how many files in folder (not hidden)
alias numfiles='echo $(ls -1 | wc -l)'

# active connections
alias connections='lsof -i'

# apache logs
alias apachelogs="less +F /var/log/apache2/error_log"

# Colors!
if [[ $COLORTERM = gnome-* && $TERM = xterm ]] && infocmp gnome-256color >/dev/null 2>&1; then
        export TERM=gnome-256color
elif infocmp xterm-256color >/dev/null 2>&1; then
        export TERM=xterm-256color
fi

if tput setaf 1 &> /dev/null; then
        tput sgr0
        if [[ $(tput colors) -ge 256 ]] 2>/dev/null; then
                MAGENTA=$(tput setaf 9)
                ORANGE=$(tput setaf 172)
                GREEN=$(tput setaf 190)
                PURPLE=$(tput setaf 141)
                WHITE=$(tput setaf 7)
        else
                MAGENTA=$(tput setaf 5)
                ORANGE=$(tput setaf 4)
                GREEN=$(tput setaf 2)
                PURPLE=$(tput setaf 1)
                WHITE=$(tput setaf 7)
        fi
        BOLD=$(tput bold)
        RESET=$(tput sgr0)
else
        MAGENTA="\033[1;31m"
        ORANGE="\033[1;33m"
        GREEN="\033[1;32m"
        PURPLE="\033[1;35m"
        WHITE="\033[1;37m"
        BOLD=""
        RESET="\033[m"
fi

export MAGENTA
export ORANGE
export GREEN
export PURPLE
export WHITE
export BOLD
export RESET

function parse_git_dirty() {
        [[ $(git status 2> /dev/null | tail -n1) != *"working directory clean"* ]] && echo "*"
}

function parse_git_branch() {
        git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/\1$(parse_git_dirty)/"
}

export PS1="\[${BOLD}${MAGENTA}\]\u \[$WHITE\]$WHITE\]in \[$GREEN\]\w\[$WHITE\]\$([[ -n \$(git branch 2> /dev/null) ]] && echo \" on \")\[$PURPLE\]\$(parse_git_branch)\[$WHITE\]\n\$ \[$RESET\]"
export PS2="\[$ORANGE\]→ \[$RESET\]"

# export PATH=/usr/local/bin:$PATH
# export PATH=/usr/local/share/npm/lib/node_modules/grunt-cli/bin:$PATH
# export PATH="/usr/local/share/npm/bin:$PATH"
# export PATH="~/.composer/vendor/bin:$PATH"
# export PATH="/Users/arbitrarily/pear/bin"
# export PATH=/usr/local/bin:$PATH
# export PATH=/usr/local/share/npm/lib/node_modules/grunt-cli/bin:$PATH
# export PATH="/usr/local/share/npm/bin:$PATH"

export PATH=/bin:/sbin:/usr/bin:/usr/local/sbin:/usr/local/bin:/bin:/sbin:/usr/bin:/usr/local/sbin:/usr/local/bin:/Users/arbitrarily/pear/bin:~/.composer/vendor/bin:/usr/local/share/npm/bin:/usr/local/bin:/usr/local/mysql/bin:/usr/local/share/npm/lib/node_modules/grunt-cli/bin:/usr/sbin/apachectl:/usr/sbin:/usr/local/opt/php56/libexec/apache2:/usr/local/share/npm/bin

# what's in path
alias path='echo -e ${PATH//:/\\n}'
