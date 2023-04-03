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
alias d="dir"
alias dir="ls -l"
alias f="finger"
alias g="grep --color=auto"
alias gph="git push -v --follow-tags"
alias gpl="git pull -v --autostash --rebase --recurse-submodules"
alias l="last"
alias ll="ls -l"
alias lo="logout"
alias m="more"
alias md="mkdir"
alias more="most"
alias myip="curl -s https://httpbin.org/ip | jq .origin"
alias o="xdg-open"
alias psa="ps awx"
alias psm="ps -O rss,vsz -U $USER"
alias psr="psu root"
alias psu="ps -U"
alias s="screen"
alias smic="sudo env -i PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin /usr/bin/make install clean"
alias ssh="ssh -C -e none -v"
alias y="ydict.js"
#
if [[ -x /opt/local/bin/gtelnet ]]; then
    alias "t=gtelnet"
else
    alias "t=telnet"
fi
#
function db.warmup() {
    pt-find --charset=utf8 --print -h $1 | xargs -t -P8 -I% -n1 sh -c "echo 'SELECT COUNT(*) FROM %;' | mysql -h $1 > /dev/null"
}
#
if [[ -x /usr/bin/nvim || -x /usr/local/bin/nvim ]]; then
    alias vim="nvim"
    export EDITOR="nvim"
else
    export EDITOR="vim"
fi
#
export ANDROID_SDK_ROOT=/usr/lib/android-sdk
export BLOCKSIZE="k"
export GIT_PAGER="less"
export HISTTIMEFORMAT="%y/%m/%d %T "
export HOMEBREW_NO_ANALYTICS=1
export LESS="-EfmrSwX"
export LSCOLORS="gxfxcxdxbxegedabagacad"
export PATH="${HOME}/bin:${HOME}/.local/bin:${HOME}/.config/composer/vendor/bin:${HOME}/node_modules/.bin:/usr/local/sbin:/usr/sbin:/sbin"
export PYTHONDONTWRITEBYTECODE=yes
export QUILT_PATCHES="debian/patches"
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
