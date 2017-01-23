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
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdcommenter'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'morhetz/gruvbox'
Plugin 'ervandew/supertab'
Plugin 'Valloric/YouCompleteMe'
Plugin 'SirVer/ultisnips'
Plugin 'Raimondi/delimitMate'
Plugin 'honza/vim-snippets'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'mileszs/ack.vim'

" PLUGINS - LANGUAGES
" pug
Plugin 'digitaltoad/vim-pug'
" rust
Plugin 'rust-lang/rust.vim'
" API Blueprint
Plugin 'kylef/apiblueprint.vim'
" JavaScript
" Syntax and indent
Plugin 'pangloss/vim-javascript'
Plugin 'sindresorhus/vim-xo'
" Correctly open required files or node source
"Plugin 'moll/vim-node'
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
set noswapfile

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
nnoremap <silent> <leader>co :call g:ToggleColorColumn()<CR>

function! g:ToggleColorColumn()
  if &colorcolumn != ''
    setlocal colorcolumn&
  else
    setlocal colorcolumn=+1
  endif
endfunction

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
map <leader>n :NERDTreeFind<CR>
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
let g:syntastic_javascript_checkers = ['eslint', 'xo']
let g:Syntastic_json_checkers = ['jsonlint']
let g:syntastic_rust_checkers = ['rustc']

" delimitMate
let g:delimitMate_expand_cr = 1

" Airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

" YouCompleteMe
let g:ycm_python_binary_path = '/usr/bin/python3'

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" Javascript Libraries Syntax
let g:used_javascript_libs = 'underscore,react'

" Esformatter
nnoremap <silent> <leader>es :Esformatter<CR>
vnoremap <silent> <leader>es :EsformatterVisual<CR>

" rustfmt
nnoremap <silent> <leader>rf :RustFmt<CR>
