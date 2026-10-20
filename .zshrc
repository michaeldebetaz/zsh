# Load environment variables first
[[ -f ~/.profile ]] && source ~/.profile

# where do you want to store your plugins?
ZPLUGINDIR=${ZPLUGINDIR:-${ZDOTDIR:-$HOME/.config/zsh}/plugins}

# get zsh_unplugged and store it with your other plugins
if [[ ! -d $ZPLUGINDIR/zsh_unplugged ]]; then
  git clone --quiet https://github.com/mattmc3/zsh_unplugged $ZPLUGINDIR/zsh_unplugged
fi
source $ZPLUGINDIR/zsh_unplugged/zsh_unplugged.zsh

# make a github repo plugins list
plugins=(
  "sindresorhus/pure"
  "zsh-users/zsh-autosuggestions"
  "zsh-users/zsh-history-substring-search"
  "mattmc3/ez-compinit"

  # load these at hypersonic load speeds with zsh-defer
  "romkatv/zsh-defer"
  "zdharma-continuum/fast-syntax-highlighting"
)
plugin-load $plugins

# History file configuration
[ -z "$HISTFILE" ] && HISTFILE="$HOME/.zsh_history"
HISTSIZE=1000
SAVEHIST=10000

# History command configuration
setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
setopt inc_append_history     # add commands to HISTFILE in order of execution

# Key bindings

# peterhurford/up.zsh
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# zsh-users/zsh-autosuggestions
bindkey '^ ' autosuggest-accept # Ctrl + Space to accept suggestion

# ctrl+arrows
bindkey "\e[1;5C" forward-word
bindkey "\e[1;5D" backward-word
# ctrl+delete
bindkey "\e[3;5~" kill-word
# ctrl+backspace
bindkey '^H' backward-kill-word
# ctrl+shift+delete
bindkey "\e[3;6~" kill-line

# Custom aliases
alias zshc="cd ~/.config/zsh"
alias nvimc="cd ~/.config/nvim"
alias tmuxc="cd ~/.config/tmux"
alias ls="ls --color=auto"

# zprof
