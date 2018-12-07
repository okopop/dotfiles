# ~/.bashrc: executed by bash(1) for non-login shells.

# If not running interactively, don't do anything
[[ -z "$PS1" ]] && return

echo "running .bashrc"
if tty -s; then
  [[ -f ${HOME}/.alias ]] && source ${HOME}/.alias && echo "running .alias"

  if [ $(uname -s) = "Linux" ]; then
    PATH=$PATH:/sbin:/usr/sbin/:/usr/local/bin:${HOME}/bin
  fi

  case $TERM in
  xterm*|rxvt*)
    GIT_PS1_SHOWUPSTREAM="auto"
    GIT_PS1_SHOWDIRTYSTATE=1
    if [ -r ~/.git-prompt.sh ] && git --version > /dev/null 2>&1; then
      . ${HOME}/.git-prompt.sh
      PS1='\[\033\e[0;36m\]\u\[\033\e[1;30m\]@\[\033\e[1;34m\]\h:\[\033\e[0;32m\]\w$(__git_ps1)\[\033\e[m\]\n\\$ '
    else
      PS1='\u@\h:\W\$ '
    fi
    ;;
  screen)
    PS1='\u@\h:\w\n[screen]\$ '
    ;;
  *)
    PS1='bash\\$ '
    ;;
  esac

  # check the window size after each command and, if necessary,
  # update the values of LINES and COLUMNS.
  shopt -s checkwinsize 

  # History date/time
  HISTTIMEFORMAT="%F %T | "
  export HISTTIMEFORMAT

  # autocomplete
  complete -cf sudo
  complete -cf man
  complete -cf so

  # set title in xterm window
  function shdr {
  if [ "$TERM" = "xterm" -o "$TERM" = "rxvt" ] ; then
    printf '\033]2;'$*'\07'
  fi
  }
  shdr `hostname`
fi
