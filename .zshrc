# zmodload zsh/zprof

# Download Znap, if it's not there yet.
[[ -r ~/.config/zsh/plugins/znap/znap.zsh ]] ||
    git clone --depth 1 -- \
        https://github.com/marlonrichert/zsh-snap.git ~/.config/zsh/plugins/znap
source ~/.config/zsh/plugins/znap/znap.zsh  # Start Znap

# Set up your shell to use Starship
znap eval starship 'starship init zsh --print-full-init'
prompt_starship_precmd
znap prompt

# Install and update plugins
znap source marlonrichert/zsh-autocomplete
znap source zsh-users/zsh-autosuggestions
bindkey '^ ' autosuggest-accept # Ctrl + Space to accept suggestion

load_nvm() {
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
}
znap function nvm npm load_nvm

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

# STARSHIP

# Custom aliases
alias zshc="cd ~/.config/zsh"
alias nvimc="cd ~/.config/nvim"
alias tmuxc="cd ~/.config/tmux"

source ~/.profile

# zprof
