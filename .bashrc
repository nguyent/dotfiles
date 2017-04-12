# .bashrc

# User specific aliases and functions
if [ "$PS1" ]; then

    source ~/.git-prompt.sh    # fancy prompt
    source ~/.git-completion.bash
    BLACK=$(tput setaf 0)
    RED=$(tput setaf 1)
    GREEN=$(tput setaf 2)
    LIME_YELLOW=$(tput setaf 190)
    YELLOW=$(tput setaf 3)
    POWDER_BLUE=$(tput setaf 153)
    BLUE=$(tput setaf 4)
    MAGENTA=$(tput setaf 5)
    CYAN=$(tput setaf 6)
    WHITE=$(tput setaf 7)
    BRIGHT=$(tput bold)
    NORMAL=$(tput sgr0)
    BLINK=$(tput blink)
    REVERSE=$(tput smso)
    UNDERLINE=$(tput smul)

    PS1='⎲  \[${WHITE}\][\t] \[${RED}\]\u\[${BLUE}\]@\[${YELLOW}\]\h\[${BLUE}\]:\[${NORMAL}\]\w \[${CYAN}\]$(__git_ps1)\n${WHITE}\342\216\263  \[${NORMAL}\]$ '
fi

export GREP_OPTIONS='--color=auto'
alias gcd='cd `git rev-parse --show-toplevel`'
alias gg='git grep'
alias grh='git reset --hard HEAD'
alias psrv='python3 -m http.server'
alias ppjson='python -m json.tool'

alias src='. ~/.bashrc'

source '~/.docker-completion.sh' # via https://github.com/docker/docker/blob/master/contrib/completion/bash/docker

if [ -f $(brew --prefix)/etc/bash_completion ]; then # via brew
   . $(brew --prefix)/etc/bash_completion
fi

# OS X colored output for ls
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
alias ls='ls -G'

# Git root grep
grg()
{
    gcd
    gg "$1"
    cd - > /dev/null 2>&1
}
