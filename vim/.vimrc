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
Plugin 'tpope/vim-sleuth'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdcommenter'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'morhetz/gruvbox'
" Plugin 'ervandew/supertab'
Plugin 'Valloric/YouCompleteMe'
" Plugin 'SirVer/ultisnips'
Plugin 'Raimondi/delimitMate'
Plugin 'honza/vim-snippets'
Plugin 'airblade/vim-gitgutter'
Plugin 'mileszs/ack.vim'
Plugin 'chriskempson/base16-vim'
Plugin 'AndrewRadev/splitjoin.vim'

" PLUGINS - LANGUAGES
" JavaScript
"
" Syntax and indent
Plugin 'pangloss/vim-javascript'
" Correctly open required files or node source
"Plugin 'moll/vim-node'
" Esformatter
Plugin 'millermedeiros/vim-esformatter'

" Python
"
Plugin 'vim-scripts/indentpython.vim'

" Markdown
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
" pug
Plugin 'digitaltoad/vim-pug'
" API Blueprint
Plugin 'kylef/apiblueprint.vim'


call vundle#end()

"SETTINGS
syntax enable
set number
set relativenumber
filetype plugin indent on
set background=dark
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
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif
colorscheme base16-default-dark

" TAB SETTINGS
set tabstop=4 shiftwidth=2 expandtab
"set listchars=tab:»·,trail:·

" EXPERIMENTAL SETTINGS
" highlight OverLength ctermbg=red ctermfg=white guibg=#592929
" match OverLength /\%79v.\+/

" PERSONAL REMAPS
inoremap jj <Esc>
cmap w!! w !sudo tee > /dev/null %
let mapleader=","
nmap <leader>l :set list!<CR>
nnoremap <leader>h :noh<CR>
nmap <leader>j :%!python -m json.tool<CR>
nnoremap <leader>s :w<CR>

" autocmd InsertEnter * :set norelativenumber
" autocmd InsertLeave * :set relativenumber
nnoremap <leader>nu :set relativenumber!<CR>

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
nnoremap <Leader>1 :1b<CR>
nnoremap <Leader>2 :2b<CR>
nnoremap <Leader>3 :3b<CR>
nnoremap <Leader>4 :4b<CR>
nnoremap <Leader>5 :5b<CR>
nnoremap <Leader>6 :6b<CR>
nnoremap <Leader>7 :7b<CR>
nnoremap <Leader>8 :8b<CR>
nnoremap <Leader>9 :9b<CR>
nnoremap <Leader>0 :10b<CR>

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
let g:syntastic_python_checkers = ['flake8']

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
