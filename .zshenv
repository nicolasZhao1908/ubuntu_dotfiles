export PNPM_HOME="/home/nicozhao1908/.local/share/pnpm"
export XDG_CONFIG_HOME="/home/nicozhao1908/.config"
export NVM_DIR="$HOME/.config/nvm"
export PYENV_ROOT="$HOME/.pyenv"
export MYVIMRC=~/.config/nvim
export RUSTC_WRAPPER=$HOME/.cargo/bin/sccache
export _ZO_ECHO='1'
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

typeset -U path PATH
path=(
    /usr/local/texlive/2022/bin/x86_64-linux
    $HOME/.local/bin
    $HOME/.deta/bin
    $PNPM_HOME
    $XDG_CONFIG_HOME/rofi/scripts
    $PYENV_ROOT/bin
    $path
    $HOME/scripts
)
. "$HOME/.cargo/env"
. "$HOME/.ghcup/env"

export PATH
export FPATH=$FPATH:$HOME/.zsh/completions
export EDITOR=nvim
