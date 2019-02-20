" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

" General
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sleuth'
Plug 'tomtom/tcomment_vim'
Plug 'Raimondi/delimitMate'
Plug 'w0rp/ale'
Plug 'rhysd/devdocs.vim'
Plug 'mg979/vim-visual-multi', {'branch': 'test'}
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

" Files
Plug 'justinmk/vim-dirvish'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
if &diff
    map <leader>1 :diffget LOCAL<CR>
    map <leader>2 :diffget BASE<CR>
    map <leader>3 :diffget REMOTE<CR>
endif

" Visual
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'chriskempson/base16-vim'

" Completion
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-cssomni'

" Snippets
Plug 'ncm2/ncm2-ultisnips'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" JavaScript
" Plug 'pangloss/vim-javascript'
Plug 'othree/yajs.vim'
Plug 'othree/es.next.syntax.vim'
Plug 'mxw/vim-jsx'
Plug 'mattn/emmet-vim'
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

" PureScript
Plug 'purescript-contrib/purescript-vim'
Plug 'FrigoEU/psc-ide-vim'

" Initialize plugin system
call plug#end()

" General Settings
" set number
" set relativenumber
set undodir=~/.vimundo/
set undofile
set ignorecase
set smartcase
set wrapscan
set shortmess+=I
set noswapfile
set hidden
set updatetime=200
set dictionary+=/usr/share/dict/words

" Set colors
set background=dark
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

" Tab settings
set tabstop=2 shiftwidth=2 expandtab
set listchars=tab:»·,trail:·
set list

" Mapping
inoremap jk <Esc>
cmap w!! w !sudo tee > /dev/null %
let mapleader=" "
nnoremap <C-s> :w<CR>
nnoremap <leader>jq :%!jq '.'<CR>
noremap <leader>or :'<,'>sort<CR>
nnoremap <C-j> :ALENext<CR>
nnoremap <C-k> :ALEPrevious<CR>
" nnoremap ]] :ll<CR>
" nnoremap [[ :cc<CR>

" Search
nnoremap <silent> <leader>sc :nohlsearch<CR>
nnoremap <leader>sr :%s/\<<C-r><C-w>\>/

" Buffers
nnoremap <silent> <C-h> :bp<CR>
nnoremap <silent> <C-t> :bn<CR>
nnoremap <silent> <C-l> :bd<CR>
nnoremap <silent> <C-b> :e#<CR>

" ALE
let g:ale_linters = {
      \ 'javascript': ['eslint', 'xo'],
      \ 'rust': ['cargo', 'rls'],
      \ 'scss': ['stylelint'],
      \ 'typescript': [],
      \ 'haskell': ['hie'],
      \ 'python': ['flake8'],
      \}
let g:ale_fixers = {
      \ 'javascript': ['prettier', 'eslint', 'xo'],
      \ 'json': ['fixjson'],
      \ 'typescript': ['prettier', 'tslint'],
      \ 'rust': ['rustfmt'],
      \ 'scss': ['stylelint'],
      \ 'reason': ['refmt'],
      \ 'haskell': ['hfmt'],
      \ 'python': ['autopep8'],
      \}
let g:ale_fix_on_save = 0
let g:ale_lint_on_text_changed = 0
highlight ALEError ctermbg=none cterm=underline
" highlight ALEWarning ctermbg=none cterm=underline
nnoremap <C-p> :ALEFix<CR>
let g:ale_haskell_hie_executable = 'hie-wrapper'
nnoremap <leader>ld :ALEDetail<CR>

" Fzf
nnoremap <leader><leader> :GFiles<CR>
nnoremap <leader>fi       :Files<CR>
nnoremap <leader>C        :Colors<CR>
nnoremap <leader><CR>     :Buffers<CR>
nnoremap <leader>fl       :Lines<CR>
nnoremap <leader>ag       :Ag! <C-R><C-W><CR>
nnoremap <leader>m        :History<CR>

" delimitMate
let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_space = 1
let g:delimitMate_balance_matchpairs = 1

" Fugitive
nnoremap <leader>gs :vertical Gstatus<CR>
nnoremap <leader>gr :Gread<CR>
nnoremap <leader>gw :Gwrite<CR>
nnoremap <leader>gb :Gblame<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>ge :Gedit<CR>
nnoremap <leader>dg :diffget<CR>
nnoremap <leader>dp :diffput<CR>
nnoremap <leader>gl :Glog<CR>
nnoremap <C-F> yiw <ESC>:Git commit --fixup=<C-r>"<CR>

augroup nvim_term
  au!
  au TermOpen * startinsert
  au TermClose * stopinsert
augroup END

let g:LanguageClient_diagnosticsSignsMax = 1
let g:LanguageClient_diagnosticsEnable = 1
let g:LanguageClient_settingsPath = '~/.vim/'
let g:LanguageClient_serverCommands = {
      \ 'reason': ['~/.vim/plugged/vim-reason-plus/reason-language-server.exe'],
      \ 'ocaml': ['~/.node-bin/ocaml-language-server', '--stdio'],
      \ 'javascript': ['~/.node-bin/typescript-language-server', '--stdio'],
      \ 'javascript.jsx': ['~/.node-bin/typescript-language-server', '--stdio'],
      \ 'typescript': ['~/.node-bin/typescript-language-server', '--stdio'],
      \ 'typescript.tsx': ['~/.node-bin/typescript-language-server', '--stdio'],
      \ 'rust': ['~/.cargo/bin/rustup', 'run', 'nightly', 'rls'],
      \ 'haskell': ['hie-wrapper'],
      \ 'python': ['python-language-server'],
      \}

nnoremap <F5> :call LanguageClient_contextMenu()<CR>
nnoremap K :call LanguageClient#textDocument_hover()<CR>
nnoremap gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <leader>lr :call LanguageClient#textDocument_rename()<CR>
nnoremap <leader>lf :call LanguageClient#textDocument_formatting()<CR>
nnoremap <leader>lb :call LanguageClient#textDocument_references()<CR>
nnoremap <leader>la :call LanguageClient#textDocument_codeAction()<CR>
nnoremap <leader>ls :call LanguageClient#textDocument_documentSymbol()<CR>
nnoremap <leader>lt :call LanguageClient#textDocument_typeDefinition()<CR>

" fixjson
let g:fixjson_fix_on_save = 0

" import-js
nnoremap <leader>iw :ImportJSWord<CR>
nnoremap <Leader>if :ImportJSFix<CR>
nnoremap <Leader>ig :ImportJSGoto<CR>

" devdocs
augroup plugin-devdocs
  autocmd!
  autocmd FileType haskell,javascript,javascript.jsx,typescript,typescript.tsx]
        \ nmap <leader>dd <Plug>(devdocs-under-cursor)
augroup END

if has("gui_running")
  set macligatures
  set guifont=PragmataPro\ Liga:h14
  " set guifont=Hack
  " fixes highlights somehow
  syntax on
  highlight link ALEError SpellBad
  highlight link ALEWarning SpellCap
endif

" NCM2
autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect
au TextChangedI * call ncm2#auto_trigger()
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <silent> <expr> <TAB> ncm2_ultisnips#expand_or("\<TAB>", 'n')

" Ultisnips
let g:UltiSnipsExpandTrigger		= "<Plug>(ultisnips_expand)"
let g:UltiSnipsJumpForwardTrigger	= "<c-j>"
let g:UltiSnipsJumpBackwardTrigger	= "<c-k>"
let g:UltiSnipsRemoveSelectModeMappings = 0

" Emmet
let g:user_emmet_settings = {
\  'javascript.jsx' : {
\      'extends' : 'jsx',
\  },
\}

" PureScript
augroup pscbindings
  autocmd! pscbindings
  autocmd Filetype purescript nmap <buffer> <silent> <leader>pL :Plist<CR>
  autocmd Filetype purescript nmap <buffer> <silent> <leader>pl :Pload!<CR>
  autocmd Filetype purescript nmap <buffer> <silent> <leader>pr :Prebuild!<CR>
  autocmd Filetype purescript nmap <buffer> <silent> <leader>pf :PaddClause<CR>
  autocmd Filetype purescript nmap <buffer> <silent> <leader>pt :PaddType<CR>
  autocmd Filetype purescript nmap <buffer> <silent> <leader>pa :Papply<CR>
  autocmd Filetype purescript nmap <buffer> <silent> <leader>pA :Papply!<CR>
  autocmd Filetype purescript nmap <buffer> <silent> <leader>pC :Pcase!<CR>
  autocmd Filetype purescript nmap <buffer> <silent> <leader>pi :Pimport<CR>
  autocmd Filetype purescript nmap <buffer> <silent> <leader>pq :PaddImportQualifications<CR>
  autocmd Filetype purescript nmap <buffer> <silent> gd :Pgoto<CR>
  autocmd Filetype purescript nmap <buffer> <silent> <leader>pp :Pursuit<CR>
  autocmd Filetype purescript nmap <buffer> <silent> K :Ptype<CR>
augroup end
