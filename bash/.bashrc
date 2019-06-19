#      __ __  __   ____    _          ____               __
#   __/ // /_/ / _/_/ /_  (_)___    _/_/ /_  ____ ______/ /_
#  /_  _  __/ /_/_// __ \/ / __ \ _/_// __ \/ __ `/ ___/ __ \
# /_  _  __/_//_/ / /_/ / / / / //_/ / /_/ / /_/ (__  ) / / /
#  /_//_/ (_)_/  /_.___/_/_/ /_/_/  /_.___/\__,_/____/_/ /_/

# If not running interactively, don't do anything
case $- in
    *i*) ;;
    *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=5000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        # We have color support; assume it's compliant with Ecma-48
        # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
        # a case would tend to support setf rather than setaf.)
        color_prompt=yes
    else
        color_prompt=
    fi
fi

# function used in shell prompt to indicate exit code of last command
exit_code_indicator () {
    exit_code=$?

    if [ $exit_code -ne "0" ];then
        echo "[${exit_code}]"
    else
        echo "[${exit_code}]"
    fi
}

# # function used in shell prompt to indicated open tasks (taskwarrior)
# task_indicator () {
#     if [[ -e ~/.taskrc ]]; then
#         number_tasks_due_today=$(task +TODAY or +OVERDUE count)

#         if [ $number_tasks_due_today -ne "0" ];then
#             echo "(${number_tasks_due_today})"
#         else
#             echo "(${number_tasks_due_today})"
#         fi
#     else
#         echo "(!)"
#     fi
# }

source $HOME/.bash_git_prompt
GIT_PS1_SHOWDIRTYSTATE="true"
GIT_PS1_SHOWUNTRACKEDFILES="true"
GIT_PS1_SHOWSTASHSTATE="true"

if [ "$color_prompt" = yes ]; then
    # PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\] $(exit_code_indicator) $(task_indicator)\$ '
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\] $(exit_code_indicator) \[\e[01;36m\]$(__git_ps1 "[%s]")\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

PS2='... '

# If this is an xterm set the title to user@host:dir
case "$TERM" in
    xterm*|rxvt*)
        PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
        ;;
    *)
        ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
        . /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
    fi
fi

# ==================================
# ========== OWN SETTINGS ==========
# ==================================

# ----- Variables -----

# quick access to my folder
DOTFILES="$HOME/.MyDotfiles/dotfiles/"
DOTFILES_PRIV="$HOME/.MyDotfiles/dotfiles.priv/"
PROJECTS="$HOME/projects/"

# Preferred Vim version
VIM="nvim-qt"
VIM_TERM="nvim"

toilet_clock() {
    while true
    do
        clear
        toilet -f mono12 -F metal $(date +"%H:%M:%S")
        sleep 1
    done
}

mkcd () { mkdir -p "$@" && cd "$1"; }

# Tar my gpg-config
tar_gpg_conf() {
    cd $HOME
    tar -cvzf "gpg-config_$(date "+%F_%H%M").tgz" "./.gnupg/"
}

# Tar my ssh-config
tar_ssh_conf() {
    cd $HOME
    tar -cvzf "ssh-config_$(date "+%F_%H%M").tgz" "./.ssh/"
}

# Source private/sensible settings
if [[ -f ~/.bashrc_priv ]]
then
    source ~/.bashrc_priv
fi

# FZF fuzzy finder
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Customisations for neovim terminal
if [[ -n "$NVIM_LISTEN_ADDRESS" ]]; then
    alias nvim='cowsay "Running nvim inside nvim makes life hard -- Shakespeare"'
fi

# Always run tmux
[[ -z "$TMUX" ]] && tmux


export FZF_DEFAULT_COMMAND="find -type f \( \
                            ! -iname '.git' \
                            ! -iname '*.pyc' \
                            ! -iname '*.pdf' \
                            ! -iname '*.o' \
                            ! -iname '*.so' \
                            ! -iname '*.log' \
                            \) \
                            ! -path '~/Dropbox/*' \
                            "

export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# virtualenvwrapper
export VIRTUALENVWRAPPER_PYTHON='/usr/bin/python3'
export WORKON_HOME=$HOME/.virtualenvs
source /usr/share/virtualenvwrapper/virtualenvwrapper.sh
alias mkvirtualenv='mkvirtualenv --python=/usr/bin/python3'

# ===== Temporary =====
alias M='exec vim main.tex'

