" set up plug and add everything we need

call plug#begin('~/AppData/Local/nvim/plugged')

Plug 'Mofiqul/dracula.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'jose-elias-alvarez/nvim-lsp-ts-utils'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'ryanoasis/vim-devicons'

call plug#end()

" run out ts linting, highlighting and autofill configurations
lua require("ts_util")

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
let g:nvim_tree_indent_markers = 1
lua require("tree_setup")

""""----____ COC AUTOCOMPLETE ____----""""

let g:coc_global_extension = ['coc-tsserver', 'coc-eslint']

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
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
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> <leader>[ <Plug>(coc-diagnostic-prev)
nmap <silent> <leader>] <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)

      " hite airline whitespace indicator
      let g:airline#extensions#whitespace#enabled = 0
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end




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

