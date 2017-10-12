# runs on new shell

if tty -s; then
    echo "running .bashrc"
    if [ -f ${HOME}/.alias ]; then
        source ${HOME}/.alias && echo "running .alias"
    fi

    case $TERM in
        xterm*|rxvt*)
            # show git information on prompt
            GIT_PS1_SHOWUPSTREAM="auto"
            GIT_PS1_SHOWDIRTYSTATE=1
            if [ -r ~/.git-prompt.sh ] && git --version > /dev/null 2>&1; then
                . $HOME/.git-prompt.sh
                PS1='\[\033\e[0;36m\]\u\[\033\e[1;30m\]@\[\033\e[1;34m\]\h:\[\033\e[0;32m\]\w$(__git_ps1)\[\033\e[m\]\n\\$ '
            else
                PS1='\u@\h:\W\$ '
            fi
            ;;
        screen)
            PS1='\u@\h:\w\n[screen]\$ '
            ;;
        linux)
            PS1='\u@\h:\W$(__git_ps1)\$ '
            ;;
        *)
            PS1='bash\\$ '
            ;;
    esac

    # History date/time
    HISTTIMEFORMAT="%F %T | "
    export HISTTIMEFORMAT

    # autocomplete
    complete -cf sudo
    complete -cf man
    complete -cf so

    # set title in xterm window
    # set creen title
    function shdr   {
    if [ "$TERM" = "xterm" -o "$TERM" = "rxvt" ] ; then
        printf '\033]2;'$*'\07'
    fi
    }
    shdr `hostname`
fi
