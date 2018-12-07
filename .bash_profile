# ~/.bash_profile is executed for login shells
if tty -s; then
  echo "running .bash_profile"
  [ -f ${HOME}/.bashrc ] && . ${HOME}/.bashrc
fi

#For Bash, they work as follows. Read down the appropriate column. 
#Executes A, then B, then C, etc. The B1, B2, B3 means it executes only the first of those files found.
#+----------------+-----------+-----------+------+
#|                |Interactive|Interactive|Script|
#|                |login      |non-login  |      |
#+----------------+-----------+-----------+------+
#|/etc/profile    |   A       |           |      |
#+----------------+-----------+-----------+------+
#|/etc/bash.bashrc|           |    A      |      |
#+----------------+-----------+-----------+------+
#|~/.bashrc       |           |    B      |      |
#+----------------+-----------+-----------+------+
#|~/.bash_profile |   B1      |           |      |
#+----------------+-----------+-----------+------+
#|~/.bash_login   |   B2      |           |      |
#+----------------+-----------+-----------+------+
#|~/.profile      |   B3      |           |      |
#+----------------+-----------+-----------+------+
#|BASH_ENV        |           |           |  A   |
#+----------------+-----------+-----------+------+
#|                |           |           |      |
#+----------------+-----------+-----------+------+
#|                |           |           |      |
#+----------------+-----------+-----------+------+
#|~/.bash_logout  |    C      |           |      |
#+----------------+-----------+-----------+------+
