" LOAD VUNDLE
set nocompatible
filetype off
" set the runtime path to include Vundle and initialize
 set rtp+=~/.vim/bundle/Vundle.vim
 call vundle#begin()

 " let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"
" PLUGINS
"

" PLUGINS - GENERAL
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-unimpaired'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdcommenter'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'morhetz/gruvbox'
Plugin 'Valloric/YouCompleteMe'
Plugin 'Raimondi/delimitMate'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'mileszs/ack.vim'

" PLUGINS - LANGUAGES
"Plugin 'digitaltoad/vim-jade'
"Plugin 'cakebaker/scss-syntax.vim'
"Plugin 'othree/html5-syntax.vim'
"Plugin 'othree/html5.vim'
Plugin 'rust-lang/rust.vim'

"
" PLUGINS - JAVASCRIPT
"
" Syntax and indent plugins
Plugin 'pangloss/vim-javascript'
" Correctly open required files or node source
"Plugin 'moll/vim-node'
" Syntax highlighting for common javascript libraries
"Plugin 'othree/javascript-libraries-syntax.vim'
" Esformatter
Plugin 'millermedeiros/vim-esformatter'

call vundle#end()

"SETTINGS
 syntax enable
 set number
 set t_Co=256
 filetype plugin indent on
 set background=dark
 colorscheme Tomorrow-Night
 set undofile
 set undodir=~/.vimundo/
 set guioptions-=m guioptions-=T guioptions-=r
 set hlsearch
 set ignorecase
 set smartcase
 "set wrapscan
 set shortmess+=I
 set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux

" TAB SETTINGS
set tabstop=4 shiftwidth=2 expandtab
"set listchars=tab:»·,trail:·

" EXPERIMENTAL SETTINGS
"highlight OverLength ctermbg=red ctermfg=white guibg=#592929
"match OverLength /\%101v.\+/

" PERSONAL REMAPS
inoremap jj <Esc>
cmap w!! w !sudo tee > /dev/null %
let mapleader=","
nmap <leader>l :set list!<CR>
nnoremap <leader>h :noh<CR>
nmap <leader>j :%!python -m json.tool<CR>
nnoremap <leader>s :w<CR>

"
" Plugins
"

" Use ag if we can
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" ctrlp
"
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.git|node_modules|flow-typed|build$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ }

" Nerdtree
map <C-n> :NERDTreeToggle<CR>
map <C-S-n> :NERDTreeFind<CR>
"autocmd vimenter * if !argc() | NERDTree | endif

" Nerdcommenter
let g:NERDSpaceDelims = 1

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Syntastic - Checkers
let g:syntastic_javascript_checkers = ['eslint', 'flow']
let g:syntastic_rust_checkers = ['rustc']

" delimitMate
let g:delimitMate_expand_cr = 1

" Airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

" Utilsnips
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" Javascript Libraries Syntax
let g:used_javascript_libs = 'underscore,react'

" Esformatter
nnoremap <silent> <leader>es :Esformatter<CR>
vnoremap <silent> <leader>es :EsformatterVisual<CR>

" rustfmt
nnoremap <silent> <leader>rf :RustFmt<CR>
