" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

" PLUGINS - GENERAL
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-commentary'
Plug 'Raimondi/delimitMate'
Plug 'w0rp/ale'

" Files
Plug 'scrooloose/nerdtree'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Visual
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'chriskempson/base16-vim'

"Completion
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
let g:deoplete#enable_at_startup = 1
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'


" JavaScript
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'mattn/emmet-vim'
Plug 'mvolkmann/vim-js-arrow-function'
Plug 'leafgarland/typescript-vim'
Plug 'galooshi/vim-import-js'

" Rust
Plug 'rust-lang/rust.vim'

" Reason
Plug 'reasonml-editor/vim-reason-plus'

" JSON
Plug 'elzr/vim-json'
Plug 'rhysd/vim-fixjson'

" Lisp
Plug 'l04m33/vlime', {'rtp': 'vim/'}

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
set hidden

" TAB SETTINGS
set tabstop=2 shiftwidth=2 expandtab
" set listchars=tab:»·,trail:·

" BINDING
inoremap jk <Esc>
cmap w!! w !sudo tee > /dev/null %
let mapleader=" "
nmap <leader>li :set list!<CR>
nnoremap <C-s> :w<CR>
nnoremap <leader>nu :set relativenumber!<CR>
nnoremap <leader>qa :qall<CR>
nnoremap <leader>jq :%!jq '.'<CR>
noremap <leader>or :'<,'>sort<CR>
nnoremap <Leader>co :call <SID>ToggleColorColumn()<cr>

noremap <leader>h <c-w>h
noremap <leader>l <c-w>l
noremap <leader>k <c-w>k
noremap <leader>j <c-w>j

" Search
nnoremap <leader>sc :noh<CR>
nnoremap <leader>sr :%s/\<<C-r><C-w>\>/

" Buffers
" \l       : list buffers
" \b \f \g : go back/forward/last-used
nnoremap <silent> <C-p> :bp<CR>
nnoremap <silent> <C-n> :bn<CR>
nnoremap <silent> <C-l> :Bclose<CR>
" nnoremap <silent> <C-L> :bd<CR>
nnoremap <silent> <C-h> :e#<CR>
nnoremap <leader>wc :wq<CR>

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
map <leader>no :NERDTreeToggle<CR>
map <leader>nf :NERDTreeFind<CR>

" Airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

" ALE
let g:ale_linters = {
      \ 'javascript': ['flow', 'eslint', 'standard', 'xo'],
      \ 'rust': ['cargo', 'rls'],
      \ 'scss': ['stylelint'],
      \ 'typescript': ['tsserver', 'tslint']
      \}
let g:ale_fixers = { 
      \ 'javascript': ['prettier_eslint', 'prettier', 'eslint'],
      \ 'json': ['fixjson'],
      \ 'typescript': ['prettier', 'tslint'],
      \ 'rust': ['rustfmt'],
      \ 'scss': ['stylelint'],
      \ 'reason': ['refmt']
      \}
let g:ale_javascript_prettier_use_local_config = 1
let g:ale_fix_on_save = 0
let g:ale_pattern_options = {
\ 'node_modules/.*\.json$': {'ale_enabled': 0},
\}
nmap <C-k> <Plug>(ale_previous_wrap)
nmap <C-j> <Plug>(ale_next_wrap)
nnoremap <Leader>p :ALEFix<CR>

" Fzf
nnoremap <leader><leader> :GFiles<CR>
nnoremap <leader>Fi       :Files<CR>
nnoremap <leader>C        :Colors<CR>
nnoremap <leader><Enter>  :Buffers<CR>
nnoremap <leader>Fl       :Lines<CR>
nnoremap <leader>ag       :Ag! <C-R><C-W><CR>
nnoremap <leader>m        :History<CR>

" Pangloss
let g:javascript_plugin_flow = 0

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
nnoremap <leader>gl :Glog<CR>

if has('nvim')
  augroup nvim_term
    au!
    au TermOpen * startinsert
    au TermClose * stopinsert
  augroup END
endif

let g:LanguageClient_diagnosticsSignsMax = 0

let g:LanguageClient_serverCommands = {
      \ 'reason': ['~/.vim/plugged/vim-reason-plus/reason-language-server.exe'],
      \ 'ocaml': ['~/.node-bin/ocaml-language-server', '--stdio'],
      \ 'javascript': ['~/.node-bin/javascript-typescript-stdio'],
      \ 'javascript.jsx': ['~/.node-bin/javascript-typescript-stdio'],
      \ 'typescript': ['~/.node-bin/javascript-typescript-stdio'],
      \ 'rust': ['~/.cargo/bin/rustup', 'run', 'nightly', 'rls']
      \}

nnoremap <F5> :call LanguageClient_contextMenu()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<cr>
nnoremap <silent> gf :call LanguageClient_textDocument_formatting()<cr>
nnoremap <silent> <cr> :call LanguageClient_textDocument_hover()<cr>
nnoremap <leader>rn :call LanguageClient_textDocument_rename()<CR>

imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

let g:fixjson_fix_on_save = 0

" import-js
nnoremap <leader>ij	:ImportJSWord<CR>
nnoremap <Leader>ii	:ImportJSFix<CR>
nnoremap <Leader>ig	:ImportJSGoto<CR>
