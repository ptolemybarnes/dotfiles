set nocompatible              " be iMproved, required
filetype off                  " required

" Vim Plugged directory
call plug#begin('~/.vim/plugged')

" syntax highlighters
Plug 'digitaltoad/vim-pug'

Plug 'pangloss/vim-javascript'
" Plug 'maxmellon/vim-jsx-pretty'
Plug 'dense-analysis/ale'
Plug 'calebeby/ncm-css'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'thoughtbot/vim-rspec'
Plug 'ajh17/VimCompletesMe'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'junegunn/goyo.vim'

Plug 'derekwyatt/vim-scala'
Plug 'fatih/vim-go'
Plug 'romainl/vim-cool'

" surround commands
Plug 'tpope/vim-surround'

" vim wrapper
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'jlanzarotta/bufexplorer'
Plug 'bling/vim-bufferline'
Plug 'bling/vim-airline'

" clojure stuff
Plug 'tpope/vim-fireplace'
Plug 'guns/vim-clojure-static'
Plug 'kien/rainbow_parentheses.vim'

Plug 'hashivim/vim-terraform'

" rust stuff
Plug 'rust-lang/rust.vim'

" :Remove :Rename etc
Plug 'tpope/vim-eunuch'

" Remove buffer without closing split with :BD
Plug 'qpkorr/vim-bufkill'

" multiple cursors
Plug 'terryma/vim-multiple-cursors'

" color schemes
Plug 'tpope/vim-vividchalk'
Plug 'tomasr/molokai'
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'altercation/vim-colors-solarized'

Plug 'elixir-editors/vim-elixir'

Plug 'leafgarland/typescript-vim'

Plug 'kchmck/vim-coffee-script'

Plug 'martinda/Jenkinsfile-vim-syntax'
Plug 'dag/vim-fish'

Plug 'martinda/Jenkinsfile-vim-syntax'
" gutentags - takes care of ctags management
Plug 'ludovicchabant/vim-gutentags'

" auto-imports for javascript
" Plug 'kristijanhusak/vim-js-file-import'

call plug#end()

filetype plugin indent on
" required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
syntax on

set number
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set nocompatible
set modelines=0
set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set ttyfast
set ruler
set laststatus=2
set undodir=~/.vim/undo//
set noswapfile
set cursorline
set shell=/opt/homebrew/bin/fish
set autoread                    " Automatically read changed files
set incsearch                   " Shows the match while typing
set noerrorbells                " No beeps
set nobackup                    " Don't create annoying backup files
set ignorecase                  " Search case insensitive...
set smartcase
set lazyredraw                  " Wait to redraw
set autowrite                   " Automatically save before :next, :make etc.

" turns on search highlighting
set hls
" toggle highlighting off with C-l
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>

highlight CursorLine cterm=NONE ctermbg=236
"
" " Set color of number column on cursorline
highlight CursorLineNR ctermbg=236 ctermfg=white

"" arrows keys remapped to directionally switch windows in all modes
nnoremap <up> <C-W>k
nnoremap <down> <C-W>j
nnoremap <left> <C-W>h
nnoremap <right> <C-W>l

inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk
nnoremap <CR> :wa<CR>:!!<CR>

" GO START
"
" Jump to next error with Ctrl-n and previous error with Ctrl-m. Close the
" quickfix window with <leader>a
map <leader>n :cnext<CR>
map <leader>m :cprevious<CR>
nnoremap <leader>a :cclose<CR>

"" <leader>b builds the Go project
"" <leader>r runs the Go project
autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>r  <Plug>(go-run)
" GO END

" map tab to switch split
map <Tab> <C-W>w

"useful Esc remap
inoremap jj <ESC>

"Shift left/right take you to end of line
noremap H ^
noremap L $

"nerdtree shortcut config
map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
" leader-f finds the current file in nerd tree
map <leader>f :NERDTreeFind<cr>


"airline config
let g:airline#extensions#tabline#enabled = 1
let g:airline_left_sep=' '
let g:airline_right_sep=' '

"" ctrlp config. (ignore compiled js within dist)
nmap <C-p> :Files<CR>

" set relative line numbers
" set relativenumber

" sets up a find and replace for the currently highlighted word
vnoremap <C-r> "hy:%s/<C-r>h//g<left><left>

" sets up a search for the currently highlighted word: CTRL-F
vnoremap <C-f> "hy/<h

" " Multi cursor keymappings
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-a>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

" switching between buffers
nnoremap <SPACE> :bn<CR>
nnoremap <BS> :bp<CR>

" highlight of search results
hi Search cterm=NONE ctermfg=grey ctermbg=blue

" clears highlighting of search results - SEEMS TO BREAK THINGS ON FILE OPEN
" nnoremap <silent> <esc> :noh<cr><esc>

" ===== AUTOCOMPLETE ======
" maps tab to cycle through menu
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" ale sign gutter always displays
let g:ale_sign_column_always = 1
" let g:ale_lint_on_text_changed = 'never'
" runs :ALEFix on save
let g:ale_fix_on_save = 1

" keys should match against the 'Current Filetype' given on the file by :ALEInfo
let g:ale_fixers = {
\  '*': ['remove_trailing_lines', 'trim_whitespace'],
\  'javascript': [ 'eslint' ],
\  'javascriptreact': [ 'eslint' ],
\  'typescript': [ 'eslint', 'standard' ]
\}

" bufferline displays filename relative to current directory
let g:bufferline_fname_mod = ':.'

set t_vb=

let g:rspec_command = '!bundle exec rspec {spec}'
" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

vmap <Leader>c @*y

" reindent whole file in normal mode with +
nmap + mzgg=G`z

set backspace=indent,eol,start

autocmd BufRead *.clj try | silent! Require | catch /^Fireplace/ | endtry

colorscheme molokai

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" setting clipboard to nothing prevents deleted text being sent to clipboard.
" this behaviour was annoying because typically I want to delete some
" text then paste from the clipboard. The first action would replace the
" contents of the clipboard.
set clipboard=

set title
