" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

" General
" Plug 'tpope/vim-sensible'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sleuth'
Plug 'tomtom/tcomment_vim'
" Plug 'mg979/vim-visual-multi', {'branch': 'test'}
Plug 'tpope/vim-obsession'

" Focus
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

" Explore
Plug 'justinmk/vim-dirvish'
" Plug 'cocopon/vaffle.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Git
Plug 'tpope/vim-fugitive'
" Plug 'airblade/vim-gitgutter'
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
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'honza/vim-snippets'

" JavaScript
" Plug 'othree/yajs.vim'
" Plug 'othree/es.next.syntax.vim'
" Plug 'mxw/vim-jsx'
" Plug 'mattn/emmet-vim'
" Plug 'galooshi/vim-import-js'
" Plug 'ludovicchabant/vim-gutentags'
" Plug 'kristijanhusak/vim-js-file-import', {'do': 'npm install'}

" TypeScript
" Plug 'HerringtonDarkholme/yats.vim'

" Reason
" Plug 'reasonml-editor/vim-reason-plus'

" JSON
" Plug 'elzr/vim-json'
Plug 'neoclide/jsonc.vim'

" Haskell
" Plug 'neovimhaskell/haskell-vim'
" Plug 'sdiehl/vim-ormolu'

" PureScript
Plug 'purescript-contrib/purescript-vim'
Plug 'FrigoEU/psc-ide-vim'

" Dhall
" Plug 'vmchale/dhall-vim'

" Lisp
" Plug 'l04m33/vlime', { 'rtp': 'vim/' }

" Nix
" Plug 'LnL7/vim-nix'

" CSV
Plug 'chrisbra/csv.vim'

" Helpful ({[ pair insertion
" Plug 'jiangmiao/auto-pairs'

" Postgres
" Plug 'lifepillar/pgsql.vim'

" Nunjucks
" Plug 'Glench/Vim-Jinja2-Syntax'

"Initialize plugin system
call plug#end()

" General Settings
set undodir=~/.vimundo/
set undofile
set ignorecase
set smartcase
set wrapscan
set shortmess+=I
set hidden
set updatetime=300
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

let mapleader=" "

" Quick save
nnoremap <c-s> :write<CR>

" Quicker exit insert
inoremap jj <Esc>

" Write file as root
cmap w!! w !sudo tee > /dev/null %

" Sort visual selection alphabetically
noremap <leader>or :'<,'>sort<CR>
noremap <leader>ob vi{:'<,'>sort<CR>

" Disable c-z to suspend
nnoremap <c-z> <nop>

" Ignore node_modules generally
set wildignore+=node_modules/*

" Search
nnoremap <silent> <leader>sc :nohlsearch<CR>
nnoremap <leader>rw :%s/\<<C-r><C-w>\>/

" Buffers
nnoremap <silent> <C-h> :bp<CR>
nnoremap <silent> <C-t> :bn<CR>
nnoremap <silent> <C-l> :bd<CR>
nnoremap <silent> <C-b> :e#<CR>

" Fzf
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

nnoremap <leader>h :Files<CR>
nnoremap <leader>t :Buffers<CR>
nnoremap <leader>n :GFiles<CR>
nnoremap <leader>u :GFiles?<CR>
nnoremap <leader>cc :Commits<CR>
nnoremap <leader>cb :BCommits<CR>
nnoremap <leader>C :Colors<CR>
nnoremap <leader>sl :Lines<CR>
" nnoremap <leader>ag :Ag <C-R><C-W><CR>
nnoremap <leader>sr :Rg <CR>
nnoremap <leader>sw :Rg <C-R><C-W><CR>
nnoremap <leader>sh :History<CR>

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

if has("nvim")
  augroup nvim_term
    au!
    au TermOpen * startinsert
    au TermClose * stopinsert
  augroup END
endif

" Emmet
" let g:user_emmet_settings = {
" \  'javascript.jsx' : {
" \      'extends' : 'jsx',
" \  },
" \  'typescript.tsx' : {
" \      'extends' : 'jsx',
" \  },
" \}

augroup pscbindings
  autocmd! pscbindings
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
" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~# '\s'
" endfunction

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<CR>"
" inoremap <silent><expr> <cr> pumvisible() ? "\<CR>"
"       \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
  \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Map <tab> for trigger completion, completion confirm, snippet expand and jump like VSCode.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()


" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~# '\s'
" endfunction

" let g:coc_snippet_next = '<tab>'

nmap <silent> <c-k> <Plug>(coc-diagnostic-prev)
nmap <silent> <c-j> <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
" autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <C-P> <Plug>(coc-format-selected)
nmap <C-P> <Plug>(coc-format-selected)

augroup cocformat
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

nmap <C-p> <Plug>(coc-format)

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>aa  <Plug>(coc-codeaction-selected)
nmap <leader>aa  <Plug>(coc-codeaction-selected)
nmap <leader>aa  <Plug>(coc-codeaction)
nmap <leader>ac <Plug>(coc-codeaction-line)
nmap <leader>af  <Plug>(coc-fix-current)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" don't give |ins-completion-menu| messages.
set shortmess+=c

" Better display for messages
set cmdheight=2

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Show all diagnostics
nnoremap <silent> <space>di  :CocList diagnostics<cr>

" tsconfig.json is actually jsonc, help TypeScript set the correct filetype
autocmd BufRead,BufNewFile tsconfig.json set filetype=jsonc

" import-js
nnoremap <leader>if :ImportJSWord<CR>
nnoremap <Leader>ic :ImportJSFix<CR>
" nnoremap <Leader>ig :ImportJSGoto<CR>

" git
" navigate chunks of current buffer
nmap [g <Plug>(coc-git-prevchunk)
nmap ]g <Plug>(coc-git-nextchunk)
" show chunk diff at current position
nmap gs <Plug>(coc-git-chunkinfo)
" show commit contains current position
nmap gc <Plug>(coc-git-commit)
" create text object for git chunks
omap ig <Plug>(coc-git-chunk-inner)
xmap ig <Plug>(coc-git-chunk-inner)
omap ag <Plug>(coc-git-chunk-outer)
xmap ag <Plug>(coc-git-chunk-outer)
nmap <silent> <leader>cs :CocCommand git.chunkStage<CR>
nmap <silent> <leader>cu :CocCommand git.chunkUndo<CR>

" Dirvish helper
nmap <leader>mv y$:!mv %<C-R>" %

" Deno fmt
nmap <c-f>:!deno fmt

" PureScript bindings
imap <c-f> ∀

" Remove trailing whitespace
nnoremap <silent> <leader>wi :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>

" coc-sql format selection
xmap <leader>pf  <Plug>(coc-format-selected)
nmap <leader>pf  <Plug>(coc-format-selected)

" Vaffle
" nmap - :Vaffle %<CR>
" nmap , <Plug>(vaffle-toggle-current)
" xmap , <Plug>(vaffle-toggle-current)
