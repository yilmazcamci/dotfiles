export XDG_CONFIG_HOME="$HOME/.config"
export HOMEBREW_GITHUB_API_TOKEN="f524ee63fcee2a137246c81909a1be02aae2f703"
export NVM_DIR="$HOME/.nvm"
export NVM_LAZY_LOAD=true
export ZGEN_PREZTO_LOAD_DEFAULT=0
export EDITOR=nvim

if command -v hub &>/dev/null; then
  # Extend git with hub
  eval "$(hub alias -s)"
fi

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
[ -s "$BASE16_SHELL/profile_helper.sh" ] && \
eval "$("$BASE16_SHELL/profile_helper.sh")"

# load zgen
source "${HOME}/.zgen/zgen.zsh"

# if the init scipt doesn't exist
if ! zgen saved; then

  # Auto update every seven days
  zgen load unixorn/autoupdate-zgen

  # Oh My Zsh
  # zgen oh-my-zsh
  # zgen oh-my-zsh plugins/git
  # zgen oh-my-zsh plugins/github
  # zgen load mafredri/zsh-async
  # zgen load sindresorhus/pure

  # Prezto
  zgen prezto gnu-utility prefix 'g'
  zgen prezto utility safe-ops 'no'
  zgen prezto prompt theme 'pure'
  zgen prezto '*' color 'yes'

  zgen prezto
  zgen prezto environment
  zgen prezto terminal
  zgen prezto editor
  zgen prezto history
  zgen prezto directory
  zgen prezto spectrum
  zgen prezto gnu-utility
  zgen prezto utility
  zgen prezto completion
  zgen prezto prompt
  zgen prezto git

  zgen load zsh-users/zsh-completions src

  # Load nvm manager plugin
  zgen load lukechilds/zsh-nvm

  # Safe rm
  # zgen load MikeDacre/careful_rm

  # Neat ls alternative
  # zgen load supercrabtree/k

  # As you type auto suggestions
  zgen load zsh-users/zsh-autosuggestions

  # Syntax highlighting
  zgen load zsh-users/zsh-syntax-highlighting

  # History substring search (needs syntax highlighting)
  zgen load zsh-users/zsh-history-substring-search

  # Alias tips
  zgen load djui/alias-tips

  # generate the init script from plugins above
  zgen save
fi

# Safe rm
alias rm="$(command -v ~/.zgen/MikeDacre/careful_rm-master/careful_rm.py)"

source ~/.nix-profile/etc/profile.d/nix.sh

bindkey '\eOA' history-substring-search-up # or ^[OA
bindkey '\eOB' history-substring-search-down # or ^[OB

# Correction if completion is not possible
zstyle ':completion:*' completer _complete _approximate

# aliases
source ~/.alias
