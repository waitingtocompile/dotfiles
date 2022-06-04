" set up plug and add everything we need

call plug#begin()

Plug 'Mofiqul/dracula.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'ryanoasis/vim-devicons'

call plug#end()

" run out ts linting, highlighting and autofill configurations
" lua require("ts_util")

let GuiFont="DroidSansMono NF"


" autoread when a file is changed by an outside source
set autoread

" set our leader key. This is a surprise tool that will help us later
let mapleader = ","
let g:mapleader = ","

""""----____ USER INTERFACE ____----""""

" Enable wildmenu, our autocompletion list
set wildmenu
set wildignore=*.o,*~,*.pyc,*.exe,.git,.git/*

" show the ruler
set ruler

"make the command bar 2 lines tall
set cmdheight=1

" hide buffers when they are abandoned
set hid

" Make backspace behave more intuitaively
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case and be smarter with it when searching
set ignorecase
set smartcase

" Highlight our search results
set hlsearch

" enable incremental searching
set incsearch

" don't redraw mid macro
set lazyredraw

" enable regex (yes it's still called magic for some dumb reason
set magic

" show bracket partners and set their blink speed
set showmatch
set mat=2

" disable most sounds
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" when opening a new buffer, retain the old one
set hidden

" always show line numbers in the side bar
set number

" hide airline whitespace indicator
let g:airline#extensions#whitespace#enabled = 0

""""----____ COLOURS AND FONTS ____----""""

" enable proper syntax highlighting
syntax enable

"set our colours
colorscheme dracula
set background=dark


""""----____ INDENTATION SETTINGS ____----""""
" use spaces and smart tabs
set expandtab
set smarttab

" Set out tab stop to 4
set shiftwidth=4
set tabstop=4

" auto linebreak at 500 chars
set lbr
set tw=500

" smart intent and linewrap automatically
set ai
set si
set wrap

""""----____ NAVIGATION KEYS ____----""""

"Move between windows with ctrl + navkeys
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" tab navitation keys
map <silent> <leader>tn :tabnew<cr>
map <silent> <leader>to :tabonly<cr>
map <silent> <leader>tc :tabclose<cr>
map <silent> <leader>tm :tabmove
map <silent> <leader>t<leader> :tabnext<cr>

" allow returning to the previous tab
let g:lasttab=1
nmap <silent> <leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab=tabpagenr()

" split keys
map <leader>s<leader> :vsplit<cr>
map <leader>ss :split<cr>

"system copy and paste
map <leader>p "*p
map <leader>y "*y

"quick open init.vim
map <leader>rc :e $MYVIMRC<cr>

"quick toggle tree
map <leader>e :NvimTreeToggle<CR>

" clear search highlights
map <silent> <leader>/ :noh<cr>

""""----____ NVIM-TREE ____----""""
lua require("tree_setup")

""""----____ AUTOMATION ____----""""

" Reloads vimrc after saving but keep cursor position
if !exists('*ReloadVimrc')
   fun! ReloadVimrc()
       let save_cursor = getcurpos()
       source $MYVIMRC
       call setpos('.', save_cursor)
   endfun
endif
autocmd! BufWritePost $MYVIMRC call ReloadVimrc()

