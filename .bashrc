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

    PS1='\342\216\262  \[${WHITE}\][\t] \[${RED}\]\u\[${BLUE}\]@\[${YELLOW}\]\h\[${BLUE}\]:\[${NORMAL}\]\w \[${CYAN}\]$(__git_ps1)\n${WHITE}\342\216\263  \[${NORMAL}\]$ '
fi

export GREP_OPTIONS='--color=auto'
alias trim="sed 's/^ *//g'"
alias gcd='cd `git rev-parse --show-toplevel`'
alias gg='git grep'
alias grh='git reset --hard HEAD'
alias psrv='python3 -m http.server'
alias ppjson='python -m json.tool'
alias src='. ~/.bashrc'
alias grb='git rebase -i HEAD~2'
alias cdf='cd $(ls -d */ | fzf)'

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
    gg "$@"
    cd - > /dev/null 2>&1
}

# copy the output of a command into the clipboard 
# for example: clip !!
clip()
{
    echo "$@" | pbcopy
}

envconda()
{
    SELECTED_ENV=$(conda info --envs | grep -v '#' | awk '{print $1}' | grep . | fzf)
    conda activate $SELECTED_ENV
}

# fkill - kill process
fkill() {
  local pid
  pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')

  if [ "x$pid" != "x" ]
  then
    echo $pid | xargs kill -${1:-9}
  fi
}

export HISTCONTROL=ignoredups

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

