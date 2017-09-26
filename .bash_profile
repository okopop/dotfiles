# runs once at login time, for every new shell .bashrc is executed.

if tty -s; then
    echo "running .bash_profile"

    # Information about OS
    hostna=`uname -r`
    ipna=`uname -n`
    osna=`uname -s`
    ut=`/usr/bin/uptime|awk '{print $3}'`
    if [ -f /etc/SuSE-release ]; then
      os_ver="SLES"
    fi
    if [ -f /etc/redhat-release ]; then
      os_ver="RHEL"
    fi

    if [ $(uname -s) = "Linux" ]; then
            PATH=$PATH:/opt/puppet/bin:/sbin:/usr/sbin/:/usr/local/um/bin:$HOME/bin
    fi

    # run .bashrc on RHEL
    if [ -f /etc/redhat-release ]; then
            source $HOME/.bashrc
        fi

    # print host information on logon
    if [ "$osna" = "Linux" ]; then
        getip=`host $ipna |awk '{print $4}'`
        echo "OS: $os_ver Kernel: $hostna IP: $getip Uptime: $ut"
    fi
fi
