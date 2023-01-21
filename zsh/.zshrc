# load zgenom
source "${HOME}/.zgenom/zgenom.zsh"

# Check for plugin and zgenom updates every 7 days
# This does not increase the startup time.
zgenom autoupdate --background

# if the init scipt doesn't exist
if ! zgenom saved; then

  # Auto update every seven days
  zgenom load unixorn/autoupdate-zgen

  # Oh My Zsh
  zgenom ohmyzsh
  zgenom ohmyzsh plugins/kubectl

  # Prezto
  zgenom prezto gnu-utility prefix 'g'
  zgenom prezto utility safe-ops 'no'
  # zgenom prezto prompt theme 'pure'
  zgenom prezto '*' color 'yes'

  zgenom prezto
  # zgenom prezto environment
  # zgenom prezto terminal
  # zgenom prezto editor
  zgenom prezto history
  # zgenom prezto directory
  # zgenom prezto spectrum
  # zgenom prezto gnu-utility
  # zgenom prezto utility
  # zgenom prezto completion
  # zgenom prezto prompt
  zgenom prezto git
  # zgenom prezto command-not-found

  # Safe rm
  # zgenom load MikeDacre/careful_rm
  zgenom load mattmc3/zsh-safe-rm

  # As you type auto suggestions
  zgenom load zsh-users/zsh-autosuggestions

  # Syntax highlighting
  zgenom load zsh-users/zsh-syntax-highlighting

  # History substring search (needs syntax highlighting)
  zgenom load zsh-users/zsh-history-substring-search

  # zgenom load zsh-users/zsh-completions src

  # alias tips
  zgenom load djui/alias-tips

  # colored man pages
  zgenom load ael-code/zsh-colored-man-pages

  # powerlevel theme
  zgenom load romkatv/powerlevel10k powerlevel10k

  zgenom load unixorn/fzf-zsh-plugin

  # generate the init script from plugins above
  zgenom save

  # Compile your zsh files
  zgenom compile "$HOME/dotfiles/zsh/.zshrc"
fi

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# aliases
source ~/.alias

# Base16 Shell
# BASE16_SHELL="$HOME/.config/base16-shell/"
# [ -n "$PS1" ] && \
# [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
# eval "$("$BASE16_SHELL/profile_helper.sh")"

bindkey '\eOA' history-substring-search-up # or ^[OA
bindkey '\eOB' history-substring-search-down # or ^[OB

# Correction if completion is not possible
zstyle ':completion:*' completer _complete _approximate

# During devops some commands contain secrets and should not be stored in history
setopt HIST_IGNORE_SPACE

# export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git"'

# GitHub hub
if command -v hub &>/dev/null; then
  # Extend git with hub
  eval "$(hub alias -s)"
fi

# fnm
export PATH=/Users/alextes/.fnm:$PATH
eval "$(fnm env --use-on-cd)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS --color=16"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Scaleway CLI autocomplete initialization.
eval "$(scw autocomplete script shell=zsh)"
