#
umask 022
cd $HOME
#
alias SYNC "/bin/sync; /bin/sync; /bin/sync"
alias bye "logout"
alias c "cls"
alias cd.. "cd .."
alias cd... "cd ../.."
alias cls "clear"
alias d "ls -l"
alias dir "ls -l"
alias dir/p "ls -l \!* | less"
alias f "finger"
alias g "grep --color --mmap"
alias l "last \!* | less"
alias ls "ls-F -aFGg"
alias m "more"
alias more "less"
alias psa "ps -awx"
alias psm "psu $USER"
alias psr "psu root"
alias psu "/bin/ps -w -U \!* | less -EmrSw"
alias s "/usr/local/bin/screen"
alias ssh "/usr/bin/ssh -4 -C -e none"
alias t "telnet"
#
set autoexpand
set autolist
set history = 5000
set prompt = "%B%m%b [%/] -%n- "
#
set savehist = 5000
#
setenv EDITOR "vim"
setenv LESS "-EfmrSwX"
setenv LSCOLORS "gxfxcxdxbxegedabagacad"
setenv PAGER "most"
setenv PERL_CPANM_OPT="--mirror http://cpan.nctu.edu.tw/ --mirror http://cpan.cpantesters.org/"
setenv VISUAL $EDITOR
