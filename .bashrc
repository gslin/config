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
alias l="last"
alias lo="logout"
alias m="more"
alias md="mkdir"
alias more="most"
alias psa="ps awx"
alias psm="ps -U $USER"
alias psr="psu root"
alias psu="ps -U"
alias s="screen"
alias ssh="ssh -4 -C -e none -v"
alias t="telnet"
#
complete -o dirnames -o default -o nospace cd
complete -c -o default -o nospace sudo
#
export EDITOR="vim"
export GIT_PAGER="less"
export LESS="-EfmrSwX"
export LSCOLORS="gxfxcxdxbxegedabagacad"
export PERL_CPANM_OPT="--mirror http://cpan.nctu.edu.tw/ --mirror http://cpan.cpantesters.org/"
#
if [ -x most ]; then
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
if [ -z "$WINDOW" ]; then
    PS1='\[\e[0m\e[32m\]\u\[\e[0m\]@\[\e[36m\]\h\[\e[0m\] [\[\e[32m\]\w\[\e[0m\]] [\[\e[36m\]\A\[\e[0m\]] '
else
    PS1='\[\e[0m\e[32m\]\u\[\e[0m\]@\[\e[36m\]\h\[\e[0m\] [\[\e[32m\]\w\[\e[0m\]] [\[\e[36m\]\A\[\e[0m\]/\[\e[36m\]W$WINDOW\[\e[0m\]] '
fi
#
cd "${HOME}"
[[ -s "$HOME/.pythonbrew/etc/bashrc" ]] && source "$HOME/.pythonbrew/etc/bashrc"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
[[ -s "$HOME/perl5/perlbrew/etc/bashrc" ]] && source "$HOME/perl5/perlbrew/etc/bashrc"
#
[[ -s "$HOME/.bashrc.alias" ]] && source "$HOME/.bashrc.alias"
