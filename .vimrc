" vi-compatible
set nocompatible
" required for vundle
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" --------------------------------------------------
" list of plugins from github
" --------------------------------------------------
"
Bundle 'gmarik/vundle'
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'tpope/vim-rails'
Bundle 'kchmck/vim-coffee-script'

Bundle 'altercation/vim-colors-solarized'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-eunuch'
Bundle 'jtratner/vim-flavored-markdown'
Bundle 'topfunky/PeepOpen-EditorSupport', {'rtp': 'vim-peepopen'}
Bundle 'xolox/vim-session'
Bundle 'xolox/vim-misc'
Bundle 'vim-scripts/ZoomWin'
Bundle 'corntrace/bufexplorer'
Bundle 'kien/ctrlp.vim'
Bundle 'Raimondi/delimitMate'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'ervandew/supertab'
Bundle 'scrooloose/syntastic'
Bundle 'godlygeek/tabular'
Bundle 'mbbill/undotree'

Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-haml'
Bundle "pangloss/vim-javascript"

filetype plugin indent on     " required!

" ----------------------------------------------------
" # set options
" ----------------------------------------------------
"
set history=1000
set hlsearch
set incsearch
set ignorecase
set smartcase
set number
set linebreak wrap nolist
set showbreak=↪
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent
set linespace=1
set laststatus=2
set encoding=utf-8
set shiftround
set tabstop=2
set expandtab
set showcmd
set mouse=a
set wildmode=longest,full
set wildmenu
set tabpagemax=15
set novisualbell
set noautochdir

" remove scrolls and everythink
set guioptions-=L
set guioptions-=R
set guioptions-=r
set guioptions-=m
set guioptions-=T"

scriptencoding utf-8

syntax on

" font
set gfn=Menlo\ for\ Powerline:h12

" solarized colorscheme
set background=light
let g:solarized_visibility = 'high'
let g:solarized_contrast = 'high'
colorscheme solarized

" Disable beep and flash with vim
set noeb vb t_vb=

set backspace=2 " make backspace work like most other apps

"" for autosave
set hidden
set nobackup
set noswapfile
set nowritebackup
set autoread
set noshowmode"

" ctrlp
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = '\v[\/]\.(git)$'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_extensions = ['dir', 'mixed']"

nmap <Leader>w :CtrlP ~/dev/
let g:vundle_default_git_proto = 'git'

" vim-sessions
let g:session_default_to_last = 1
let g:session_autosave = 'yes'
let g:session_autoload = 'yes'
let g:session_autosave_periodic = 1
let g:session_default_name = 'default'
let g:session_command_aliases = 1"

" indentLine
let g:indentLine_char = '⦙'
let g:indentLine_color_gui = '#4e4e4e'
let g:indentLine_showFirstIndentLevel = 0
let g:indentLine_indentLevel = 4

" store undo history
set undofile
set undodir=~/.vim/undo
set undolevels=1000
set undoreload=10000

" ----------------------------------------------------
" # some functions
" ----------------------------------------------------
" Highlight current line in insert mode
au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
au WinLeave * setlocal nocursorline

" few colors
hi! WildMenu guibg=IndianRed
hi! CursorLineNr guibg=#073642 guisp=#eee8d5 guifg=NONE

if has("gui_macvim")
  " grow to maximum horizontal width on entering fullscreen mode
  set fuopt+=maxhorz
  " free up Command-F
  macmenu &Edit.Find.Find\.\.\. key=<nop>
  " toggle fullscreen mode
  map <D-F> :set invfu<CR>
endif

" Restore cursor position to where it was before
augroup JumpCursorOnEdit
   au!
   autocmd BufReadPost *
            \ if expand("<afile>:p:h") !=? $TEMP |
            \   if line("'\"") > 1 && line("'\"") <= line("$") |
            \     let JumpCursorOnEdit_foo = line("'\"") |
            \     let b:doopenfold = 1 |
            \     if (foldlevel(JumpCursorOnEdit_foo) > foldlevel(JumpCursorOnEdit_foo - 1)) |
            \        let JumpCursorOnEdit_foo = JumpCursorOnEdit_foo - 1 |
            \        let b:doopenfold = 2 |
            \     endif |
            \     exe JumpCursorOnEdit_foo |
            \   endif |
            \ endif
   " Need to postpone using "zv" until after reading the modelines.
   autocmd BufWinEnter *
            \ if exists("b:doopenfold") |
            \   exe "normal zv" |
            \   if(b:doopenfold > 1) |
            \       exe  "+".1 |
            \   endif |
            \   unlet b:doopenfold |
            \ endif
augroup END




" ----------------------------------------------------
" # keys mapping
" ----------------------------------------------------
"

" create splits
nmap <D-d> :vsplit<CR>
nmap <D-D> :split<CR>

" navigate with splits
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

" zoom current split
nmap <D-O> <c-w>o

" resize split
map <D-J> :resize +2<cr>
map <D-H> :vertical resize -2<cr>
map <D-L> :vertical resize +2<cr>
map <D-K> :resize -2<cr>

" quick .vimrc edit
nmap <Leader>vim :e ~/.vimrc<cr>

" open project tree
silent! nmap <silent> <Leader>t :NERDTreeToggle<CR>

" clear whitespaces
silent! nmap <silent> <Leader>o :call TrimWhiteSpace()<CR>

" clear search
nmap <Leader>? :nohlsearch<CR>

" reload this config
nmap <Leader>reload :so $MYVIMRC<CR>

" open tabs
nmap <D-1> 1gt
nmap <D-2> 2gt
nmap <D-3> 3gt
nmap <D-4> 4gt
nmap <D-5> 5gt
nmap <D-6> 6gt
nmap <D-7> 7gt
nmap <D-8> 8gt
nmap <D-9> 9gt

" move blocks in visual
vmap <C-h> <gv
vmap <C-l> >gv
vmap <C-j> :m'>+<CR>gv=`<my`>mzgv`yo`z
vmap <C-k> :m'<-2<CR>gv=`>my`<mzgv`yo`z

" quick-switch to colorscheme - dark or light
nmap <Leader>dark :set background=dark<cr>
nmap <Leader>light :set background=light<cr>

" quick-switch with sessions
nmap <Leader>s :SaveSession!<cr>:OpenSession!<Space>

" open undo/redo history split
nmap <Leader>h :UndotreeToggle<cr>

" sys short aliases for some commands
cnoreabbrev <expr> Q ((getcmdtype() is# ':' && getcmdline() is# 'Q')?('w'):('Q'))
cnoreabbrev <expr> W ((getcmdtype() is# ':' && getcmdline() is# 'W')?('w'):('W'))
cnoreabbrev <expr> E ((getcmdtype() is# ':' && getcmdline() is# 'E')?('e'):('E'))
cnoreabbrev <expr> rm ((getcmdtype() is# ':' && getcmdline() is# 'rm')?('Remove'):('rm'))
cnoreabbrev <expr> rm! ((getcmdtype() is# ':' && getcmdline() is# 'rm!')?('Remove!'):('rm!'))
cnoreabbrev <expr> mv ((getcmdtype() is# ':' && getcmdline() is# 'mv')?('Move'):('mv'))
cnoreabbrev <expr> wsudo ((getcmdtype() is# ':' && getcmdline() is# 'wsudo')?('SudoWrite'):('wsudo'))
