
" Plugins
call plug#begin('~/.vim/plugged')
    " Editing
    Plug 'jiangmiao/auto-pairs'
    Plug 'junegunn/vim-easy-align'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-surround'
    Plug 'unblevable/quick-scope'
    " Plug 'kana/vim-textobj-entire'
    Plug 'tommcdo/vim-exchange'
    Plug 'mg979/vim-visual-multi'
    Plug 'michaeljsmith/vim-indent-object'
    Plug 'matze/vim-move'
    Plug 'wellle/targets.vim'

    " Navigation
    Plug 'phaazon/hop.nvim'
    Plug 'preservim/nerdtree'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
    Plug 'kyazdani42/nvim-tree.lua'

    " IDE
    " Plug 'neoclide/coc.nvim', {'branch': 'release'} " LSP
    " Plug 'fannheyward/telescope-coc.nvim'
    Plug 'neovim/nvim-lspconfig'
    Plug 'williamboman/nvim-lsp-installer'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
    Plug 'nvim-treesitter/playground'
    Plug 'nvim-treesitter/nvim-treesitter-textobjects'
    " post install (yarn install | npm install) then load plugin only for editing supported files
    Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production' }
    " Plug 'w0rp/ale'
    Plug 'SirVer/ultisnips' " Snippet engine
    Plug 'L3MON4D3/LuaSnip'
    Plug 'rafamadriz/friendly-snippets'
    Plug 'elianiva/telescope-npm.nvim'
    Plug 'saadparwaiz1/cmp_luasnip'
    Plug 'honza/vim-snippets' " Snippet collection
    Plug 'sheerun/vim-polyglot' " Syntax Highlighting for many languages
    " Plug 'vim-airline/vim-airline'
    Plug 'nvim-lualine/lualine.nvim'
    " Plug 'monkoose/fzf-hoogle.vim'
    " Plug 'aquach/vim-http-client'
    Plug 'neovim/nvim-lspconfig'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/cmp-cmdline'
    Plug 'hrsh7th/nvim-cmp'
    " GIT
    " Plug 'mhinz/vim-signify'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-rhubarb'
    " Plug 'junegunn/gv.vim'
    Plug 'TimUntersberger/neogit'
    Plug 'sindrets/diffview.nvim'
    Plug 'airblade/vim-gitgutter'

    " Misc
    Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
    Plug 'kyazdani42/nvim-web-devicons' " for file icons
    Plug 'dkasak/gruvbox' " theme
    Plug 'tanvirtin/monokai.nvim'
    Plug 'marko-cerovac/material.nvim'
    Plug 'sainnhe/gruvbox-material'
    Plug 'chrisbra/Colorizer' " highlight color codes
    Plug 'christoomey/vim-run-interactive'
    Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
    Plug 'nvim-lua/plenary.nvim'

    " Plug 'Gauteab/talon-fluent-nvim'
call plug#end()

lua package.loaded['init'] = nil
lua require("init")

" Set leader to space
let mapleader = " "

" save with ctrl-s
nnoremap <c-s> <cmd>w<cr>
inoremap <C-s> <esc><cmd>w<CR>
vnoremap <C-s> <esc><cmd>w<CR>

" Find files using Telescope command-line sugar.
nnoremap <space>f <cmd>Telescope find_files<cr>
nnoremap <leader><space> <cmd>Telescope commands<cr>
" nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>b <cmd>Telescope buffers<cr>
nnoremap <leader>s <cmd>Telescope current_buffer_fuzzy_find<cr>
" nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Move lines
nnoremap √ :m .+1<CR>==
nnoremap ª :m .-2<CR>==
inoremap √ <Esc>:m .+1<CR>==gi
inoremap º <Esc>:m .-2<CR>==gi
vnoremap √ :m '>+1<CR>gv=gv
vnoremap º :m '<-2<CR>gv=gv 

nmap <space>cd :cd 

" Spelling
nnoremap <C-f> z=
" nnoremap <C-S> ]s
" nnoremap <C-s> [s

" Git
nmap <leader>gg :G<CR>
nmap <leader>gd :DiffviewOpen<CR>
nmap <leader>dvc :DiffviewClose<CR>
nmap <leader>dvm :DiffviewOpen master<CR>
nmap <leader>gfh :DiffviewFileHistory<CR>
nmap <leader>gp :G push<CR>
nmap <leader>gl :G pull<CR>
nmap <leader>gj :diffget //3<CR>
nmap <leader>gf :diffget //2<CR>
nmap <leader>gfc <cmd>Telescope git_commits<cr>
nmap <leader>gb <cmd>Telescope git_branches<cr> 
nmap <leader>gs <cmd>Telescope git_status<cr>
nmap <leader>gts <cmd>G stash<cr>
nmap <leader>gtp <cmd>G stash pop<cr>
nmap <leader>ghp :GitGutterPreviewHunk<cr>
nmap <leader>ghu :GitGutterUndoHunk<cr>
nmap <leader>ghs :GitGutterStageHunk<cr>
nnoremap gh :GitGutterNextHunk<cr> 
nnoremap gH :GitGutterPrevHunk<cr> 
" nnoremap <C-b> :bNext<cr>
" nnoremap <C-B> :blast<cr>

nnoremap gd <cmd>Telescope lsp_definitions<cr>

" Markdown Preview
let g:mkdp_auto_close = 0

" EasyAlign
nmap ga <Plug>(EasyAlign)

nmap <space>j :HopWord<cr>
nmap <space>h :HopChar1<cr>
" Easy Motion
" nmap <C-M> <Plug>(easymotion-overwin-w)
" let g:EasyMotion_smartcase = 1

" Snippets
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"
nnoremap <leader>ue :UltiSnipsEdit<cr>

" Custom stuff
syntax on
filetype on
filetype plugin indent on
set ignorecase
set smartcase
set wildmenu
set hidden
set incsearch
set backspace=indent,eol,start
set noswapfile " Disbale auto backup
set scrolloff=8 " Scroll offset
set mouse=a " Make the mouse work
set clipboard=unnamedplus " vim and os use same clipboard
set inccommand=nosplit
" Theme
" colo gruvbox
let g:gruvbox_material_background = 'hard'
" colo gruvbox-material
let g:material_style = 'darker'
colo material
hi LineNr guifg=#cccccc
" set background=dark
" Default indent set to 4
set tabstop=4 
set softtabstop=4
set shiftwidth=4
set expandtab
set nowrap
set number relativenumber

map <space>ee :e  $MYVIMRC<cr>
map <space>el :e  $CONFIG/nvim/lua/init.lua<cr>
map <space>ev :vs  $MYVIMRC<cr>
map <space>es :sp  $MYVIMRC<cr>
map <space>so :w<cr> :source $MYVIMRC<cr> 

" Buffers
nnoremap <C-b> :bprev<cr>
nnoremap <C-B> :bnext<cr>

" Windows
map <space>vs :vs<cr>
map <space>sp :sp<cr>
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <leader><C-j> <C-w>J
nnoremap <leader><C-k> <C-w>K
nnoremap <leader><C-h> <C-w>H
nnoremap <leader><C-l> <C-w>L
nnoremap + <C-w>+
nnoremap - <C-w>-
noremap <c-q> :q<cr>

let g:python_host_prog = "/usr/bin/python2"
let g:python3_host_prog = "/usr/bin/python3"

nnoremap <F5> "=strftime("%Y-%m-%d")<CR>p
inoremap <F5> <ESC>"=strftime("%Y-%m-%d")<CR>p

" Terminal
nnoremap <space>te :term<cr>
tnoremap <C-space> <C-\><C-n>
tnoremap <C-h> <C-space><C-h>
set shell=/bin/zsh
autocmd TermOpen * setlocal nonumber norelativenumber


set autoread

" " == COC ==
" command! -nargs=0 Prettier :CocCommand prettier.formatFile
" nmap <leader>rn <Plug>(coc-rename)
" " nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> <leader>co :CocList --number-select outline<CR>
" nmap <leader>cs :CocList --number-select -I symbols<CR>
" nmap <leader>cl :CocList --number-select <CR>
" nmap <leader>ch :call CocAction('doHover')<CR>
" " nmap <leader>cf :call CocAction('format')<CR>
" nmap <leader>cf :CocFix<CR>
" nmap <leader>ca :CocAction<CR>
" nmap <leader>cre :CocRestart<CR>
" nmap <silent> <leader>ct <Plug>(coc-type-definition)
" nmap <silent> <leader>ci  <Plug>(coc-implementation)
" nmap <silent> <leader>cr <Plug>(coc-references)
" nmap <silent> <leader>ce <Plug>(coc-codelens-action)
" nmap <silent> <C-b> <Plug>(coc-diagnostic-prev)
" nmap <silent> <C-B> <Plug>(coc-diagnostic-next)

" == ALE ==
function! FormatHaskell(buffer) abort
    return { 'command': 'fourmolu --indentation 2 --indent-wheres true' }
endfunction

" silent execute ale#fix#registry#Add('fourmolu', 'FormatHaskell', ['haskell'], 'fourmolu for haskell')

let g:ale_linters_explicit = 1
let g:ale_fixers = { 
\  'purescript': ['purty'],
\  'haskell': ['fourmolu']
\}

let g:ale_enabled = 0
" let g:ale_linters = { 'haskell': ['hlint'] }
" let g:ale_fixers = {'haskell': ['hlint']}
" let g:ale_fixers = { 'purescript': ['purty'], 'haskell': ['hindent'], 'c': ['clang-format'], 'elm': ['elm-format'], 'python': ['autopep8'], 'java': ['google_java_format']}
let g:ale_java_google_java_format_options = '-i'
let g:ale_fix_on_save = 1
let g:ale_c_clangformat_options = '--style=WebKit'

" map <space>at :ALEToggle<CR>
" map <space>af :ALEFix<CR>
" map <space>ap :ALEPrevious<CR>
" map <space>an :ALENextWrap<CR>

" Make title readable by talon
let &titlestring ='VIM MODE:%{mode()} RPC:%{v:servername} - (%f) %t'
set title

augroup configgroup
    autocmd!
    " Highlight the symbol and its references when holding the cursor.
    " autocmd CursorHold * silent call CocActionAsync('highlight')
    " autocmd CursorHold * silent call CocActionAsync('doHover')
    " autocmd BufEnter * call TalonSetTitle()
    autocmd BufEnter *.pl setlocal filetype=prolog
    autocmd BufEnter *.talon setlocal filetype=conf
    autocmd BufEnter *.tex setlocal filetype=tex
    autocmd BufEnter *.talon setlocal commentstring=#\ %s
    autocmd BufEnter *.purs setlocal commentstring=--\ %s
    autocmd BufEnter *.bib setlocal commentstring=%\ %s
    autocmd BufEnter *.purs,*.hs,*.ts,*.tsx,*.js* setlocal tabstop=2
    autocmd BufEnter *.purs,*.hs,*.ts,*.ts*,*.js* setlocal shiftwidth=2
    autocmd BufEnter *.purs,*.hs,*.ts,*.ts*,*.js* setlocal softtabstop=2
    autocmd BufEnter *.elm nnoremap <buffer> <leader>ta 0ywkpA: 
    autocmd BufEnter *.elm set ft=elm
    autocmd BufEnter *.hs,*.purs nnoremap <buffer> <leader>ta 0ywkpA:: 
    " autocmd BufWritePost *.hs silent call Fourmolu()
augroup END

augroup runable
    autocmd FileType python map <F9> :w<CR>:!python3 %<CR>
    autocmd FileType elm map <F9> :w<CR>:!elm-run %<CR>
    autocmd FileType haskell map <F9> :w<CR>:!runhaskell %<CR>
    autocmd FileType haskell map <F10> :w<CR>:!stack %<CR>
    autocmd FileType purescript map <F9> :w<CR>:!spago run<CR>
    autocmd FileType tex map <F9> :w<CR>:!pdflatex %<CR>
    autocmd FileType teraterm map <F9> :w<CR>:!ttl %<CR>
    autocmd FileType markdown map <F9> :w<CR>:!pandoc % -o %:r.pdf<CR>
    autocmd FileType bash,sh map <F9> :w<CR>:!./%<CR>
    autocmd FileType typescript map <F9> :w<CR>:!ts-node %<CR>
    autocmd FileType typescript map <F10> :w<CR>:!tsc -p src<CR>
    autocmd FileType javascript map <F9> :w<CR>:!node %<CR>
augroup END

" Make searching nicer
augroup vimrc-incsearch-highlight
  autocmd!
  autocmd CmdlineEnter /,\? :set hlsearch
  autocmd CmdlineLeave /,\? :set nohlsearch
augroup END

" === FZF ===
" map <space>f :Files!<CR>
map <space>rg :Rg!<CR>
map <space>b :Buffers<cr>
let $FZF_DEFAULT_OPTS="--ansi --preview-window 'right:60%' --layout reverse --margin=1,4 --preview 'bat --color=always --style=header,grid --line-range :300 {}'"
let $FZF_DEFAULT_COMMAND = 'rg --files --ignore-case --hidden -g "!{.git,node_modules,vendor}/*"'
command! -bang -nargs=? -complete=dir Files
     \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

" === TALON ===
" source ~/.talon/user/talon-tree-sitter-service/talon.vimrc

" source ~/.talon/user/lsp/talon_lsp.vim

" nnoremap <leader>n :w<CR>:UpdateRemotePlugins<CR>:q<CR>

command! -bang ProjectFiles call fzf#vim#files('~/code', <bang>0)

function! Leap(target, before, after)
    exec "normal ml"
    exec "Hop" . a:target
    exec "normal  " . a:before
    exec "normal `l" . a:after
endfunction 

" hi DiffAdd      cterm=none ctermfg=142          ctermbg=none
" hi DiffChange   cterm=italic ctermfg=none          ctermbg=NONE
" hi DiffDelete   cterm=none ctermfg=none      ctermbg=NONE
" hi DiffText     cterm=none ctermfg=120        ctermbg=black
" map § `
" nmap ß :let snipeid=win_getid()<cr>
" nmap ∂ :call win_gotoid(snipeid)<cr>
set termguicolors

augroup init_colors
    au!
    au ColorScheme * call SaneDiffDefaults()
augroup END

" A lot of vim colorschemes provide some wild defaults for diff colors. This
" function sets the diff colors to some more sane defaults that at least looks
" quite pleasant in most colorschemes.
function! SaneDiffDefaults()
    hi! DiffAdd    guibg=#26332c guifg=NONE gui=NONE
    hi! DiffChange guibg=#273842 guifg=NONE gui=NONE
    hi! DiffDelete guibg=#572E33 guifg=NONE gui=NONE
    hi! DiffText   guibg=#314753 guifg=NONE gui=NONE
    " hi! link       diffAdded     DiffAdd
    " hi! link       diffChanged   DiffChange
    " hi! link       diffRemoved   DiffDelete
    " hi! link       diffBDiffer   WarningMsg
    " hi! link       diffCommon    WarningMsg
    " hi! link       diffDiffer    WarningMsg
    " hi! link       diffFile      Directory
    " hi! link       diffIdentical WarningMsg
    " hi! link       diffIndexLine Number
    " hi! link       diffIsA       WarningMsg
    " hi! link       diffNoEOL     WarningMsg
    " hi! link       diffOnly      WarningMsg
endfunction 
" hi! NonText gui=nocombine

call SaneDiffDefaults()

" set foldmethod=expr
" set foldexpr=nvim_treesitter#foldexpr()
" nnoremap gfc <cmd>foldclose<cr>
" nnoremap gfo <cmd>foldopen<cr>

let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0

augroup Formatting
    autocmd!
    autocmd BufWritePre *.elm,*.lua lua vim.lsp.buf.formatting_sync()
    autocmd BufWritePost */komponentkassen/packages/elm/**/*.elm silent :!touch '/Users/gaute/svv/komponentkassen/apps/elm-storybook/src/Main.elm'
augroup end 



nnoremap gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <C-i> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <space>wa <cmd>lua vim.lsp.buf.add_workspace_folder()<CR>
nnoremap <space>wr <cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>
nnoremap <space>wl <cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>
nnoremap <space>D <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <space>rn <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <space>ca <cmd>Telescope lsp_code_actions<cr>
nnoremap gr <cmd>Telescope lsp_references<CR>
nnoremap <space>e <cmd>lua vim.diagnostic.open_float()<CR>
nnoremap gE <cmd>lua vim.diagnostic.goto_prev()<CR>
nnoremap ge <cmd>lua vim.diagnostic.goto_next()<CR>
