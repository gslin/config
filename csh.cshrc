#
umask 022
cd $HOME
#
alias SYNC "/bin/sync; /bin/sync; /bin/sync"
alias bye "logout"
alias c "cls"
alias cd.. "cd .."
alias cd... "cd ../.."
alias cls "/usr/bin/tput clear"
alias d "ls -l"
alias dir "ls -l"
alias dir/p "ls -l \!* | less"
alias f "finger"
alias g "/usr/bin/grep --color --mmap"
alias l "/usr/bin/last \!* | less"
alias ls "ls-F -aFGg"
alias m "more"
alias more "less"
alias psa "ps -awx"
alias psm "psu $USER"
alias psr "psu root"
alias psu "/bin/ps -w -U \!* | less -EmrSw"
alias s "/usr/local/bin/screen"
alias ssh "/usr/bin/ssh -4 -C -e none -o ForwardAgent=yes"
alias t "telnet"
#
set autoexpand
set autolist
set history = 5000
set prompt = "%B%m%b [%/] -%n- "
#
set savehist = 5000
#
setenv EDITOR "/usr/local/bin/vim"
setenv LESS "-EfmrSw"
setenv LSCOLORS "gxfxcxdxbxegedabagacad"
setenv PAGER "/usr/local/bin/most"
setenv VISUAL $EDITOR
