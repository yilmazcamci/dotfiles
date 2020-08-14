# dotfiles

## packages these dotfiles expect
fnm exa fd fzf ripgrep

## files these dotfiles expect
git clone https://github.com/tarjoilija/zgen.git "${HOME}/.zgen"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell
