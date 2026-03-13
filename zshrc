pupdate() { case ":${PATH:=$1}:" in *:$1:*) ;; *) PATH="$1:$PATH" ;; esac; }

eval "$(/opt/homebrew/bin/brew shellenv)"

source "$HOME/.cargo/env"

export GOPATH="$HOME/go"
export VOLTA_HOME="$HOME/.volta"
export PNPM_HOME="$HOME/Library/pnpm"

pupdate "$VOLTA_HOME/bin"
pupdate "$HOME/.cargo/bin"
pupdate "$HOME/.local/bin"
pupdate "$HOME/bin"
pupdate "$GOPATH/bin"
pupdate "$PNPM_HOME"
pupdate "$HOME/.dotnet/tools"

source $HOMEBREW_PREFIX/share/antigen/antigen.zsh

# Generic ZSH bundles
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions

# Stuff from oh-my-zsh
antigen use oh-my-zsh
antigen bundle aws
antigen bundle command-not-found
antigen bundle git
antigen bundle jenv
antigen bundle ssh-agent
antigen bundle zoxide

[[ -f ~/.aliases ]] && source ~/.aliases
[[ -f ~/.functions ]] && source ~/.functions
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local

antigen apply

eval "$(starship init zsh)"

eval "$(mise activate zsh)"
source "$HOME/.sdkman/bin/sdkman-init.sh"

eval "$(pkgx --quiet dev --shellcode)"  # https://github.com/pkgxdev/dev
