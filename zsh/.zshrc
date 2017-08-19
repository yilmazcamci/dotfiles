# env
export XDG_CONFIG_HOME=/Users/alexander/.config
export PATH=${PATH}:~/.nvm/versions/node/v8.4.0/bin/
export HOMEBREW_GITHUB_API_TOKEN="f524ee63fcee2a137246c81909a1be02aae2f703" 
export NVM_LAZY_LOAD=true
export PATH="$PATH:$HOME/scripts"

# get that base16 color goodness
BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/alexander/Downloads/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/alexander/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/alexander/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/alexander/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

# load zgen
source "${HOME}/.zgen/zgen.zsh"

# if the init scipt doesn't exist
if ! zgen saved; then

  # specify plugins here
  zgen oh-my-zsh
  zgen oh-my-zsh plugins/git

  # Auto update every seven days
  zgen load unixorn/autoupdate-zgen

  zsh-users/zsh-completions

  # Open your current repo & branch on github.
  zgen load peterhurford/git-it-on.zsh

  zgen oh-my-zsh plugins/colored-man-pages

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

# load sorin's special git formatting before alias
zstyle -s ':prezto:module:git:log:medium' format '_git_log_medium_format' \
  || _git_log_medium_format='%C(bold)Commit:%C(reset) %C(green)%H%C(red)%d%n%C(bold)Author:%C(reset) %C(cyan)%an <%ae>%n%C(bold)Date:%C(reset)   %C(blue)%ai (%ar)%C(reset)%n%+B'
zstyle -s ':prezto:module:git:log:oneline' format '_git_log_oneline_format' \
  || _git_log_oneline_format='%C(green)%h%C(reset) %s%C(red)%d%C(reset)%n'
zstyle -s ':prezto:module:git:log:brief' format '_git_log_brief_format' \
  || _git_log_brief_format='%C(green)%h%C(reset) %s%n%C(blue)(%ar by %an)%C(red)%d%C(reset)%n'

# aliases
source ~/.alias

# custom commands
flow-watch() {
  clear;
  flow status;
  fswatch -e "/\." -o . | xargs -n1 -I{} flow status;
}

# Correction if completion is not possible
zstyle ':completion:*' completer _complete _approximate

# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
