# Download Znap, if it's not there yet.
[[ -r ~/.config/zsh/plugins/znap/znap.zsh ]] ||
    git clone --depth 1 -- \
        https://github.com/marlonrichert/zsh-snap.git ~/.config/zsh/plugins/znap
source ~/.config/zsh/plugins/znap/znap.zsh  # Start Znap

# Install and update plugins
# https://github.com/marlonrichert/zsh-autocomplete
znap source marlonrichert/zsh-autocomplete
# https://github.com/zsh-users/zsh-autosuggestions
znap source zsh-users/zsh-autosuggestions
bindkey '^ ' autosuggest-accept # Ctrl + Space to accept suggestion

# https://github.com/lukechilds/zsh-nvm
znap source lukechilds/zsh-nvm

# History file configuration
[ -z "$HISTFILE" ] && HISTFILE="$HOME/.zsh_history"
HISTSIZE=1000
SAVEHIST=100000

# History command configuration
setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
setopt inc_append_history     # add commands to HISTFILE in order of execution

# STARSHIP
# Set up your shell to use Starship
eval "$(starship init zsh)"

# Custom aliases
alias zshc="cd ~/.config/zsh"
alias nvimc="cd ~/.config/nvim"

source ~/.profile
