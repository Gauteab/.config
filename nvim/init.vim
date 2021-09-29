
" Plugins
call plug#begin('~/.vim/plugged')
    " Editing
    Plug 'jiangmiao/auto-pairs'
    Plug 'junegunn/vim-easy-align'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-surround'
    Plug 'unblevable/quick-scope'
    Plug 'kana/vim-textobj-entire'
    Plug 'mg979/vim-visual-multi'
    Plug 'michaeljsmith/vim-indent-object'
    Plug 'matze/vim-move'
    Plug 'wellle/targets.vim'

    " Navigation
    Plug 'easymotion/vim-easymotion'
    " Plug 'phaazon/hop.nvim'
    Plug 'preservim/nerdtree'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'

    " IDE
    Plug 'neoclide/coc.nvim', {'branch': 'release'} " LSP
    Plug 'w0rp/ale'
    Plug 'SirVer/ultisnips' " Snippet engine
    Plug 'honza/vim-snippets' " Snippet collection
    Plug 'sheerun/vim-polyglot' " Syntax Highlighting for many languages
    Plug 'vim-airline/vim-airline'
    Plug 'monkoose/fzf-hoogle.vim'
    Plug 'aquach/vim-http-client'

    " GIT
    Plug 'mhinz/vim-signify'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-rhubarb'
    Plug 'junegunn/gv.vim'

    " Misc
    Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
    Plug 'dkasak/gruvbox' " theme
    Plug 'chrisbra/Colorizer' " highlight color codes
    Plug 'christoomey/vim-run-interactive'
    Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }

    " Plug 'Gauteab/talon-fluent-nvim'
call plug#end()

" Set leader to space
let mapleader = " "

" Move lines
nnoremap √ :m .+1<CR>==
nnoremap ª :m .-2<CR>==
inoremap √ <Esc>:m .+1<CR>==gi
inoremap º <Esc>:m .-2<CR>==gi
vnoremap √ :m '>+1<CR>gv=gv
vnoremap º :m '<-2<CR>gv=gv 

map cd :cd 

" Spilling
nnoremap <C-f> z=
nnoremap <C-S> ]s
nnoremap <C-s> [s

" Git
nmap <leader>gs :G<CR>
nmap <leader>gp :G push<CR>
nmap <leader>gl :G pull<CR>
nmap <leader>gf :diffget //3<CR>
nmap <leader>gj :diffget //2<CR>

" Markdown Preview
let g:mkdp_auto_close = 0

" EasyAlign
nmap ga <Plug>(EasyAlign)

" Easy Motion
nmap <C-M> <Plug>(easymotion-overwin-w)
let g:EasyMotion_smartcase = 1

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
set clipboard=unnamed " vim and os use same clipboard
set inccommand=nosplit
" Theme
colo gruvbox
set background=dark
" Default indent set to 4
set tabstop=4 
set softtabstop=4
set shiftwidth=4
set expandtab
set nowrap
set number relativenumber

map <space>ee :e  $MYVIMRC<cr>
map <space>ev :vs  $MYVIMRC<cr>
map <space>es :sp  $MYVIMRC<cr>
map <space>so :w<cr> :source $MYVIMRC<cr> 

" Buffers
nmap <C-b> :bprev<cr>
map <C-B> :bnext<cr>
map <space>b :Buffers<cr>

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
map + <C-w>+
map - <C-w>-
nmap <C-x> :q<cr>

let g:python_host_prog = "/usr/bin/python2"
let g:python3_host_prog = "/usr/bin/python3"

nnoremap <F5> "=strftime("%Y-%m-%d")<CR>p
inoremap <F5> <ESC>"=strftime("%Y-%m-%d")<CR>p

nnoremap <space>ho :Hoogle<cr>

" Terminal
tnoremap <C-space> <C-\><C-n>
set shell=/bin/zsh
autocmd TermOpen * setlocal nonumber norelativenumber


set autoread

" == COC ==
command! -nargs=0 Prettier :CocCommand prettier.formatFile
nmap <leader>rn <Plug>(coc-rename)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> <leader>co :CocList --number-select outline<CR>
nmap <leader>cs :CocList --number-select -I symbols<CR>
nmap <leader>cl :CocList --number-select <CR>
nmap <leader>ch :call CocAction('doHover')<CR>
" nmap <leader>cf :call CocAction('format')<CR>
nmap <leader>cf :CocFix<CR>
nmap <leader>ca :CocAction<CR>
nmap <leader>cre :CocRestart<CR>
nmap <silent> <leader>ct <Plug>(coc-type-definition)
nmap <silent> <leader>ci  <Plug>(coc-implementation)
nmap <silent> <leader>cr <Plug>(coc-references)
nmap <silent> <leader>ce <Plug>(coc-codelens-action)
nmap <silent> <C-b> <Plug>(coc-diagnostic-prev)
nmap <silent> <C-B> <Plug>(coc-diagnostic-next)

" == ALE ==
function! FormatHaskell(buffer) abort
    return { 'command': 'fourmolu --indentation 2 --indent-wheres true' }
endfunction

execute ale#fix#registry#Add('fourmolu', 'FormatHaskell', ['haskell'], 'fourmolu for haskell')

let g:ale_linters_explicit = 1
let g:ale_fixers = { 
\  'purescript': ['purty'],
\  'haskell': ['fourmolu']
\}

let g:ale_enabled = 1
" let g:ale_linters = { 'haskell': ['hlint'] }
" let g:ale_fixers = {'haskell': ['hlint']}
" let g:ale_fixers = { 'purescript': ['purty'], 'haskell': ['hindent'], 'c': ['clang-format'], 'elm': ['elm-format'], 'python': ['autopep8'], 'java': ['google_java_format']}
let g:ale_java_google_java_format_options = '-i'
let g:ale_fix_on_save = 1
let g:ale_c_clangformat_options = '--style=WebKit'

map <space>at :ALEToggle<CR>
map <space>af :ALEFix<CR>
map <space>ap :ALEPrevious<CR>
map <space>an :ALENextWrap<CR>

augroup configgroup
    autocmd!
    " Highlight the symbol and its references when holding the cursor.
    autocmd CursorHold * silent call CocActionAsync('highlight')
    " autocmd CursorHold * silent call CocActionAsync('doHover')
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
map <space>f :Files!<CR>
map <space>rg :Rg!<CR>
let $FZF_DEFAULT_OPTS="--ansi --preview-window 'right:60%' --layout reverse --margin=1,4 --preview 'bat --color=always --style=header,grid --line-range :300 {}'"
let $FZF_DEFAULT_COMMAND = 'rg --files --ignore-case --hidden -g "!{.git,node_modules,vendor}/*"'
command! -bang -nargs=? -complete=dir Files
     \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

" === TALON ===
" source ~/.talon/user/talon-tree-sitter-service/talon.vimrc

" source ~/.talon/user/lsp/talon_lsp.vim

nnoremap <leader>n :w<CR>:UpdateRemotePlugins<CR>:q<CR>

command! -bang ProjectFiles call fzf#vim#files('~/code', <bang>0)
