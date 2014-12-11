source ~/.zshrc_common

source /home/lexs/.zsh/git-prompt/zshrc.sh
function git_status {
	[ "$PWD" == "$HOME" ] && return
	git_super_status
}

PATH=~/bin:/usr/sbin:/usr/local/sbin:$PATH

# CodeSourcery toolchain
PATH=/opt/sgpp-lite-arm-eabi-bin-2010.09.51/bin:$PATH

# Go stuff
export GOROOT=/mnt/oldroot/tmp/go/go
export GOPATH=~/.go
export GOARCH=amd64
PATH=$GOPATH/bin:$GOROOT/bin:$PATH
