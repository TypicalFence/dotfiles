export LC_ALL=en_US.UTF8
export PATH=$PATH:~/.bin/
export PATH=$PATH:~/.local/bin/
export PATH=$PATH:~/.cargo/bin/
export PATH=$PATH:$GOPATH/bin

export JAVA_HOME="$(dirname $(dirname $(realpath $(which javac))))"

alias vim=nvim
alias vi=vim
alias please=sudo
. ~/.profile.local
