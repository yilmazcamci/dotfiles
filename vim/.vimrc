" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

" PLUGINS - GENERAL
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'w0rp/ale'
Plug 'scrooloose/nerdcommenter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ervandew/supertab'
Plug 'Valloric/YouCompleteMe'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'Raimondi/delimitMate'
Plug 'airblade/vim-gitgutter'
Plug 'elzr/vim-json'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

" Theme
Plug 'chriskempson/base16-vim'
" Plug 'morhetz/gruvbox'

" JavaScript
Plug 'pangloss/vim-javascript'
Plug 'flowtype/vim-flow'
Plug 'mxw/vim-jsx'
Plug 'mvolkmann/vim-js-arrow-function'
" Plug 'moll/vim-node'

" Markdown
" Plug 'godlygeek/tabular'
" Plug 'plasticboy/vim-markdown'

" Initialize plugin system
call plug#end()

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

" BINDING
inoremap jj <Esc>
cmap w!! w !sudo tee > /dev/null %
let mapleader=" "
nmap <leader>li :set list!<CR>
nnoremap <leader>h :noh<CR>
nnoremap <leader>s :w<CR>
nnoremap <leader>nu :set relativenumber!<CR>
nnoremap <leader>r :%s/\<<C-r><C-w>\>/
nnoremap <leader>qa :qall<CR>
nnoremap <leader>j :%!jq '.'<CR>
noremap <leader>or :'<,'>sort<CR>
nnoremap <Leader>co :call <SID>ToggleColorColumn()<cr>

noremap <leader>h <c-w>h
noremap <leader>l <c-w>l
noremap <leader>k <c-w>k
noremap <leader>j <c-w>j

" Buffers
" \l       : list buffers
" \b \f \g : go back/forward/last-used
nnoremap <Leader>b :bp<CR>
nnoremap <Leader>f :bn<CR>
nnoremap <Leader>d :bd<CR>
nnoremap <Leader>g :e#<CR>

" COMMANDS
command! PrettyPrintHTML !tidy -mi -html -wrap 0 %

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

" Trim Whitespace
function! TrimWhitespace()
    let l:save = winsaveview()
    %s/\s\+$//e
    call winrestview(l:save)
endfun
nnoremap <leader>wi :call TrimWhitespace()<CR>

"
" Plugins
"

" Nerdtree
map <leader>n :NERDTreeToggle<CR>
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
let g:ycm_key_list_select_completion   = ['<c-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<c-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" Markdown
let g:vim_markdown_folding_disabled = 1

" ALE
let g:ale_linters = { 'javascript': ['eslint', 'standard', 'xo'] }
let g:ale_fixers = { 'javascript': [ 'eslint', 'prettier_eslint' ], 
\ 'json': ['prettier_eslint'] 
\}
let g:ale_javascript_prettier_use_local_config = 1
let g:ale_fix_on_save = 1
let g:ale_pattern_options = {
\ 'node_modules/.*\.json$': {'ale_enabled': 0},
\}
" Map movement through errors without wrapping.
" nmap <C-k> <Plug>(ale_previous)
" nmap <C-j> <Plug>(ale_next)
" " OR map keys to use wrapping.
" nmap <C-k> <Plug>(ale_previous_wrap)
" nmap <C-j> <Plug>(ale_next_wrap)
nnoremap <Leader>p :ALEFix<CR>

" Flow
let g:flow#autoclose = 1

" Fzf
nnoremap <leader><leader> :GFiles<CR>
nnoremap <leader>F        :Files<CR>
nnoremap <leader>C        :Colors<CR>
nnoremap <leader><Enter>  :Buffers<CR>
nnoremap <leader>l        :Lines<CR>
nnoremap <leader>ag       :Ag! <C-R><C-W><CR>
nnoremap <leader>m        :History<CR>

" Command for git grep
" - fzf#vim#grep(command, with_column, [options], [fullscreen])
command! -bang -nargs=* GGrep
  \ call fzf#vim#grep('git grep --line-number '.shellescape(<q-args>), 0, <bang>0)

" Override Colors command. You can safely do this in your .vimrc as fzf.vim
" will not override existing commands.
command! -bang Colors
  \ call fzf#vim#colors({'left': '15%', 'options': '--reverse --margin 30%,0'}, <bang>0)

" Augmenting Ag command using fzf#vim#with_preview function
"   * fzf#vim#with_preview([[options], preview window, [toggle keys...]])
"     * For syntax-highlighting, Ruby and any of the following tools are required:
"       - Highlight: http://www.andre-simon.de/doku/highlight/en/highlight.php
"       - CodeRay: http://coderay.rubychan.de/
"       - Rouge: https://github.com/jneen/rouge
"
"   :Ag  - Start fzf with hidden preview window that can be enabled with "?" key
"   :Ag! - Start fzf in fullscreen and display the preview window above
command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \                 <bang>0)

" Likewise, Files, GFiles command with preview window
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

command! -bang -nargs=? -complete=dir GFiles
  \ call fzf#vim#gitfiles(<q-args>, fzf#vim#with_preview(), <bang>0)

" Pangloss
let g:javascript_plugin_flow = 1

" delimitMate
let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_space = 1
let g:delimitMate_balance_matchpairs = 1

" Fugitive
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gr :Gread<CR>
nnoremap <leader>gw :Gwrite<CR>
nnoremap <leader>gb :Gblame<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>ge :Gedit<CR>
nnoremap <leader>dg :diffget<CR>
nnoremap <leader>dp :diffput<CR>
