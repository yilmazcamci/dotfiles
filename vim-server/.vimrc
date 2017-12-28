" LOAD VUNDLE
set nocompatible
filetype off
" set the runtime path to include Vundle and initialize
 set rtp+=~/.vim/bundle/Vundle.vim
 call vundle#begin()

 " let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" PLUGINS - GENERAL
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-sleuth'
Plugin 'tpope/vim-fugitive',
Plugin 'scrooloose/nerdtree'
Plugin 'w0rp/ale'
Plugin 'scrooloose/nerdcommenter'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'ervandew/supertab'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'Raimondi/delimitMate'
Plugin 'airblade/vim-gitgutter'
Plugin 'mileszs/ack.vim'

" Theme
Plugin 'chriskempson/base16-vim'
" Plugin 'morhetz/gruvbox'

" JavaScript
Plugin 'pangloss/vim-javascript'
Plugin 'flowtype/vim-flow'
Plugin 'prettier/vim-prettier'
Plugin 'mxw/vim-jsx'
Plugin 'mvolkmann/vim-js-arrow-function'
Plugin 'moll/vim-node'

" Markdown
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

call vundle#end()

" General Settings
syntax enable
set number
set relativenumber
filetype plugin indent on
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
" Set colors
set background=dark
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif
colorscheme base16-default-dark

" TAB SETTINGS
set tabstop=4 shiftwidth=2 expandtab
set listchars=tab:»·,trail:·

" PERSONAL REMAPS
inoremap jj <Esc>
cmap w!! w !sudo tee > /dev/null %
let mapleader=","
nmap <leader>li :set list!<CR>
nnoremap <leader>h :noh<CR>
nmap <leader>j :%!python -m json.tool<CR>
nnoremap <leader>s :w<CR>
nnoremap <leader>nu :set relativenumber!<CR>
nnoremap <Leader>r :%s/\<<C-r><C-w>\>/

" toggle colored right border after 80 chars
set colorcolumn=80
let s:color_column_old = 0

function! s:ToggleColorColumn()
    if s:color_column_old == 0
        let s:color_column_old = &colorcolumn
        windo let &colorcolumn = 0
    else
        windo let &colorcolumn=s:color_column_old
        let s:color_column_old = 0
    endif
endfunction

nnoremap <Leader>co :call <SID>ToggleColorColumn()<cr>

" Trim Whitespace
function! TrimWhitespace()
    let l:save = winsaveview()
    %s/\s\+$//e
    call winrestview(l:save)
endfun
nnoremap <leader>wi :call TrimWhitespace()<CR>

" Buffers
" \l       : list buffers
" \b \f \g : go back/forward/last-used
" \1 \2 \3 : go to buffer 1/2/3 etc
nnoremap <Leader>l :ls<CR>
nnoremap <Leader>b :bp<CR>
nnoremap <Leader>f :bn<CR>
nnoremap <Leader>g :e#<CR>
nnoremap <Leader>d :bd<CR>

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
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ }
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" Nerdtree
map <C-n> :NERDTreeToggle<CR>
map <leader>nf :NERDTreeFind<CR>

" Nerdcommenter
let g:NERDSpaceDelims = 1

" Airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

" YouCompleteMe
let g:ycm_python_binary_path = '/usr/local/bin/python3'

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" Markdown
let g:vim_markdown_folding_disabled = 1

" ALE
let g:ale_linters = { 'javascript': ['eslint', 'standard', 'xo'] }
let g:ale_fixers = { 'javascript': [ 'eslint', 'prettier_eslint', 'prettier' ], 'json': ['prettier_eslint'] }
let g:ale_javascript_prettier_use_local_config = 1
nnoremap <Leader>p :ALEFix<CR>

