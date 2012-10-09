#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

function parse_git_branch_and_add_brackets {
	[ "$PWD" == ~ ] || git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
PS1='\[\033[01;32m\]\u@\h\[\033[01;34m\] \w\033[0;33m$(parse_git_branch_and_add_brackets) \033[01;34m\$\[\033[00m\] '

PATH=~/bin:$PATH

alias calc="bc -l"
