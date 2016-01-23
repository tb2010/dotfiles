# ~/.bashrc: executed by bash for non-login shells
#


## HISTORY
export HISTCONTROL=ignoredups:erasedups  # no duplicate entries
export HISTSIZE=100000                   # big big history
export HISTFILESIZE=100000               # big big history
# Append to the Bash history file instead of overwriting.
shopt -s histappend

# Set for US English and use UTF-8
export LANG="en_US"
export LC_ALL="en_US.UTF-8"

if [ -r /usr/local/etc/bash_completion ]; then
    . /usr/local/etc/bash_completion
fi

# Add tab completion for SSH hostnames in ~/.ssh/config.
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2)" scp sftp ssh


# Add tab completion for 'defaults read|write NSGlobalDomain'
complete -W "NSGlobalDomain" defaults


# no ._ files in archives please
export COPYFILE_DISABLE=true

export NODE_PATH=/usr/local/lib/node_modules:$NODE_PATH

export TZ='America/New_York'


# Make less NOT clear screen
export LESS="${LESS} XF"
# Don’t clear the screen after quitting a manual page
export MANPAGER="less -X"
# Highlight section titles in manual pages
export LESS_TERMCAP_md="$ORANGE"


# Include alias definitions
if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

# SET PROMPT
function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "*"
}
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/($(parse_git_dirty)\1)/"
}
export PS1='\u@mbpr[$(basename "${PWD}")]$(parse_git_branch)\$ '

# Add composer vendor path
export PATH=$PATH:~/.composer/vendor/bin

# Add PLENV configurations
if which plenv > /dev/null; then eval "$(plenv init -)"; fi

# Add Yii Environment variables
export YII_DEBUG=true
export YII_ENV=dev

