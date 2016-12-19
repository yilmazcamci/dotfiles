#
# Executes commands at the start of an interactive session.
#

# see if this fixes locale locale warnings
export LC_ALL=en_US.UTF-8

# homebrew
export HOMEBREW_GITHUB_API_TOKEN="f524ee63fcee2a137246c81909a1be02aae2f703" 

# env vars we like
export TERM=xterm-256color
export XDG_CONFIG_HOME=/Users/alexander/.config

# lazy load nvm
export NVM_LAZY_LOAD=true

# load zgen
source "${HOME}/.zgen/zgen.zsh"

# if the init scipt doesn't exist
if ! zgen saved; then
    echo "Creating a zgen save"

    zgen oh-my-zsh

    # syntax highlight needs to come before history-substring-search
    zgen load zsh-users/zsh-syntax-highlighting
    zgen load zsh-users/zsh-history-substring-search

    # Auto update every seven days
    zgen load unixorn/autoupdate-zgen

    # Colorize the things if you have grc installed. Well, some of the
    # things, anyway.
    zgen load unixorn/warhol.plugin.zsh

    # Adds aliases to open your current repo & branch on github.
    zgen load peterhurford/git-it-on.zsh

    # Other plugins
    # zgen oh-my-zsh plugins/aws
    zgen oh-my-zsh plugins/colored-man-pages
    zgen oh-my-zsh plugins/git
    # zgen oh-my-zsh plugins/sudo

    # Load more completion files for zsh from the zsh-lovers github repo
    zgen load zsh-users/zsh-completions src

    # Load nvm manager plugin
    zgen load lukechilds/zsh-nvm

    # Docker completion
    # zgen load srijanshetty/docker-zsh

    # Add Fish-like autosuggestions to your ZSH
    # zgen load zsh-users/zsh-autosuggestions

    # Do things async
    # zgen load mafredri/zsh-async

    # theme
    # zgen oh-my-zsh themes/arrow
    # zgen load sindresorhus/pure

    # Bullet train prompt setup
    zgen load caiogondim/bullet-train-oh-my-zsh-theme bullet-train

    # save all to init script
    zgen save
fi

# configure bullettrain
BULLETTRAIN_TIME_SHOW=false

# keybindings for history-substring-search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# source npm bin
if [ -d node_modules ]; then
  export PATH=${PATH}:$(npm bin)
fi

export PATH=${PATH}:/Users/alexander/.nvm/versions/node/v7.2.1/bin

# load sorin's special git formatting before alias
zstyle -s ':prezto:module:git:log:medium' format '_git_log_medium_format' \
  || _git_log_medium_format='%C(bold)Commit:%C(reset) %C(green)%H%C(red)%d%n%C(bold)Author:%C(reset) %C(cyan)%an <%ae>%n%C(bold)Date:%C(reset)   %C(blue)%ai (%ar)%C(reset)%n%+B'
zstyle -s ':prezto:module:git:log:oneline' format '_git_log_oneline_format' \
  || _git_log_oneline_format='%C(green)%h%C(reset) %s%C(red)%d%C(reset)%n'
zstyle -s ':prezto:module:git:log:brief' format '_git_log_brief_format' \
  || _git_log_brief_format='%C(green)%h%C(reset) %s%n%C(blue)(%ar by %an)%C(red)%d%C(reset)%n'

# aliases
source ~/.alias

# source scripts
export PATH="$PATH:$HOME/script"

# source rust binaries
export PATH="$PATH:/Users/alexander/.cargo/bin"

# auto change node version
export NVM_DIR="$HOME/.nvm"
autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" != "N/A" ] && [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm install
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}

# because we lazy load nvm we can't auto switch node versions
# add-zsh-hook chpwd load-nvmrc

# make npm behave
# always silent on run commands
# npm lint = npm run lint
npm() {
  if [[ $1 == "run" && $2 == "lint" ]]; then
    command npm $@ --silent
  elif [[ $1 == "lint" ]]; then
    command npm run lint --silent $@
  else
    command npm $@
  fi
}

# flow watch
flow-watch () {
  clear;
  flow status;
  fswatch -e "/\." -o . | xargs -n1 -I{} flow status;
}
