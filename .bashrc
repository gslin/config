#
umask 022
cd "${HOME}"
#
alias SYNC="sync; sync; sync"
alias c="clear"
alias ccat="pygmentize -g"
alias cd..="cd .."
alias cd...="cd ../.."
alias cls="clear"
alias cutl="cut -c -\$(tput cols)"
alias d="dir"
alias dir="ls -l"
alias f="finger"
alias g="grep --color=auto"
alias gph="git push -v --follow-tags"
alias gpl="git pull -v --all --autostash --rebase --recurse-submodules"
alias l="last"
alias ll="ls -l"
alias lo="logout"
alias m="more"
alias md="mkdir"
alias more="most"
alias myip="curl -s https://httpbin.org/ip | jq .origin"
alias o="xdg-open"
alias psa="ps auwwx"
alias psm="ps -O rss,vsz -U $USER -ww"
alias psr="psu root"
alias psu="ps -ww -U"
alias s="screen"
alias ssh="ssh -C -e none"
#
if [[ -x /opt/local/bin/gtelnet ]]; then
    alias "t=gtelnet"
else
    alias "t=telnet"
fi
#
if [[ -x /opt/homebrew/bin/nvim || -x /usr/bin/nvim || -x /usr/local/bin/nvim ]]; then
    alias vim="nvim"
    export EDITOR="nvim"
else
    export EDITOR="vim"
fi
#
export BLOCKSIZE="k"
export GH_PAGER="less"
export GIT_PAGER="less"
export HISTTIMEFORMAT="%y/%m/%d %T "
export HOMEBREW_NO_ANALYTICS=1
export LESS="-EfmrSwX"
export LSCOLORS="gxfxcxdxbxegedabagacad"
export PYTHONDONTWRITEBYTECODE=yes
export QUILT_PATCHES="debian/patches"
#
if [[ ! "${PATH}" =~ "(^|:)/bin(:|$)" ]]; then
    export PATH="/bin:${PATH}"
fi
if [[ ! "${PATH}" =~ "(^|:)/sbin(:|$)" ]]; then
    export PATH="/sbin:${PATH}"
fi
if [[ ! "${PATH}" =~ "(^|:)/usr/bin(:|$)" ]]; then
    export PATH="/usr/bin:${PATH}"
fi
if [[ ! "${PATH}" =~ "(^|:)/usr/sbin(:|$)" ]]; then
    export PATH="/usr/sbin:${PATH}"
fi
if [[ ! "${PATH}" =~ "(^|:)/usr/local/bin(:|$)" ]]; then
    export PATH="/usr/local/bin:${PATH}"
fi
if [[ ! "${PATH}" =~ "(^|:)/usr/local/sbin(:|$)" ]]; then
    export PATH="/usr/local/sbin:${PATH}"
fi
if [[ ! "${PATH}" =~ "(^|:)${HOME}/bin(:|$)" ]]; then
    export PATH="${HOME}/bin:${PATH}"
fi
if [[ ! "${PATH}" =~ "(^|:)${HOME}/\\.local/bin(:|$)" ]]; then
    export PATH="${HOME}/.local/bin:${PATH}"
fi
#
if [ -e /usr/lib/jvm/default-java ]; then
    export JAVA_HOME=/usr/lib/jvm/default-java
fi
#
# Hack for gnome-terminal
if [ "$COLORTERM" == "gnome-terminal" -a -z "$TMUX" -a -z "$SCREEN" ]; then
    export TERM=xterm-256color
fi
#
if [ -z "${LANG}" ]; then
    export LANG="en_US.UTF-8"
fi
if [ -x /usr/local/bin/most -o -x /usr/bin/most ]; then
    export PAGER="most"
else
    export PAGER="less"
fi
#
shopt -s checkwinsize
shopt -s histappend
#
if [ $(uname -s) == "FreeBSD" -o $(uname -s) == "Darwin" ]; then
    alias ls="/bin/ls -aFG"
    alias w="/usr/bin/w -i"
elif [ $(uname -s) == "Linux" ]; then
    alias ls="/bin/ls -aF --color=always"
else
    alias ls="/bin/ls -aF"
fi
#
[[ -s "/etc/bash_completion" ]] && source "/etc/bash_completion"
[[ -s "/usr/local/share/bash-completion/bash_completion" ]] && source "/usr/local/share/bash-completion/bash_completion"
[[ -s "/usr/local/share/git-core/contrib/completion/git-completion.bash" ]] && source "/usr/local/share/git-core/contrib/completion/git-completion.bash"
#
if [ -z "$WINDOW" ]; then
    if type __git_ps1 > /dev/null 2>&1; then
        PS1='\[\e[G\e[m\e[32m\]\u\[\e[m\]@\[\e[36m\]\h\[\e[m\] [\[\e[32m\]\w\[\e[m\]] [\[\e[36m\]\A\[\e[m\]]\[\e[1;30m\]$(__git_ps1)\[\e[m\] '
    else
        PS1='\[\e[G\e[m\e[32m\]\u\[\e[m\]@\[\e[36m\]\h\[\e[m\] [\[\e[32m\]\w\[\e[m\]] [\[\e[36m\]\A\[\e[m\]]\[\e[0m\] '
    fi
else
    if type __git_ps1 > /dev/null 2>&1; then
        PS1='\[\e[G\e[m\e[32m\]\u\[\e[m\]@\[\e[36m\]\h\[\e[m\] [\[\e[32m\]\w\[\e[m\]] [\[\e[36m\]\A\[\e[m\]/\[\e[36m\]W$WINDOW\[\e[m\]]\[\e[1;30m\]$(__git_ps1)\[\e[m\] '
    else
        PS1='\[\e[G\e[m\e[32m\]\u\[\e[m\]@\[\e[36m\]\h\[\e[m\] [\[\e[32m\]\w\[\e[m\]] [\[\e[36m\]\A\[\e[m\]/\[\e[36m\]W$WINDOW\[\e[m\]] '
    fi
fi
#
[[ -s "$HOME/.bashrc.local" ]] && source "$HOME/.bashrc.local"
