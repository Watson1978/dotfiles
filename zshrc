# aliases
[[ -f ~/.aliases ]] && source ~/.aliases

# PATH
export PATH="$HOME/bin:$HOME/.rbenv/bin:$HOME/.rbenv/shims:$PATH"
export PATH="$HOME/.nodenv/bin:$HOME/.nodenv/shims:$PATH"

# export PKG_CONFIG_PATH="$HOME/imagemagick6/lib/pkgconfig:$PKG_CONFIG_PATH"
export PKG_CONFIG_PATH="$HOME/imagemagick7/lib/pkgconfig:$PKG_CONFIG_PATH"

# Ruby
# export RUBY_CONFIGURE_OPTS=--with-jemalloc

# Cuda
export CUDA_PATH="/opt/cuda/"
export CPATH="$CUDA_PATH/include:$CPATH"
export LD_LIBRARY_PATH="$CUDA_PATH/lib64:$CUDA_PATH/lib:$LD_LIBRARY_PATH"
export PATH="$CUDA_PATH/bin:$PATH"
export LIBRARY_PATH="$CUDA_PATH/lib64:$CUDA_PATH/lib:$LIBRARY_PATH"

export CUDNN_ROOT_DIR=/usr
export CPATH=$CUDNN_ROOT_DIR/include:$CPATH
export LD_LIBRARY_PATH=$CUDNN_ROOT_DIR/lib64:$LD_LIBRARY_PATH
export LIBRARY_PATH=$CUDNN_ROOT_DIR/lib64:$LIBRARY_PATH

# XXenv
eval "$(rbenv init -)"
eval "$(nodenv init -)"

export DOCKER_HOST="unix:///var/run/docker.sock"

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

plugins=(git rbenv zsh-autosuggestions copypath)
source $ZSH/oh-my-zsh.sh

zstyle ':completion:*' menu select
zstyle ':completion:*:cd:*' ignore-parents parent pwd
zstyle ':completion:*:descriptions' format '%BCompleting%b %U%d%u'

typeset -ga chpwd_functions

# gemコマンドの補完を、標準のファイル・ディレクトリ補完で上書きする
compdef _files gem

export BAT_THEME=Dracula

# fzf
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

# Use fd (https://github.com/sharkdp/fd) for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
    fd --hidden --exclude .git . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
    fd --type=d --hidden --exclude .git . "$1"
}

# Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments to fzf.
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
    export|unset) fzf --preview "eval 'echo ${}'"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview "$show_file_or_dir_preview" "$@" ;;
  esac
}

fg="#CBE0F0"
bg="#011628"
bg_highlight="#143652"
purple="#B388FF"
blue="#06BCE4"
cyan="#2CF9ED"

show_file_or_dir_preview="if [ -d {} ]; then eza --tree --color=always {} | head -200; else bat -n --color=always --line-range :500 {}; fi"

export FZF_DEFAULT_OPTS="--color=fg:${fg},bg:${bg},hl:${purple},fg+:${fg},bg+:${bg_highlight},hl+:${purple},info:${blue},prompt:${cyan},pointer:${cyan},marker:${cyan},spinner:${cyan},header:${cyan}"
export FZF_CTRL_T_OPTS="--preview '$show_file_or_dir_preview'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

# Zoxide
eval "$(zoxide init zsh)"
