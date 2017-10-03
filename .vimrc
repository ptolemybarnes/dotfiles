set nocompatible              " be iMproved, required
filetype off                  " required

" Vim Plugged directory
call plug#begin('~/.vim/plugged')

Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'roxma/nvim-completion-manager'
Plug 'roxma/nvim-cm-tern',  {'do': 'npm install'}
Plug 'leafgarland/typescript-vim'
Plug 'w0rp/ale'
Plug 'calebeby/ncm-css'

call plug#end()

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" vim wrapper
Plugin 'tpope/vim-fugitive'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'bling/vim-bufferline'
Plugin 'bling/vim-airline'
Plugin 'leafgarland/typescript-vim'
Plugin 'Quramy/tsuquyomi'
Plugin 'Shougo/vimproc.vim'

" :Remove :Rename etc
Plugin 'tpope/vim-eunuch'

" Remove buffer without closing split with :BD
Plugin 'qpkorr/vim-bufkill'

" multiple cursors
Plugin 'terryma/vim-multiple-cursors'

" color schemes
Plugin 'tpope/vim-vividchalk'
Plugin 'tomasr/molokai'
Plugin 'chriskempson/vim-tomorrow-theme'
Plugin 'altercation/vim-colors-solarized'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
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

" set path for .swp files
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

set cursorline
highlight CursorLine cterm=NONE ctermbg=236
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

"" 
:au FocusLost * :wa

set nocompatible      " We're running Vim, not Vi!

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

"airline config
let g:airline#extensions#tabline#enabled = 1
let g:airline_left_sep=' '
let g:airline_right_sep=' '

"" ctrlp config. (ignore compiled js within dist)
let g:ctrlp_custom_ignore = 'node_modules\|bower_components\|dist\|coverage\|temp\/'
:set ignorecase

"" save on lost focus
:au FocusLost * silent! wa

" set relative line numbers
set relativenumber

" CTRL-S saves the current file
map <C-s> :w<CR>

" sets up a find and replace for the currently highlighted word
vnoremap <C-r> "hy:%s/<C-r>h//g<left><left>

" sets up a search for the currently highlighted word: CTRL-F
vnoremap <C-f> "hy/<h

" SYNTASTIC SETTINGS see syntastic-global-options under :help syntastic
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exe = '$(npm bin)/eslint'
" don't check when saving on exit
let g:syntastic_check_on_wq = 0
" stop on first error
let g:syntastic_aggregate_errors = 0
" enables signs
let g:syntastic_enable_signs = 1

" Multi cursor keymappings
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-a>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

" switching between buffers
nnoremap <SPACE> :bn<CR>
nnoremap <BS> :bp<CR>

" run tests
nnoremap <leader>s :!yarn test<Enter>
nnoremap <leader>sa :!yarn acceptance<Enter>

" highlight of search results
hi Search cterm=NONE ctermfg=grey ctermbg=blue

" clears highlighting of search results
nnoremap <silent> <esc> :noh<cr><esc>

" ===== TERMINAL MODE ======
" escape kills the buffer
tnoremap jj <C-\><C-n>

" ===== AUTOCOMPLETE ======
" maps tab to cycle through menu
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" ale sign gutter always displays
let g:ale_sign_column_always = 1

" bufferline displays filename relative to current directory
let g:bufferline_fname_mod = ':.'

" sets eslint as default fixer for javascript files
let g:ale_fixers = {
\   'javascript': ['eslint'],
\}

" runs :ALEFix on save
let g:ale_fix_on_save = 1
