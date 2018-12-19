" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

" PLUGINS - GENERAL
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sleuth'
" Plug 'tpope/vim-commentary'
Plug 'tomtom/tcomment_vim'
Plug 'Raimondi/delimitMate'
Plug 'w0rp/ale'
Plug 'rhysd/devdocs.vim'
" Plug 'mg979/vim-visual-multi', {'branch': 'test'}

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
Plug 'galooshi/vim-import-js'

" TypeScript
Plug 'HerringtonDarkholme/yats.vim'

" Rust
Plug 'rust-lang/rust.vim'

" Reason
Plug 'reasonml-editor/vim-reason-plus'

" JSON
Plug 'elzr/vim-json'
Plug 'rhysd/vim-fixjson'

" Lisp
Plug 'l04m33/vlime', {'rtp': 'vim/'}

" Haskell
Plug 'neovimhaskell/haskell-vim'
Plug 'eagletmt/neco-ghc'
Plug 'ndmitchell/ghcid', { 'rtp': 'plugins/nvim' }

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
colorscheme base16-tomorrow-night
set hidden

" TAB SETTINGS
set tabstop=2 shiftwidth=2 expandtab
set listchars=tab:»·,trail:·
set list

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
nnoremap <silent> <C-b> :bp<CR>
nnoremap <silent> <C-m> :bn<CR>
nnoremap <silent> <C-l> :bd<CR>
" nnoremap <silent> <C-l> :Bclose<CR>
nnoremap <silent> <C-h> :e#<CR>
nnoremap <Leader>1 :1b<CR>
nnoremap <Leader>2 :2b<CR>
nnoremap <Leader>3 :3b<CR>
nnoremap <Leader>4 :4b<CR>

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
      \ 'javascript': ['eslint'],
      \ 'rust': ['cargo', 'rls'],
      \ 'scss': ['stylelint'],
      \ 'typescript': ['tsserver'],
      \ 'haskell': ['ghc_mod', 'hdevtools', 'hie', 'hlint', 'stack_build', 'stack_ghc']
      \}
let g:ale_fixers = {
      \ 'javascript': ['prettier', 'eslint'],
      \ 'json': ['fixjson'],
      \ 'typescript': ['prettier'],
      \ 'rust': ['rustfmt'],
      \ 'scss': ['stylelint'],
      \ 'reason': ['refmt'],
      \ 'haskell': ['hfmt']
      \}
let g:ale_fix_on_save = 0
let g:ale_lint_on_text_changed = 1
highlight ALEError ctermbg=none cterm=underline
highlight ALEWarning ctermbg=none cterm=underline
nmap <C-k> <Plug>(ale_previous_wrap)
nmap <C-j> <Plug>(ale_next_wrap)
nnoremap <Leader>p :ALEFix<CR>

" Fzf
nnoremap <leader><leader> :GFiles<CR>
nnoremap <leader>fi       :Files<CR>
nnoremap <leader>C        :Colors<CR>
nnoremap <leader><Enter>  :Buffers<CR>
nnoremap <leader>fl       :Lines<CR>
nnoremap <leader>ag       :Ag! <C-R><C-W><CR>
nnoremap <leader>m        :History<CR>

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
" map <space>l :Git! log<CR>gg
nnoremap <C-F> yiw <ESC>:Git commit --fixup=<C-r>"<CR>

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
      \ 'rust': ['~/.cargo/bin/rustup', 'run', 'nightly', 'rls'],
      \ 'haskell': ['~/.hie-bin/hie-wrapper']
      \}

nnoremap <F5> :call LanguageClient_contextMenu()<CR>
nnoremap K :call LanguageClient#textDocument_hover()<CR>
map <Leader>lg :call LanguageClient#textDocument_definition()<CR>
map <Leader>lr :call LanguageClient#textDocument_rename()<CR>
map <Leader>lf :call LanguageClient#textDocument_formatting()<CR>
map <Leader>lb :call LanguageClient#textDocument_references()<CR>
map <Leader>la :call LanguageClient#textDocument_codeAction()<CR>
map <Leader>ls :call LanguageClient#textDocument_documentSymbol()<CR>

imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

let g:fixjson_fix_on_save = 0

" Deoplete
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ deoplete#mappings#manual_complete()
function! s:check_back_space() abort "{{{
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}

" import-js
nnoremap <leader>iw	:ImportJSWord<CR>
nnoremap <Leader>if	:ImportJSFix<CR>
nnoremap <Leader>ig	:ImportJSGoto<CR>

" devdocs
augroup plugin-devdocs
  autocmd!
  autocmd FileType haskell,javascript,javascript.jsx,typescript,typescript.tsx]
        \ nmap <leader>dd <Plug>(devdocs-under-cursor)
augroup END
let g:LanguageClient_loggingLevel = 'INFO'
let g:LanguageClient_loggingFile =  expand('~/.local/share/nvim/LanguageClient.log')
let g:LanguageClient_serverStderr = expand('~/.local/share/nvim/LanguageServer.log')

if has("gui_running")
  set macligatures
  set guifont=PragmataPro\ Liga:h14
  " set guifont=Hack
  set linespace=2
  " fixes highlights somehow
  syntax on
  highlight link ALEError SpellBad
  highlight link ALEWarning SpellCap
endif
