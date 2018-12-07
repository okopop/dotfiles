# runs once at login time, for every new shell .bashrc is executed.
if tty -s; then
  echo "running .bash_profile"

  if [ $(uname -s) = "Linux" ]; then
    PATH=$PATH:/opt/puppet/bin:/sbin:/usr/sbin/:/usr/local/um/bin:$HOME/bin
  fi

  if [ -f ~/.bashrc ]; then
   source ~/.bashrc
  fi
fi
