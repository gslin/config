#
umask 022
cd "${HOME}"
#
alias SYNC="sync; sync; sync"
alias c="clear"
alias cd..="cd .."
alias cd...="cd ../.."
alias cls="clear"
alias d="dir"
alias dir="ls -l"
alias f="finger"
alias g="grep --color=auto"
alias gph="git push -v --tags"
alias gpl="git pull -v --rebase --recurse-submodules=yes"
alias l="last"
alias lo="logout"
alias m="more"
alias md="mkdir"
alias more="most"
alias myip="curl -s https://httpbin.org/ip | jq .origin"
alias o="xdg-open"
alias psa="ps awx"
alias psm="ps -U $USER"
alias psr="psu root"
alias psu="ps -U"
alias s="screen"
alias smic="sudo env -i PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin /usr/bin/make install clean"
alias ssh="ssh -C -e none -v"
alias t="telnet"
#
export BLOCKSIZE="k"
export EDITOR="vim"
export GIT_PAGER="less"
export HISTTIMEFORMAT="%y/%m/%d %T "
export HOMEBREW_NO_ANALYTICS=1
export LESS="-EfmrSwX"
export LSCOLORS="gxfxcxdxbxegedabagacad"
export PATH="$HOME/bin:$HOME/node_modules/.bin:/usr/local/sbin:/usr/sbin:/sbin:$PATH"
export PERL_CPANM_OPT="--mirror http://cpan.nctu.edu.tw/ --mirror http://cpan.cpantesters.org/"
export QUILT_PATCHES="debian/patches"
#
function http10()
{
    echo "$1 $2 HTTP/1.0"
    echo "Connection: close"
    echo ""
}

function http11()
{
    echo "$1 $3 HTTP/1.1"
    echo "Host: $2"
    echo "Connection: close"
    echo ""
}
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
if [ "`uname -s`" == "FreeBSD" -o "`uname -s`" == "Darwin" ]; then
    alias ls="/bin/ls -aFG"
    alias w="/usr/bin/w -i"
elif [ "`uname -s`" == "Linux" ]; then
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
