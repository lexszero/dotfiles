source /etc/zsh/zshrc_common

source /home/lexs/.zsh/git-prompt/zshrc.sh
function git_status {
	gitroot=`git rev-parse --show-toplevel 2>/dev/null`
	if [[ "$?" != "0" || "${gitroot}" == "$HOME" ]]; then
		return
	else
		git_super_status
	fi
}
PS_MAIN="%B$PS_USERHOST $PS_PATH %F{yellow}\$(git_status)%F{default}>%b "

PATH=~/bin:/usr/sbin:/usr/local/sbin:$PATH

init_arm_env() {
	export ARCH=arm
	export CROSS_COMPILE=arm-none-linux-gnueabi-
}

_proj_root="$HOME/projects"
_proj_init=".init_env"

_project_pwd() {
	if [ "${PWD##${_proj_root}}" != "${PWD}" ]; then
		echo "%F{green}%3(c.…%2c.%c)"
	else
		echo "${PS_PATH}"
	fi
}

init_project() {
	proj="${_proj_root}/${1}"
	cd "${proj}" || {
		echo "No such project"
		return 1
	}
	hash -d Δ=${proj}
	PS_MAIN="%B${1} \$(_project_pwd) %F{yellow}\$(git_status)%F{default}>%b "
	{
		cd ${_proj_root}
		while [[ "${PWD}" != "${proj}" ]]; do
			cd ${${${proj##${PWD}}#/}%%/*}
			[ -e ./${_proj_init} ] && {
				echo "Sourcing ${PWD##${_proj_root}}/${_proj_init}"
				. ./${_proj_init}
			}
		done
	}
}

# Go stuff
export GOPATH=~/.go
export GOARCH=amd64
export CGO_CFLAGS=-ftrack-macro-expansion=0
PATH=$GOPATH/bin:$GOROOT/bin:$PATH
