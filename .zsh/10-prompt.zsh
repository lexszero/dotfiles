GIT_PROMPT_USE_PYTHON="haskell"
ZSH_THEME_GIT_PROMPT_CACHE=1

autoload -U add-zsh-hook

function git_status {
	gitroot=`git rev-parse --show-toplevel 2>/dev/null`
	if [[ "$?" != "0" || \
		"$PWD" =~ "^/mnt" || \
		"${gitroot}" == "$HOME" || \
		"${gitroot}" == "/usr/portage" \
	]]; then
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
