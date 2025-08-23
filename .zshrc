# zmodload zsh/zprof

# Download Znap, if it's not there yet.
[[ -r ~/.config/zsh/plugins/znap/znap.zsh ]] ||
    git clone --depth 1 -- \
        https://github.com/marlonrichert/zsh-snap.git ~/.config/zsh/plugins/znap
source ~/.config/zsh/plugins/znap/znap.zsh  # Start Znap

# Set up your shell to use Starship
export STARSHIP_CONFIG=~/.config/zsh/starship.toml
eval "$(starship init zsh)"

# Install and update plugins
znap source zsh-users/zsh-autosuggestions
bindkey '^ ' autosuggest-accept # Ctrl + Space to accept suggestion

znap source marlonrichert/zsh-autocomplete
zstyle ':completion:*' completer _complete _complete:-fuzzy _correct _approximate _ignored
zstyle ':autocomplete:tab:*' fzf-completion yes

load_nvm() {
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
}
znap function nvm npm node npx nvim pm2 load_nvm air

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

source ~/.profile

# zprof
