# load .profile if not loaded yet
if [ -z "${DEPLOY_ENV}" ]; then
    . ~/.zprofile
fi

# Oh My!
export ZSH=/home/fence/.oh-my-zsh
ZSH_THEME="pink-fish"
ZSH_CUSTOM=~/.zsh_custom
plugins=(git dirpersist)
source $ZSH/oh-my-zsh.sh

# fuzzy cd
cdfz() {
    dir=$(find -type d | fzf)

    if [ ! -z "$dir" ]; then
        cd "$dir"
    fi
}

alias cdd=cdfz
alias ccd=cdfz

# SCREAMS IN JAVA
bzl-set-classpath() {
    export CLASSPATH=$(find bazel-bin/tests.runfiles/ -name "*.jar" | xargs -L1 realpath  |  python3 -c 'import sys; print(":".join(sys.stdin.read().splitlines()))')
}

# gcc stuff, for getting ALE to work nicely
DEFAULT_GCC=gcc
DEFAULT_GXX=g++
DEFAULT_GCC_OPTS="-std=gnu99 -Os -Wall"
DEFAULT_GXX_OPTS="-std=c++11 -Os -Wall"

AVR_GCC=avr-$DEFAULT_GCC
AVR_GXX=avr-$DEFAULT_GXX
AVR_GCC_OPTS="$DEFAULT_GCC_OPTS -ffunction-sections -fdata-sections -mmcu=atmega328p -DF_CPU=16000000"
AVR_GXX_OPTS="$DEFAULT_GXX_OPTS -ffunction-sections -fdata-sections -mmcu=atmega328p -DF_CPU=16000000"

export CURRENT_GCC=$DEFAULT_GCC
export CURRENT_GXX=$DEFAULT_GXX
export CURRENT_GCC_OPTS=$DEFAULT_GCC_OPTS
export CURRENT_GXX_OPTS=$DEFAULT_GXX_OPTS

gccenv() {
    echo GCC: $CURRENT_GCC
    echo G++: $CURRENT_GXX
    echo GCC OPTS: $CURRENT_GCC_OPTS
    echo G++ OPTS: $CURRENT_GXX_OPTS
}

gccenv-avr() {
    export CURRENT_GCC=$AVR_GCC
    export CURRENT_GXX=$AVR_GXX
    export CURRENT_GCC_OPTS=$AVR_GCC_OPTS
    export CURRENT_GXX_OPTS=$AVR_GXX_OPTS
}

gccenv-default() {
    export CURRENT_GCC=$DEFAULT_GCC
    export CURRENT_GXX=$DEFAULT_GXX
    export CURRENT_GCC_OPTS=$DEFAULT_GCC_OPTS
    export CURRENT_GXX_OPTS=$DEFAULT_GXX_OPTS
}

make-getvar() {
make -f - ${1}.var <<EOF
include $PWD/Makefile

$1.var:
	@echo \$($1)
EOF
}

gccenv-make() {
    CC=$(make-getvar CC)
    CXX=$(make-getvar CXX)
    CFLAGS=$(make-getvar CFLAGS)
    CXXFLAGS=$(make-getvar CXXFLAGS)
    INCLUDE_PATHS=$(make-getvar INCLUDE_PATHS)
    
    if [ ! -z "$CC" ]; then
        export CURRENT_GCC=$CC
    fi

    if [ ! -z "$CXX" ]; then
        export CURRENT_GXX=$CXX
    fi

    if [ ! -z "$CFLAGS" ]; then
        export CURRENT_GCC_OPTS=$CFLAGS
    fi

    if [ ! -z "$CXXFLAGS" ]; then
        export CURRENT_GXX_OPTS=$CXXFLAGS
    fi

    if [ ! -z "$INCLUDE_PATHS" ]; then
        export CURRENT_GCC_OPTS="$CURRENT_GCC_OPTS $INCLUDE_PATHS"
        export CURRENT_GXX_OPTS="$CURRENT_GXX_OPTS $INCLUDE_PATHS"
    fi
}
