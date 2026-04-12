export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="dallas"
ZSH_THEME="amuse"
CASE_SENSITIVE="true"
zstyle ':omz:update' mode reminder  # just remind me to update when it's time
DISABLE_AUTO_TITLE="true"
plugins=(git brew)
source $ZSH/oh-my-zsh.sh
source ~/.aliases
export GOPATH=/Users/ancollin/go
export PATH=$PATH:/usr/local/go/bin:/opt/apache-maven-3.9.9/bin

setopt noautopushd

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
# end SDKMAN

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/ancollin/.google-cloud-sdk/path.zsh.inc' ]; then . '/Users/ancollin/.google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/ancollin/.google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/ancollin/.google-cloud-sdk/completion.zsh.inc'; fi

# AC : 'fg -' works differently sometimes
fg() {
	if [[ $# -eq 1 && $1 = - ]]; then
		builtin fg %-
	else
		builtin fg "$@"
	fi
}

# Bash-like navigation works now. Was broken by a zsh plugin
autoload -U select-word-style
select-word-style bash
bindkey "^U" backward-kill-line
bindkey "^[>" end-of-history
bindkey "^N" down-history
bindkey "^P" up-history

# Create Andrew's favored bash difference between word and kill boundaries <3
# 1. Load the "smart" version of backward-kill-word
autoload -U kill-word-match
# 2. Create a new widget name mapped to that function
zle -N kill-blank-word kill-word-match
# 3. Tell JUST this new widget to use spaces as the only delimiter
zstyle ':zle:kill-blank-word' word-style space
# 4. Bind it to your key
bindkey '^[d' kill-blank-word

# repeated again but for backward
autoload -U backward-kill-word-match
zle -N backward-kill-blank-word backward-kill-word-match
zstyle ':zle:backward-kill-blank-word' word-style space
bindkey '^W' backward-kill-blank-word

# Keep the 'fine-grained' version on Alt+Backspace and Alt+Delete
bindkey '^[^?' backward-kill-word
bindkey '^[('  kill-word

# gh CLI customization for light terminal
export GLAMOUR_STYLE=light
