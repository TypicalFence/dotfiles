export PROFILE_LOADED=yesyes
export LC_ALL=en_US.UTF8
export PATH=$PATH:~/.bin/
export PATH=$PATH:~/.local/bin/
export PATH=$PATH:~/.cargo/bin/
export PATH=$PATH:$GOPATH/bin

export EDITOR=nvim

export JAVA_HOME="$(dirname $(dirname $(realpath $(which javac))))"


alias vim=nvim
alias vi=vim
alias please=sudo
alias cd..="cd .."
alias wlan=wifi
alias e=bearbeite
alias bicc="du -h"
. ~/.profile.local
