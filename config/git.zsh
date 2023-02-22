export GIT_TERMINAL_PROMPT=1

# 可配置以下环境变量控制git log颜色
hashColor=${gitHashColor:-"magenta"}
contentColor=${gitContentColor:-"cyan"}
dateColor=${gitDateColor:-"yellow"}
authorColor=${gitAuthorColor:-"blue"}

alias gp='git push'
alias gco='git checkout'
alias gpo='git push origin $(git symbolic-ref --short -q HEAD)'
alias gpl='git pull origin $(git symbolic-ref --short -q HEAD) --ff-only'
alias gd='git --no-pager diff'
alias gs='git --no-pager status'
alias gss='git --no-pager status -s'
alias gpt='git push origin --tags'
alias glt='git tag -n --sort=taggerdate | tail -n ${1-10}'
alias grclean="echo '清空工作区'&& git reset --hard HEAD && git clean -fd"
gat() { git tag -a $1 -m "$2" }
#gam() { git add --all && git commit -m "$*" }
gap() { git add --all && git commit -m "$*" && git push }
gitlog() {
    git --no-pager log --date=format:'%Y-%m-%d %H:%M'  --pretty=format:$1 --graph -n ${2-10} \
}
gll() { gitlog "%C(${hashColor})%h %C(${contentColor})%s%Creset" $1 }
glll() { gitlog "%C(${hashColor})%h %C(${dateColor})%cd %C(${authorColor})%cn: %C(${contentColor})%s%Creset" $1 }
