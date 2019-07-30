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
" Plug 'w0rp/ale'
Plug 'rhysd/devdocs.vim'
Plug 'mg979/vim-visual-multi', {'branch': 'test'}
Plug 'terryma/vim-expand-region'

" Writing
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
" Plug 'autozimu/LanguageClient-neovim', {
"     \ 'branch': 'next',
"     \ 'do': 'bash install.sh',
"     \ }
" Plug 'ncm2/ncm2'
" Plug 'roxma/nvim-yarp'
" Plug 'ncm2/ncm2-bufword'
" Plug 'ncm2/ncm2-path'
" Plug 'ncm2/ncm2-cssomni'

" Install nightly build, replace ./install.sh with install.cmd on windows
Plug 'neoclide/coc.nvim', {'do': './install.sh nightly'}

" Snippets
" Plug 'ncm2/ncm2-ultisnips'
" Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'

" JavaScript
" Plug 'pangloss/vim-javascript'
Plug 'othree/yajs.vim'
Plug 'othree/es.next.syntax.vim'
Plug 'mxw/vim-jsx'
Plug 'mattn/emmet-vim'
Plug 'galooshi/vim-import-js'

function! SynGroup()
  let l:s = synID(line('.'), col('.'), 1)
  echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
endfun
map <F10> :call SynGroup()<CR>

" TypeScript
" Plug 'leafgarland/typescript-vim'
Plug 'HerringtonDarkholme/yats.vim'

" Rust
" Plug 'rust-lang/rust.vim'

" Reason
Plug 'reasonml-editor/vim-reason-plus'

" JSON
Plug 'elzr/vim-json'
Plug 'rhysd/vim-fixjson'

" Lisp
" Plug 'l04m33/vlime', {'rtp': 'vim/'}

" Haskell
Plug 'neovimhaskell/haskell-vim'
" Plug 'eagletmt/neco-ghc'
Plug 'dan-t/vim-hsimport'
autocmd FileType haskell nmap <silent> <leader>hm :silent update <bar> HsimportModule<CR>
autocmd FileType haskell nmap <silent> <leader>hy :silent update <bar> HsimportSymbol<CR>

" PureScript
Plug 'purescript-contrib/purescript-vim'
Plug 'FrigoEU/psc-ide-vim'

" Dhall
Plug 'vmchale/dhall-vim'

" GraphQL
Plug 'jparise/vim-graphql'

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
nmap <silent> <C-k> <Plug>(ale_previous)
nmap <silent> <C-j> <Plug>(ale_next)
" nnoremap <C-j> :cnext<CR>
" nnoremap <C-k> :cprevious<CR>
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
      \ 'haskell': [],
      \ 'python': ['flake8'],
      \}
      " \ 'typescript': ['prettier', 'tslint', 'xo'],
let g:ale_fixers = {
      \ 'javascript': ['prettier', 'eslint'],
      \ 'json': ['fixjson'],
      \ 'typescript': ['prettier', 'tslint'],
      \ 'rust': ['rustfmt'],
      \ 'scss': ['stylelint'],
      \ 'reason': ['refmt'],
      \ 'haskell': ['hfmt'],
      \ 'python': ['autopep8'],
      \}
" let g:ale_lint_on_text_changed = 0
" highlight ALEError ctermbg=none cterm=underline
" highlight ALEWarning ctermbg=none cterm=underline
nnoremap <C-p> :ALEFix<CR>
nnoremap <leader>ld :ALEDetail<CR>
let g:ale_haskell_hie_executable = 'hie-wrapper'

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
nnoremap <C-F> yiw <ESC>:Git commit --fixup=<C-r>"<CR>


if has("nvim")
  augroup nvim_term
    au!
    au TermOpen * startinsert
    au TermClose * stopinsert
  augroup END
endif

" let g:LanguageClient_diagnosticsSignsMax = 1
" let g:LanguageClient_diagnosticsEnable = 1
" let g:LanguageClient_settingsPath = '~/.vim/'
" let g:LanguageClient_loggingFile = expand('~/.vim/LanguageClient.log')
" let g:LanguageClient_serverCommands = {
"       \ 'reason': ['~/.vim/plugged/vim-reason-plus/reason-language-server.exe'],
"       \ 'ocaml': ['~/.node-bin/ocaml-language-server', '--stdio'],
"       \ 'javascript': ['~/.node-bin/typescript-language-server', '--stdio'],
"       \ 'javascript.jsx': ['~/.node-bin/typescript-language-server', '--stdio'],
"       \ 'typescript': ['~/.node-bin/typescript-language-server', '--stdio'],
"       \ 'typescript.tsx': ['~/.node-bin/typescript-language-server', '--stdio'],
"       \ 'rust': ['~/.cargo/bin/rustup', 'run', 'nightly', 'rls'],
"       \ 'haskell': ['hie-wrapper'],
"       \ 'python': ['python-language-server'],
"       \}
" let g:LanguageClient_rootMarkers = {
"       \ 'purescript': ['spago.dhall', 'psc-package.json']
"       \ }

" nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" nnoremap K :call LanguageClient#textDocument_hover()<CR>
" nnoremap gd :call LanguageClient#textDocument_definition()<CR>
" nnoremap <leader>lr :call LanguageClient#textDocument_rename()<CR>
" nnoremap <leader>lf :call LanguageClient#textDocument_formatting()<CR>
" nnoremap <leader>lb :call LanguageClient#textDocument_references()<CR>
" nnoremap <leader>la :call LanguageClient#textDocument_codeAction()<CR>
" nnoremap <leader>ls :call LanguageClient#textDocument_documentSymbol()<CR>
" nnoremap <leader>lt :call LanguageClient#textDocument_typeDefinition()<CR>
" nnoremap <leader>le :call LanguageClient#explainErrorAtPoint()<CR>

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
" autocmd BufEnter * call ncm2#enable_for_buffer()
" set completeopt=noinsert,menuone,noselect
" au TextChangedI * call ncm2#auto_trigger()
" inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Ultisnips
" let g:UltiSnipsExpandTrigger		= "<Plug>(ultisnips_expand)"
" let g:UltiSnipsJumpForwardTrigger	= "<c-j>"
" let g:UltiSnipsJumpBackwardTrigger	= "<c-k>"
" let g:UltiSnipsRemoveSelectModeMappings = 0

" Emmet
let g:user_emmet_settings = {
\  'javascript.jsx' : {
\      'extends' : 'jsx',
\  },
\}

augroup pscbindings
  autocmd! pscbindings
    " autocmd Filetype purescript set tabstop=2
    " autocmd Filetype purescript set shiftwidth=2
"     if executable("purescript-language-server")
"       " See https://github.com/nwolverson/vscode-ide-purescript/blob/master/package.json#L80-L246 for list of properties to use
"       let config =
"             \ { 'purescript.autoStartPscIde': v:true
"             \ , 'purescript.pscIdePort': v:null
"             \ , 'purescript.autocompleteAddImport': v:true
"             \ , 'purescript.pursExe': 'purs'
"             \ }
"
"       let g:LanguageClient_serverCommands.purescript = ['purescript-language-server', '--stdio', '--config', json_encode(config)]
"       " autocmd filetype purescript setlocal omnifunc=LanguageClient#complete
"       " autocmd filetype purescript nm <buffer> <silent> <leader>pi :call LanguageClient_workspace_executeCommand(
"             " \ 'purescript.addCompletionImport', [ expand('<cword>'), v:null, v:null, 'file://' . expand('%:p') ])<CR>
"       autocmd filetype purescript nm <buffer> <silent> <leader>pl :call LanguageClient_workspace_executeCommand('purescript.build', [])<CR>
"     endif
"   " autocmd Filetype purescript nmap <buffer> <silent> <leader>pL :Plist<CR>
"   " autocmd Filetype purescript nmap <buffer> <silent> <leader>pl :Pload!<CR>
"   autocmd Filetype purescript nmap <buffer> <silent> <leader>pr :Prebuild!<CR>
"   autocmd Filetype purescript nmap <buffer> <silent> <leader>pf :PaddClause<CR>
"   autocmd Filetype purescript nmap <buffer> <silent> <leader>pt :PaddType<CR>
"   autocmd Filetype purescript nmap <buffer> <silent> <leader>pa :Papply<CR>
"   autocmd Filetype purescript nmap <buffer> <silent> <leader>pA :Papply!<CR>
  autocmd Filetype purescript nmap <buffer> <silent> <leader>pC :Pcase!<CR>
  autocmd Filetype purescript nmap <buffer> <silent> <leader>pi :Pimport<CR>
"   autocmd Filetype purescript nmap <buffer> <silent> <leader>pq :PaddImportQualifications<CR>
"   " autocmd Filetype purescript nmap <buffer> <silent> gd :Pgoto<CR>
"   autocmd Filetype purescript nmap <buffer> <silent> <leader>pp :Pursuit<CR>
"   " autocmd Filetype purescript nmap <buffer> <silent> K :Ptype<CR>
"
  nnoremap <silent> <leader>ps :silent exec "!purty % --write"<CR>
augroup end

augroup haskellbindings
  autocmd! haskellbindings
  autocmd Filetype haskell setlocal formatprg=hindent
augroup end

" CoC
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
" let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'
