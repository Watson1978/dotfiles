# aliases
[[ -f ~/.aliases ]] && source ~/.aliases

# PATH
export PREFIX="/opt/homebrew";
export HOMEBREW_PREFIX="/opt/homebrew";
export HOMEBREW_CELLAR="/opt/homebrew/Cellar";
export HOMEBREW_REPOSITORY="/opt/homebrew";
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin${PATH+:$PATH}";
export MANPATH="/opt/homebrew/share/man${MANPATH+:$MANPATH}:";
export INFOPATH="/opt/homebrew/share/info:${INFOPATH:-}";
export PATH="$HOME/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH"
export PATH="$HOME/.rbenv/bin:$HOME/.rbenv/shims:$PATH"
export PATH="$HOME/.nodenv/bin:$HOME/.rbenv/shims:$PATH"
# export CFLAGS="-L/opt/homebrew/lib"
# export CPPFLAGS="-L/opt/homebrew/lib"

# export PKG_CONFIG_PATH="$HOME/imagemagick6.9/lib/pkgconfig:$PKG_CONFIG_PATH"
# export PKG_CONFIG_PATH="$HOME/imagemagick7.0/lib/pkgconfig:$PKG_CONFIG_PATH"
export PKG_CONFIG_PATH="$HOME/imagemagick7.1/lib/pkgconfig:$PKG_CONFIG_PATH"

# XXenv
eval "$(rbenv init -)"
eval "$(nodenv init -)"
eval "$(direnv hook zsh)"

# 右プロンプトを自動的に消す
setopt transient_rprompt

# man をカラフルに表示
man() {
    env \        LESS_TERMCAP_mb=$(printf "\e[1;31m") \
        LESS_TERMCAP_md=$(printf "\e[1;31m") \
        LESS_TERMCAP_me=$(printf "\e[0m") \
        LESS_TERMCAP_se=$(printf "\e[0m") \
        LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
        LESS_TERMCAP_ue=$(printf "\e[0m") \
        LESS_TERMCAP_us=$(printf "\e[1;32m") \
        man "$@"}

# oh-my-zsh の設定
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="eastwood"

LANG=ja_JP.UTF-8
LC_CTYPE="ja_JP.UTF-8"

plugins=(git macos brew rbenv docker adb ripgrep)
source $ZSH/oh-my-zsh.sh

autoload -Uz compinit && compinit -u

zstyle ':completion:*' menu select
zstyle ':completion:*:cd:*' ignore-parents parent pwd
zstyle ':completion:*:descriptions' format '%BCompleting%b %U%d%u'

typeset -ga chpwd_functions

autoload -U chpwd_recent_dirs cdr
chpwd_functions+=chpwd_recent_dirs
zstyle ":chpwd:*" recent-dirs-max 500
zstyle ":chpwd:*" recent-dirs-default true
zstyle ":completion:*" recent-dirs-insert always
fpath=($HOME/.zsh/anyframe(N-/) $fpath)
autoload -Uz anyframe-init
anyframe-init

bindkey '^t' anyframe-widget-cdr
bindkey '^xb' anyframe-widget-cdr
bindkey '^x^b' anyframe-widget-checkout-git-branch

bindkey '^xr' anyframe-widget-execute-history
bindkey '^x^r' anyframe-widget-execute-history

bindkey '^xp' anyframe-widget-put-history
bindkey '^x^p' anyframe-widget-put-history
bindkey '^r' anyframe-widget-put-history

bindkey '^xk' anyframe-widget-kill
bindkey '^x^k' anyframe-widget-kill

bindkey '^xi' anyframe-widget-insert-git-branch
bindkey '^x^i' anyframe-widget-insert-git-branch

bindkey '^xf' anyframe-widget-insert-filename
bindkey '^x^f' anyframe-widget-insert-filename

function peco-open-gem() {
    local gem_name=$(bundle list | sed -e 's/^ *\* *//g' | peco | cut -d \  -f 1)
    if [ -n "$gem_name" ]; then
        local gem_dir=$(bundle show ${gem_name})
        code ${gem_dir}
    fi
}

function peco-rake() {
    local task=$(rake -T | peco | cut -d " " -f 2);
    if [ -n "$task" ]; then
        rake $task
    fi
}

function cg() {
    cd $(ghq list -p | sort | peco)
}
