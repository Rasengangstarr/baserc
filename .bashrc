#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias l='ls -ltra --color=auto'
alias v='vim'
alias ezwall='/home/dw/docs/projects/EzWall/ezwall.sh'
alias ezrice='/home/dw/docs/projects/EzWall/ezrice.sh'
alias g='grep'
alias gi='grep -irn'
alias f='find . -name '
alias lock='gpg -c --no-symkey-cache'
export PATH="/home/dw/docs/projects/EzWall/ezrice.sh:$PATH"

PS1='[\u@\h \W]\$ '

# Only works if you have the quotes.txt file

shuf -n 1 ~/docs/projects/linusquotes/quotes.txt

eval "$(starship init bash)"

