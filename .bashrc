# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

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
HISTSIZE=10000
HISTFILESIZE=10000

# Add a timestamp to each command.
export HISTTIMEFORMAT="%Y/%m/%d %H:%M:%S:   "

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
force_color_prompt=yes

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

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

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

# show current AWS profile
aws_profile() {
      if [[ -n $AWS_PROFILE ]]; then
              echo -n "[$AWS_PROFILE] "
                  else
                          echo -n ""
                              fi
                            }
                            PS1="\$(aws_profile)\[\033[01;34m\]\w\[\033[00m\]\$ "

# checker for AWS profiles
setprofile() {
    if [ $(cat ~/.aws/config | grep "\[profile $1\]" | wc -l) == 0 ]; then
          echo "Invalid profile name"
            else
                  export AWS_PROFILE=$1
                    fi
                  }
# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

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

# Customize Path
export PATH="$HOME/bin:$PATH"

#additional PATH for python
export PATH="/home/mrod/.local/bin:$PATH"

#set env variables
export KUBECONFIG=~/.kube/config:~/.kube/config-dev
#export GOPATH=$HOME/go

#list last 10 directories
d () {
	if [[ -n $1 ]]
	then
		 dirs "$@"
	else
	       	dirs -v | head -10
       	fi
	}

# WSL (Windows Subsystem for Linux) specific settings.
if grep -qE "(Microsoft|WSL)" /proc/version &>/dev/null; then
    # Adjustments for WSL's file / folder permission metadata.
    if [ "$(umask)" = "0000" ]; then
      umask 0022
    fi

    # Access local X-server with VcXsrv.
    #   Requires: https://sourceforge.net/projects/vcxsrv/ (or alternative)
    #export DISPLAY=:0

    # Configure the Docker CLI to use the Docker for Windows daemon.
    #   Requires: https://docs.docker.com/docker-for-windows/install/
    #export DOCKER_HOST=tcp://localhost:2375
fi

#Use keychain to store ssh key password
/usr/bin/keychain --nogui /c/Users/mr186081/.ssh/id_rsa
source $HOME/.keychain/$HOSTNAME-sh

#open port to wsl docker 
#export DOCKER_HOST=tcp://localhost:2375

[[ -s "/home/mrod/.gvm/scripts/gvm" ]] && source "/home/mrod/.gvm/scripts/gvm"

#show git branch in terminal
#parse_git_branch() {
#       git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
#     }
#     export PS1="\u@\h \[\e[32m\]\w \[\e[91m\]\$(parse_git_branch)\[\e[00m\]$ "
#
#show kubeconfig in terminal
#__kube_ps1() {
      # Get current context
#      CONTEXT=$(cat ~/.kube/config | grep "current-context:" | sed "s/current-context: //")
#
#              if [ -n "$CONTEXT" ]; then
#                        echo "(k8s: ${CONTEXT})"
#              fi
#            }
#            export PS1="${BLUE}\W ${GREEN}\u${YELLOW}\$(__kube_ps1)${NORMAL} \$ "
#set .netrc env
export GIT_NETRC_FILE='/home/mrod/.netrc'

#vagrant wsl config
#export VAGRANT_WSL_ENABLE_WINDOWS_ACCESS="1"
#export PATH=$PATH:/c/Windows/System32
#export PATH="$PATH:/c/Program Files/Oracle/VirtualBox"

#function for activating venv for python repos
function chpwd {
    if [[ -d .venv ]]; then
          VENV_ROOT_DIR=$PWD
              source .venv/bin/activate
                elif [[ ! -z $VENV_ROOT_DIR ]] && [[ $PWD != ${VENV_ROOT_DIR}* ]]; then
                      unset VENV_ROOT_DIR
                          deactivate
                            fi
                          }

#enable use of bash prompt script
. ~/.bash_prompt
