set nocompatible            " disable compatibility to old-time vi
set completeopt=menuone,noinsert,noselect
set splitright
set splitbelow
set showmatch               " show matching brace / bracket
set ignorecase              " case insensitive
set hlsearch                " highlight search
set incsearch               " incremental search
set tabstop=2               " number of columns occupied by a tab
set softtabstop=2           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=2            " The shiftwidth value which describes the level of indentation is the number of whitespace columns
set nowritebackup
set cmdheight=1
set shortmess+=c
set signcolumn=yes
set updatetime=750
set smartcase               " search case-insensitive, except if I enter uppercase letters.
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add absolute line numbers
set wildmode=longest,list   " get bash-like tab completions
filetype plugin indent on   " allow auto-indenting depending on file type
let g:netrw_banner=0
syntax on                   " syntax highlighting
"
" setting clipboard to nothing prevents deleted text being sent to clipboard.
" this behaviour was annoying because typically I want to delete some
" text then paste from the clipboard. The first action would replace the
" contents of the clipboard.
set clipboard=

set cursorline              " highlight current cursorline
set ttyfast                 " Speed up scrolling in Vim
" set spell                 " enable spell check (may need to download language package)
set noswapfile              " disable creating swap file
"""""""""""""""SHORTCUTS"""""""""""
inoremap jj <ESC>

"Shift left/right take you to end of line - everyone should have this.
noremap H ^
noremap L $

" sets up a find and replace for the currently highlighted word
vnoremap <C-r> "hy:%s/<C-r>h//g<left><left>
" sets up a search for the currently highlighted word: CTRL-F
vnoremap <C-f> "hy/<h
" map tab to switch split
map <Tab> <C-W>w
" switching between buffers
nnoremap <SPACE> :bn<CR>
nnoremap <BS> :bp<CR>

" clear highlighted search result with CTRL+_
nnoremap <C-_> :noh<CR>

" '<leader>v' opens this file
nnoremap <leader>v :e $VIMRC<CR>

" return re-runs last command-line command
nnoremap <CR> :wa<CR>:!!<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""PLUGINS"""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

""""""""NERD-TREE""""""""""
Plug 'scrooloose/nerdtree'

map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
" leader-f finds the current file in nerd tree
map <leader>f :NERDTreeFind<cr>
"""""""""""""""""""""""""""


""""""neovim/nvim-lspconfig""""""
Plug 'neovim/nvim-lspconfig'
"""""""""""""""""""""""""""

""""""""lightline.vim"""""
Plug 'itchyny/lightline.vim'
"""""""""""""""""""""""""""

"""""""FZF.VIM"""""""""""""
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
nnoremap <silent> <C-p> :FZF<CR>
"""""""""""""""""""""""""""

"""""""COQ.NVIM"""""""""""
" this is what does the autocompletion stuff
Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
Plug 'ms-jpq/coq.thirdparty', {'branch': '3p'}
""""""""""""""""""""""""""

"""""BUF-EXPLORER"""""""""
" <Leader>bt opens buffer explorer
Plug 'jlanzarotta/bufexplorer'
"""""""""""""""""""""""""

""""""BUFKILL""""""""""""
" makes killing buffers easier
Plug 'qpkorr/vim-bufkill'
"""""""""""""""""""""""""

"""""vim-fish"""""""""""""
" makes fish shell files prettier
Plug 'dag/vim-fish'
""""""""""""""""""""""""""

"""""vim-eunuch"""""""""""
" Vim sugar for the UNIX shell commands
Plug 'tpope/vim-eunuch'
""""""""""""""""""""""""""

"""""vim-maximizer""""""""
" maximise current split with F3
Plug 'szw/vim-maximizer'
""""""""""""""""""""""""""

"""""""tokyonight colorscheme""""
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
"""""""""""""""""""""""""""""""""

""""""""nvim-treesitter""""""""""""""""
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
""""""""""""""""""""""""""""""""""""""""

"""""Plug 'David-Kunz/markid'"""""""""""
" highlights same-name identifiers with the same color.
Plug 'David-Kunz/markid'
""""""""""""""""""""""""""""""""""""""""

"""""javascript related plugins'"""""""""""
" Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'pangloss/vim-javascript'
""""""""""""""""""""""""""""""""""""""""

"""""git commands""""""""""""""""""""""""
Plug 'tpope/vim-fugitive'
""""""""""""""""""""""""""""""""""""""""

"""""""go stuff""""""""""""""""""""""""""
Plug 'fatih/vim-go'
""""""""""""""""""""""""""""""""""""""""

"""""""""""useful rspec commands""""""""
Plug 'thoughtbot/vim-rspec'

map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

let g:rspec_command = "!bundle exec rspec {spec}"
""""""""""""""""""""""""""""""""""""""""

call plug#end()

"""""""""""""""""colors""""""""""""""""""""""
colorscheme tokyonight-storm

let g:lightline = {'colorscheme': 'tokyonight'}

" sets up treesitter language support with required plugins (has to be oneline)
lua require'nvim-treesitter.configs'.setup{indent={enable=true},highlight={enable=true},ensure_installed = { "c", "lua", "vim", "help", "query" },markid = { enable = true }}

lua vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })
lua vim.keymap.set({"n", "v"}, "K", vim.lsp.buf.hover, { buffer = 0 })

" enables language support for javascript with quick-lint-js
" brew install quick-lint-js
lua require('lspconfig/quick_lint_js').setup {}

" enables language support for vue.js projects
" npm install -g vls
lua require'lspconfig'.vuels.setup{}

lua require'lspconfig'.ruby_ls.setup{init_options = { formatter = 'auto' }}

" go install golang.org/x/tools/gopls@latest
lua require'lspconfig'.gopls.setup{}

let g:coq_settings = { 'auto_start': v:true }
