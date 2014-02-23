#
cd "$HOME"
#
alias "SYNC=sync;sync;sync"
alias "c=clear"
alias "cd..=cd .."
alias "cd...=cd ../.."
alias "cls=clear"
alias "d=ls -l"
alias "dir=ls -l"
alias "f=finger"
alias "g=grep --color=auto"
alias "l=last"
alias "lo=logout"
alias "m=more"
alias "more=most"
alias "psa=ps aux"
alias "psm=ps -U $USER"
alias "psr=psu root"
alias "psu=ps -U"
alias "s=screen"
alias "smic=sudo make install clean"
alias "ssh=ssh -4 -C -e none -v"
alias "t=telnet"
#
if [[ -x /usr/local/bin/most || -x /usr/bin/most ]]; then
    export PAGER="most"
else
    export PAGER="less"
fi
#
if [[ "`uname -s`" == "FreeBSD" || "`uname -s`" == "Darwin" ]]; then
    alias "ls=/bin/ls -aFG"
    alias "tmux=TERM=xterm-256color /usr/local/bin/tmux"
    alias "w=/usr/bin/w -i"
elif [[ "`uname -s`" = "Linux" ]]; then
    alias "ls=/bin/ls -aF --color=always"
    alias "tmux=TERM=screen-256color /usr/bin/tmux"
else
    alias "ls=/bin/ls -aF"
fi
#
export BLOCKSIZE="k"
export EDITOR="vim"
export GIT_PAGER="less"
export LESS="-EfmrSwX"
export LSCOLORS="gxfxcxdxbxegedabagacad"
export PATH="$HOME/bin:$HOME/node_modules/.bin:/usr/local/sbin:/usr/sbin:/sbin:$PATH"
export PERL_CPANM_OPT="--mirror http://cpan.nctu.edu.tw/ --mirror http://cpan.cpantesters.org/"
#
setopt prompt_subst
#
if [[ -z "$WINDOW" ]]; then
    PS1=$'%{\e[G\e[m\e[32m%}%n%{\e[m%}@%{\e[36m%}%m%{\e[m%} [%{\e[32m%}%~%{\e[m%}] [%{\e[36m%}%D{%R}%{\e[m%}] '
else
    PS1=$'%{\e[G\e[m\e[32m%}%n%{\e[m%}@%{\e[36m%}%m%{\e[m%} [%{\e[32m%}%~%{\e[m%}] [%{\e[36m%}%D{%R}%{\e[m%}/%{\e[36m%}W${WINDOW}%{\e[m%}]%{\e[0m%} '
fi
#
[[ -s "$HOME/.zshrc.local" ]] && . "$HOME/.zshrc.local"
