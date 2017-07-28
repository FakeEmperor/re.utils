# .bashrc

# User specific aliases and functions

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
# alias vim='gvim -v'

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# COLORS!!! YAY
export LS_OPTIONS='--color=auto'
export TERM=xterm-256color
eval `dircolors`
alias ls='ls $LS_OPTIONS'
alias grep='grep $LS_OPTIONS'
alias la='ls -a $LS_OPTIONS'
alias ll='ls -la $LS_OPTIONS'
# if time is enabled

# COLORING - enclose text in "\[\033[$WIDTH_TYPE$;$COLOR$m\]"
# Example - \[\033[01;31m\] (bold red)
color=31
ps1='\[\033[01;${color}m\]\u@\h:\w\$\[\033[00m\] '
time_addon='\D{%d.%m.%Y %H:%M}'
time_addon_color='\[\033[02;35m\]'

time_addon_enable=false
time_addon_newline=true
if [ "$time_addon_enable" = true ] ; then
  time_addon=$time_addon_color$time_addon
  if [ "$time_addon_newline" = true ] ; then
  time_addon=$time_addon'\n' 
  fi
  time_addon=$time_addon$time_addon_color
  ps1=$time_addon$ps1  
fi
export PS1=$ps1

# disable CTRL+S
stty -ixon
