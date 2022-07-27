" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

" General
" Plug 'tpope/vim-sensible'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-commentary'
" Plug 'mg979/vim-visual-multi', {'branch': 'test'}
Plug 'tpope/vim-obsession'
Plug 'lukas-reineke/indent-blankline.nvim'

" Focus
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

" Explore
" Plug 'justinmk/vim-dirvish'
Plug 'cocopon/vaffle.vim'
" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Plug 'junegunn/fzf.vim'
Plug 'ibhagwan/fzf-lua', {'branch': 'main'}

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
Plug 'rodrigore/coc-tailwind-intellisense', {'do': 'npm install'}

" TypeScript
Plug 'leafgarland/typescript-vim'
" Plug 'HerringtonDarkholme/yats.vim'

" JSX comments
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'JoosepAlviste/nvim-ts-context-commentstring', {'branch': 'main'}

" JSON
" Plug 'elzr/vim-json'
" Plug 'neoclide/jsonc.vim'

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

" Helpful ({[ pair insertion
" Plug 'jiangmiao/auto-pairs'

" Postgres
Plug 'lifepillar/pgsql.vim'

" Ethereum
Plug 'tomlion/vim-solidity'

" Rust
" Plug 'cespare/vim-toml'

" Svelte
" Plug 'evanleck/vim-svelte', {'branch': 'main'}

" Notes
" Plug 'vimwiki/vimwiki'
Plug 'lervag/wiki.vim'
Plug 'lervag/wiki-ft.vim'

" React
Plug 'mattn/emmet-vim'

" CSV
Plug 'chrisbra/csv.vim'

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
let g:airline_theme='base16'

" Tab settings
set tabstop=2 shiftwidth=2 expandtab
set listchars=tab:»·,trail:·
set list

let mapleader=" "

" Edit this file.. again
nnoremap <leader>ve :e ~/.vimrc<CR>

" Quick save
nnoremap <silent> <c-s> :write<CR>

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
nnoremap <silent> <C-l> :bd<CR>
nnoremap <silent> <C-b> :e#<CR>

" Append comma
nnoremap <silent> <leader>a, msA,<esc>`s

" Fzf
" command! -bang -nargs=? -complete=dir Files
"     \ call fzf#vim#files(<q-args>, <bang>0)

" fzf.vim
" nnoremap <leader>h :Files<CR>
" nnoremap <leader>t :Buffers<CR>
" nnoremap <leader>n :GFiles<CR>
" nnoremap <leader>u :GFiles?<CR>
" nnoremap <leader>cc :Commits<CR>
" nnoremap <leader>cb :BCommits<CR>
" nnoremap <leader>C :Colors<CR>
" nnoremap <leader>sl :Lines<CR>
" " nnoremap <leader>ag :Ag <C-R><C-W><CR>
" nnoremap <leader>sr :Rg <CR>
" nnoremap <leader>sw :Rg <C-R><C-W><CR>
" nnoremap <leader>sh :History<CR>

" fzf-lua
nnoremap <leader>ff :FzfLua <CR>
nnoremap <leader>h :FzfLua files<CR>
nnoremap <leader>t :FzfLua buffers<CR>
nnoremap <leader>n :FzfLua git_files<CR>
nnoremap <leader>u :FzfLua git_status<CR>
nnoremap <leader>b :FzfLua git_bcommits<CR>
nnoremap <leader>sr :FzfLua live_grep_glob<CR>
nnoremap <leader>sw :FzfLua grep_cword<CR>

" Fugitive
nnoremap <leader>gs :Git<CR>
nnoremap <leader>gr :Git read<CR>
nnoremap <leader>gw :Git write<CR>
nnoremap <leader>gb :Git blame<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gc :Git commit<CR>
nnoremap <leader>ge :Gedit<CR>
nnoremap <leader>dg :diffget<CR>
nnoremap <leader>dp :diffput<CR>
nnoremap <leader>gl :Gclog<CR>
nnoremap <silent> <leader>gp :silent Git push<CR>

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

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~# '\s'
" endfunction

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

inoremap <silent><expr> <cr> "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

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

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

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
xmap <leader>aa <Plug>(coc-codeaction-selected)
nmap <leader>aa <Plug>(coc-codeaction-selected)
nmap <leader>aa <Plug>(coc-codeaction)
nmap <leader>ac <Plug>(coc-codeaction-line)
nmap <leader>af <Plug>(coc-fix-current)
nmap <leader>al <Plug>(coc-codelens-action)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call CocAction('fold', <f-args>)

" don't give |ins-completion-menu| messages.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
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

" TypeScript organize imports
nnoremap <leader>oi :CocCommand tsserver.organizeImports<CR>

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
" navigate conflicts of current buffer
nmap [c <Plug>(coc-git-prevconflict)
nmap ]c <Plug>(coc-git-nextconflict)
" show chunk diff at current position
nmap gs <Plug>(coc-git-chunkinfo)
" show commit contains current position
" nmap gsc <Plug>(coc-git-commit)
" create text object for git chunks
omap ig <Plug>(coc-git-chunk-inner)
xmap ig <Plug>(coc-git-chunk-inner)
omap ag <Plug>(coc-git-chunk-outer)
xmap ag <Plug>(coc-git-chunk-outer)
nmap <silent> <leader>cs :CocCommand git.chunkStage<CR>
nmap <silent> <leader>cu :CocCommand git.chunkUndo<CR>

" scroll floating window
nnoremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"

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

" Remap <C-f> and <C-b> for scroll float windows/popups.
" if has('nvim-0.4.0') || has('patch-8.2.0750')
"   nnoremap <silent><nowait><expr> <C-t> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-t>"
"   nnoremap <silent><nowait><expr> <C-n> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-n>"
"   inoremap <silent><nowait><expr> <C-n> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
"   inoremap <silent><nowait><expr> <C-n> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
"   vnoremap <silent><nowait><expr> <C-t> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-t>"
"   vnoremap <silent><nowait><expr> <C-t> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-n>"
" endif

" Vaffle
" nmap - :Vaffle %<CR>
" Open the parent directory, or the current directory if empty
nnoremap <silent> - :<C-u>call vaffle#init(expand('%'))<CR>
nmap <leader>se <Plug>(vaffle-toggle-current)
xmap <leader>se <Plug>(vaffle-toggle-current)

" Postgres
let g:sql_type_default = 'pgsql'

" Notes
" let g:vimwiki_list = [{'path': '~/wiki/'}]
" let g:vimwiki_key_mappings = {
"     \ 'headers': 0
"     \ }
let g:wiki_root = '~/knowledge'
let g:wiki_journal = {
    \ 'name': 'journal',
    \ 'frequency': 'weekly',
    \ 'date_format': {
    \   'daily' : '%Y-%m-%d',
    \   'weekly' : '%Y_w%V',
    \   'monthly' : '%Y_m%m',
    \ },
    \}
au BufWinEnter * set wrap linebreak

" JavaScript arrow shorthand macro
nmap <leader>sht dwb<Plug>CSurround{(<CR>%$x
nmap <leader>shf <Plug>YSurround%{jireturn<ESC>

" treesitter setup
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = {'bash','commonlisp','css','dockerfile','go','graphql','haskell','html','javascript','jsdoc','json','lua','markdown','python','rust','scss','solidity','toml','typescript','vim','yaml'}, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ignore_install = {}, -- List of parsers to ignore installing
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = {"vim"},  -- list of language that will be disabled
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
  context_commentstring = {
    enable = true
  }
}
EOF

" Coc plugins
let g:coc_global_extensions = [
  \ 'coc-tsserver',
  \ 'coc-snippets',
  \ 'coc-prettier',
  \ 'coc-pairs',
  \ 'coc-lists',
  \ 'coc-html',
  \ 'coc-highlight',
  \ 'coc-git',
  \ 'coc-emoji',
  \ 'coc-deno',
  \ 'coc-yaml',
  \ 'coc-svelte',
  \ 'coc-rust-analyzer',
  \ 'coc-json',
  \ 'coc-docker',
  \ 'coc-css'
  \ ]

lua <<EOF
vim.g.indent_blankline_char = "│"
vim.g.indent_blankline_show_first_indent_level = true
vim.g.indent_blankline_filetype_exclude = {
    "startify", "dashboard", "dotooagenda", "log", "fugitive", "gitcommit",
    "packer", "vimwiki", "markdown", "json", "txt", "vista", "help",
    "todoist", "NvimTree", "peekaboo", "git", "TelescopePrompt", "undotree",
    "flutterToolsOutline", "" -- for all buffers without a file type
}
vim.g.indent_blankline_buftype_exclude = {"terminal", "nofile"}
vim.g.indent_blankline_show_trailing_blankline_indent = false
vim.g.indent_blankline_show_current_context = true
vim.g.indent_blankline_context_patterns = {
    "class", "function", "method", "block", "list_literal", "selector",
    "^if", "^table", "if_statement", "while", "for"
}
-- because lazy load indent-blankline so need readd this autocmd
-- vim.cmd('autocmd CursorMoved * IndentBlanklineRefresh')

EOF

highlight IndentBlanklineChar ctermfg=18 cterm=nocombine
highlight IndentBlanklineContextChar ctermfg=8 cterm=nocombine

" Coc highlight
highlight FgCocErrorFloatBgCocFloating ctermfg=9 guifg=#ff0000

" Turn on spell checking while writting commits
autocmd FileType gitcommit setlocal spell
