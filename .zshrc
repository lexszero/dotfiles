source /etc/zsh/zshrc_common

autoload -U add-zsh-hook

function git_status {
	gitroot=`git rev-parse --show-toplevel 2>/dev/null`
	if [[ "$?" != "0" || "${gitroot}" == "$HOME" ]]; then
		return
	else
		git_super_status
	fi
}

git-prompt-disable() {
	for h in chpwd preexec precmd; do
		add-zsh-hook -D $h ${h}_update_git_vars
	done
	PS_VCS_INFO=''
}
git-prompt-enable() {
	source /home/lexs/.zsh/git-prompt/zshrc.sh
	ZSH_THEME_GIT_PROMPT_PREFIX="%B%F{yellow}["
	ZSH_THEME_GIT_PROMPT_SUFFIX="%B%F{yellow}]"
	PS_VCS_INFO='git_status'
}
git-prompt-enable

PS_MAIN="%B$PS_USERHOST $PS_PATH \$(\${PS_VCS_INFO})%B%F{default}>%b "

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

_project_source_init() {
	[ -e ./${_proj_init} ] && {
		echo "Sourcing ${_proj_init} from \${_proj_root}${PWD##${_proj_root}}"
			. ./${_proj_init}
	}
}

init_project() {
	projname="${1%%/}"
	proj="${_proj_root}/${projname}"
	cd "${proj}" || {
		echo "No such project"
		return 1
	}
	hash -d Δ=${proj}
	PS_MAIN="%B${projname##*/} \$(_project_pwd) \$(\${PS_VCS_INFO})%B%F{default}>%b "
	{
		cd ${_proj_root}
		while [[ "${PWD}" != "${proj}" ]]; do
			_project_source_init
			cd ${${${proj##${PWD}}#/}%%/*}
		done
		_project_source_init
	}
}

prcd() {
	cd "${proj}/$1"
}

# Go stuff
export GOPATH=~/.go
export GOARCH=amd64
export CGO_CFLAGS=-ftrack-macro-expansion=0
PATH=$GOPATH/bin:$GOROOT/bin:$PATH
