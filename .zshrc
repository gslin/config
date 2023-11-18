#
umask 022
cd "$HOME"
#
alias "SYNC=sync;sync;sync"
alias "c=clear"
alias "ccat=pygmentize -g"
alias "cd..=cd .."
alias "cd...=cd ../.."
alias "cls=clear"
alias "d=ls -l"
alias "dir=ls -l"
alias "f=finger"
alias "g=grep --color=auto"
alias "gph=git push -v --follow-tags"
alias "gpl=git pull -v --autostash --rebase --recurse-submodules"
alias "l=last"
alias "ll=ls -l"
alias "lo=logout"
alias "m=more"
alias "more=most"
alias "myip=curl -s https://httpbin.org/ip | jq .origin"
alias "psa=ps aux"
alias "psm=ps -O rss,vsz -U $USER"
alias "psr=psu root"
alias "psu=ps -U"
alias "s=screen"
alias "smic=sudo make install clean"
alias "ssh=ssh -C -e none"
alias "y=ydict.js"
#
if [[ -x /opt/local/bin/gtelnet ]]; then
    alias "t=gtelnet"
else
    alias "t=telnet"
fi
#
if [[ -x /usr/bin/xdg-open ]]; then
    alias "o=xdg-open"
fi
#
# Hack for gnome-terminal
if [[ "$COLORTERM" == "gnome-terminal" && -z "$TMUX" && -z "$WINDOW" ]]; then
    export TERM=xterm-256color
fi
#
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git*' formats "%b"
precmd() {
    if [[ ! -z "$TMUX" ]]; then
        WINDOW=$(tmux display -p | awk '{print $2}' | awk -F: '{print $1}')
    fi

    if [[ -z "$WINDOW" ]]; then
        PS1=$'%{\e[m\e[G\e[K\e[32m%}%n%{\e[m%}@%{\e[36m%}%m%{\e[m%} [%{\e[32m%}%~%{\e[m%}] [%{\e[36m%}%D{%R}%{\e[m%}] '
    else
        PS1=$'%{\e[m\e[G\e[K\e[32m%}%n%{\e[m%}@%{\e[36m%}%m%{\e[m%} [%{\e[32m%}%~%{\e[m%}] [%{\e[36m%}%D{%R}%{\e[m%}/%{\e[36m%}W${WINDOW}%{\e[m%}]%{\e[0m%} '
    fi

    vcs_info
    if [[ ! -z "$vcs_info_msg_0_" ]]; then
        PS1+=$'%{\e[1;30m%}(${vcs_info_msg_0_})%{\e[m%} '
    fi
}
#
bindkey -e
typeset -A key
key[Delete]=${terminfo[kdch1]}
key[Down]=${terminfo[kcud1]}
key[End]=${terminfo[kend]}
key[Home]=${terminfo[khome]}
key[Insert]=${terminfo[kich1]}
key[PageDown]=${terminfo[knp]}
key[PageUp]=${terminfo[kpp]}
key[Up]=${terminfo[kcuu1]}
#
# Terminal hack (keyup/keydown) for FreeBSD
if [[ "`uname -s`" == "FreeBSD" ]]; then
    key[Down]="[B"
    key[Up]="[A"
fi
#
[[ -n "${key[Delete]}" ]] && bindkey "${key[Delete]}" delete-char
[[ -n "${key[End]}" ]] && bindkey "${key[End]}" end-of-line
[[ -n "${key[Home]}" ]] && bindkey "${key[Home]}" beginning-of-line
[[ -n "${key[Insert]}" ]] && bindkey "${key[Insert]}" overwrite-mode
[[ -n "${key[PageDown]}" ]] && bindkey "${key[PageDown]}" end-of-buffer-or-history
[[ -n "${key[PageUp]}" ]] && bindkey "${key[PageUp]}" beginning-of-buffer-or-history
#
bindkey "\e[1;3C" forward-word
bindkey "\e[1;3D" backward-word
#
autoload -Uz history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "${key[Up]}" history-beginning-search-backward-end
bindkey "${key[Down]}" history-beginning-search-forward-end
#
my-backward-delete-word() {
    local WORDCHARS=${WORDCHARS/\//}
    zle backward-delete-word
}
zle -N my-backward-delete-word
bindkey '^w' my-backward-delete-word
#
if [[ "`uname -s`" == "FreeBSD" || "`uname -s`" == "Darwin" ]]; then
    alias "ls=/bin/ls -aFG"
    alias "w=/usr/bin/w -i"
elif [[ "`uname -s`" = "Linux" ]]; then
    alias "ls=/bin/ls -aF --color=always"
else
    alias "ls=/bin/ls -aF"
fi
#
if [[ -x /usr/bin/nvim || -x /usr/local/bin/nvim ]]; then
    alias "vim=nvim"
    export EDITOR="nvim"
else
    export EDITOR="vim"
fi
#
export ANDROID_SDK_ROOT=/usr/lib/android-sdk
export BLOCKSIZE="k"
export GIT_PAGER="less"
export HISTFILE="$HOME/.history"
export HISTSIZE=2000
export HOMEBREW_NO_ANALYTICS=1
export LESS="-EfmrSwX"
export LSCOLORS="gxfxcxdxbxegedabagacad"
export PYTHONDONTWRITEBYTECODE=yes
export QUILT_PATCHES="debian/patches"
export SAVEHIST=2000
#
if [[ ! "${PATH}" =~ "(^|:)/sbin(:|$)" ]]; then
    export PATH="/sbin:${PATH}"
fi
if [[ ! "${PATH}" =~ "(^|:)/usr/sbin(:|$)" ]]; then
    export PATH="/usr/sbin:${PATH}"
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
if [[ -e /usr/lib/jvm/default-java ]]; then
    export JAVA_HOME=/usr/lib/jvm/default-java
fi
#
if [[ -x /opt/homebrew/bin/most || -x /usr/local/bin/most || -x /usr/bin/most ]]; then
    export PAGER="most"
else
    export PAGER="less"
fi
#
setopt append_history
setopt hist_ignore_all_dups
setopt menu_complete
setopt prompt_subst
#
zstyle ':completion:*' menu select
#
[[ -s "$HOME/git/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]] && . "$HOME/git/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]]
#
[[ -s "$HOME/.zshrc.local" ]] && . "$HOME/.zshrc.local"
