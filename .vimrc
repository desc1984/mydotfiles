""""""""""""""""""""""""""""""""""
" Desc1984's vimrc
"
" Version
"   1.3
" Update Time
"   2012.10.27
"
" Wish you have a good vim tour!
""""""""""""""""""""""""""""""""""

"""""""""""""
"  General  "
"""""""""""""
" Show numbers
set nu
set nocompatible

" Show messagebox when need confirm
set confirm

filetype off
" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

"When .vimrc is edited, reload it
autocmd! bufwritepost .vimrc source ~/.vimrc 

" Turn backup off
set nobackup
set nowb
set noswapfile

" Set autopath
autocmd! BufWinEnter *    lcd %:p:h

"Set mapleader
let mapleader = ","

"Fast reloading of the .vimrc
map <silent> <leader>ss :source ~/.vimrc<cr>
"Fast editing of .vimrc
map <silent> <leader>ee :e ~/.vimrc<cr>
"When .vimrc is edited, reload it
autocmd! bufwritepost .vimrc source ~/.vimrc 

" System
if(has("win32") || has("win95") || has("win64") || has("win16"))
    let g:iswindows=1
else
    let g:iswindows=0
endif

"""""""""""""""""""""""
"  VIM user interface "
"""""""""""""""""""""""
" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc

"Always show current position
set ruler

" Height of the command bar
set cmdheight=2

"show matching bracket for 0.2 seconds
set matchtime=2

" highlight current line
au WinLeave * set nocursorline nocursorcolumn
au WinEnter * set cursorline cursorcolumn
set cursorline cursorcolumn

""""""""""""""""
"  Color&View  "
""""""""""""""""
" Enable syntax highlighting
syntax enable
syntax on

"close gui
set go=

if g:iswindows==1
    "colorscheme darkblue
    colorscheme ir_black
    set guifont=Courier_New:h12:w4
    "set guifontwide=NSimSun-18030,NSimSun
    set termencoding=GBK
else
    if has("gui_running")
        color vividchalk
    else
        colorscheme Tomorrow
    endif
    set guifont=DejaVu\ Sans\ Mono\ 11.5
    set termencoding=utf-8
endif

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions+=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

" Enable search highlight
set hlsearch

" Avoding Garbled
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set langmenu=zh_CN.utf-8

""""""""""""""""""""""""""""""""""""""""""""""
"  Moving around, tabs, windows and buffers  "
""""""""""""""""""""""""""""""""""""""""""""""
" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>tc :tabclose<cr>

" Configure backspace so it acts as it should act
"set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Default Indentation
set autoindent
set smartindent
set shiftwidth=4
set tabstop=4
set expandtab

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

""""""""""""""""
"  Status line " 
""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l

"""""""""""""""""""
" Program & Debug "
"""""""""""""""""""
"QuickFix key map
nmap <leader>cn :cn<cr>
nmap <leader>cp :cp<cr>
nmap <leader>cw :cw 10<cr>

"Load project settings
if filereadable("project.vim")
    source project.vim
endif

"""""""""""
" Plugins "
"""""""""""
source ~/.vim/bundles.vim

""""""""""""""
"  Functions "
""""""""""""""
" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction

"""""""""""""""""""
" omni completion "
"""""""""""""""""""
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType c setlocal omnifunc=ccomplete#Complete
