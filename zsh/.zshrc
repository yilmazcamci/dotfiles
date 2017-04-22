#
# Executes commands at the start of an interactive session.
#

# fixes bad iterm locale
export LC_ALL=en_US.UTF-8

# homebrew
export HOMEBREW_GITHUB_API_TOKEN="f524ee63fcee2a137246c81909a1be02aae2f703" 

# env vars we like
export TERM=xterm-256color
export XDG_CONFIG_HOME=/Users/alexander/.config

# lazy load nvm
export NVM_LAZY_LOAD=false

# load zgen
source "${HOME}/.zgen/zgen.zsh"

# if the init scipt doesn't exist
if ! zgen saved; then
    echo "Creating a zgen save"

    zgen oh-my-zsh

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
    zgen load mafredri/zsh-async

    # theme
    zgen load sindresorhus/pure

    # Bullet train prompt setup
    # zgen load caiogondim/bullet-train-oh-my-zsh-theme bullet-train

    # syntax highlight needs to come before history-substring-search
    zgen load zsh-users/zsh-syntax-highlighting
    zgen load zsh-users/zsh-history-substring-search

    # save all to init script
    zgen save
fi

bindkey '\eOA' history-substring-search-up # or ^[OA
bindkey '\eOB' history-substring-search-down # or ^[OB

# configure bullettrain
BULLETTRAIN_PROMPT_ORDER=(
  dir
  git
  virtualenv
  status
)

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

export NVM_DIR="$HOME/.nvm"

# when entering a project dir
# 1. load nvm
# 2. match node version to .nvmrc
autoload -U add-zsh-hook
load-nvmrc() {
    # check for project defined version
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
add-zsh-hook chpwd load-nvmrc
# execute once on shell start
load-nvmrc

# flow watch
flow-watch() {
  clear;
  flow status;
  fswatch -e "/\." -o . | xargs -n1 -I{} flow status;
}

# get that base16 color goodness
BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

# Correction if completion is not possible
zstyle ':completion:*' completer _complete _approximate

# source yarn global bin
# export PATH=${PATH}:~/.config/yarn/global/node_modules/.bin
