# .bashrc
# 06/2024 Added TERMINFO setup
#         Startupwith neofetch (fastfetch)

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# terminal - set to xterm (updated w.r.t. to xterm-256color)
export TERMINFO=`ncurses6-config --terminfo-dirs`
export TERM=xterm

# Command history
# See https://unix.stackexchange.com/questions/1288/preserve-bash-history-in-multiple-terminal-windows/48116#48116
HISTSIZE=20000
HISTFILESIZE=$HISTSIZE
HISTCONTROL=ignorespace:ignoredups
_bash_history_sync() {
    builtin history -a         #1
    HISTFILESIZE=$HISTSIZE     #2
    builtin history -c         #3
    builtin history -r         #4
}
history() {                  #5
    _bash_history_sync
    builtin history "$@"
}
PROMPT_COMMAND=_bash_history_sync

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH=/usr/local/cuda/bin:/opt/nvim/bin:$PATH
export PATH=/home/jonathan/Programs/postman-linux-x64/Postman:$PATH
export PATH=/opt/qemu/bin:$PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
alias vi='nvim'
alias neofetch='fastfetch'
alias df='df -BG'

# conda initialize (removed)

# run neofetch (fastfetch)
fastfetch
