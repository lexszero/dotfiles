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
	export proj="${_proj_root}/${projname}"
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

	precmd () {
		print -Pn "\e]0;[projects/${projname}] %~\a"
	}
}

prcd() {
	cd "${proj}/$1"
}
