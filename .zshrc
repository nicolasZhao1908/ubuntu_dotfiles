# bindkey -v
# History search
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

[[ -n "${key[Up]}"   ]] && bindkey -- "${key[Up]}"   up-line-or-beginning-search
[[ -n "${key[Down]}" ]] && bindkey -- "${key[Down]}" down-line-or-beginning-search

# Modifiers key
key[Control-Left]="${terminfo[kLFT5]}"
key[Control-Right]="${terminfo[kRIT5]}"

[[ -n "${key[Control-Left]}"  ]] && bindkey -- "${key[Control-Left]}"  backward-word
[[ -n "${key[Control-Right]}" ]] && bindkey -- "${key[Control-Right]}" forward-word


(( ${+aliases[run-help]} )) && unalias run-help
autoload -Uz run-help

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
ZDOTDIR=${ZDOTDIR:-${HOME}}
ZSHDDIR="${HOME}/.config/zsh.d"
HISTFILE="${ZDOTDIR}/.zsh_history"
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history


# zsh suggestions and highlighting (at the bottom of the file)
ZSH_AUTOSUGGEST_MANUAL_REBIND=""
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# Prompt
eval "$(starship init zsh)"

zstyle ':completion:*:sudo:*' command-path /usr/local/sbin \
                                           /usr/local/bin  \
                                           /usr/sbin       \
                                           /usr/bin        \
                                           /sbin           \
                                           /bin            \
                                           /usr/X11R6/bin

# arrow key completion
zstyle ':completion:*' menu select
# sudo completion
zstyle ':completion::complete:*' gain-privileges 1

zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
autoload -Uz compinit && compinit

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

if [ -f $HOME/.zsh_alias ]; then
  source $HOME/.zsh_alias
fi

eval "$(zoxide init zsh)"

if [ -f $HOME/.config/nnn/config.sh ]; then
  source $HOME/.config/nnn/config.sh
fi

# pnpm
export PNPM_HOME="/home/nicozhao1908/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
