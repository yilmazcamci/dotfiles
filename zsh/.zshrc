export XDG_CONFIG_HOME=/Users/alextes/.config
export PATH="$PATH:$HOME/.nvm/versions/node/v9.3.0/bin/:$HOME/scripts"
export PATH="/usr/local/bin/:$PATH"
export HOMEBREW_GITHUB_API_TOKEN="f524ee63fcee2a137246c81909a1be02aae2f703" 
export NVM_DIR="$HOME/.nvm"
export NVM_LAZY_LOAD=true

# aliases
source ~/.alias

if command -v hub &>/dev/null; then
  # Extend git with hub
  eval "$(hub alias -s)"
fi

# get that base16 color goodness
BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

# load zgen
source "${HOME}/.zgen/zgen.zsh"

# if the init scipt doesn't exist
if ! zgen saved; then

  # specify plugins here
  zgen oh-my-zsh
  zgen oh-my-zsh plugins/git

  # Auto update every seven days
  zgen load unixorn/autoupdate-zgen

  zgen load zsh-users/zsh-completions

  # Open your current repo & branch on github.
  zgen load peterhurford/git-it-on.zsh

  # colorize things
  # zgen oh-my-zsh plugins/colored-man-pages
  zgen load unixorn/warhol.plugin.zsh

  # Load nvm manager plugin
  zgen load lukechilds/zsh-nvm

  # syntax highlight needs to come before history-substring-search
  zgen load zsh-users/zsh-syntax-highlighting
  zgen load zsh-users/zsh-history-substring-search

  # pure prompt
  zgen load mafredri/zsh-async
  zgen load sindresorhus/pure

  # Bullet train prompt
  # zgen load caiogondim/bullet-train-oh-my-zsh-theme bullet-train

  # generate the init script from plugins above
  zgen save
fi

bindkey '\eOA' history-substring-search-up # or ^[OA
bindkey '\eOB' history-substring-search-down # or ^[OB

#
# Bullet train
#
# configure bullettrain
# BULLETTRAIN_PROMPT_ORDER=(
  # dir
  # git
  # virtualenv
  # status
# )

# custom commands
flow-watch() {
  clear;
  flow status;
  fswatch -e "/\." -o . | xargs -n1 -I{} flow status;
}

# Correction if completion is not possible
zstyle ':completion:*' completer _complete _approximate

# Load ssh keys
ssh-add -A 2>/dev/null
