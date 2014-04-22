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
if [[ -x /usr/bin/xdg-open ]]; then
    alias "o=xdg-open"
fi
#
if [[ -x /usr/local/bin/most || -x /usr/bin/most ]]; then
    export PAGER="most"
else
    export PAGER="less"
fi
#
autoload -Uz compinit
compinit
#
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git*' formats "%b"
precmd() {
    vcs_info
    if [[ -z "$WINDOW" ]]; then
        PS1=$'%{\e[m\e[G\e[K\e[32m%}%n%{\e[m%}@%{\e[36m%}%m%{\e[m%} [%{\e[32m%}%~%{\e[m%}] [%{\e[36m%}%D{%R}%{\e[m%}] '
    else
        PS1=$'%{\e[m\e[G\e[K\e[32m%}%n%{\e[m%}@%{\e[36m%}%m%{\e[m%} [%{\e[32m%}%~%{\e[m%}] [%{\e[36m%}%D{%R}%{\e[m%}/%{\e[36m%}W${WINDOW}%{\e[m%}]%{\e[0m%} '
    fi
    if [[ ! -z "$vcs_info_msg_0_" ]]; then
        PS1+=$'%{\e[1;30m%}(${vcs_info_msg_0_})%{\e[m%} '
    fi
}
#
bindkey -e
typeset -A key
key[Delete]=${terminfo[kdch1]}
key[End]=${terminfo[kend]}
key[Home]=${terminfo[khome]}
key[Insert]=${terminfo[kich1]}
key[PageDown]=${terminfo[knp]}
key[PageUp]=${terminfo[kpp]}
[[ -n "${key[Delete]}" ]] && bindkey "${key[Delete]}" delete-char
[[ -n "${key[End]}" ]] && bindkey "${key[End]}" end-of-line
[[ -n "${key[Home]}" ]] && bindkey "${key[Home]}" beginning-of-line
[[ -n "${key[Insert]}" ]] && bindkey "${key[Insert]}" overwrite-mode
[[ -n "${key[PageDown]}" ]] && bindkey "${key[PageDown]}" end-of-buffer-or-history
[[ -n "${key[PageUp]}" ]] && bindkey "${key[PageUp]}" beginning-of-buffer-or-history
#
bindkey "[A" history-beginning-search-backward
bindkey "[B" history-beginning-search-forward
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
export HISTFILE="$HOME/.history"
export HISTSIZE=2000
export LESS="-EfmrSwX"
export LSCOLORS="gxfxcxdxbxegedabagacad"
export PATH="$HOME/bin:$HOME/node_modules/.bin:/usr/local/sbin:/usr/sbin:/sbin:$PATH"
export PERL_CPANM_OPT="--mirror http://cpan.nctu.edu.tw/ --mirror http://cpan.cpantesters.org/"
export SAVEHIST=2000
#
setopt append_history
setopt hist_ignore_all_dups
setopt menu_complete
setopt prompt_subst
#
zstyle ':completion:*' menu select
#
[[ -s "$HOME/.zshrc.local" ]] && . "$HOME/.zshrc.local"
