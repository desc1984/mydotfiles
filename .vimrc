""""""""""""""""""""""""""""""""""
" Desc1984's vimrc
"
" Version
"   1.3
" Update Time
"   2012.10.26
"
" Wish you have a good vim tour!
""""""""""""""""""""""""""""""""""

"""""""""""""
"  General  "
"""""""""""""
set nu
set nocompatible

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

""""""""""""""""
"  Color&View  "
""""""""""""""""
" Enable syntax highlighting
syntax enable

if has("gui_running")
    colorscheme darkblue
else
    colorscheme blackboard
endif

" Enable search highlight
set hlsearch

set guifont=Courier_New:h12:w7
set guifontwide=NSimSun-18030,NSimSun

" Avoding Garbled
set encoding=utf-8
if g:iswindows==1
	set termencoding=GBK
else
	set termencoding=utf-8
endif
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

set shiftwidth=4
set expandtab

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

"""""""""""""""""
"  Status line  " 
"""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l

""""""""""""""""
" Tag & Cscope "
""""""""""""""""
if filereadable("project.vim")
    source project.vim
endif

""""""""""
" Vundle "
""""""""""
 set rtp+=~/.vim/bundle/vundle/
 call vundle#rc()

 " let Vundle manage Vundle
 " required! 
 Bundle 'gmarik/vundle'

 " My Bundles here:
 "
 " original repos on github
 Bundle 'scrooloose/nerdtree'
 Bundle 'Shougo/neocomplcache'
 "Bundle 'myusuf3/numbers.vim'
 "Bundle 'spf13/PIV'
 "Bundle 'spf13/vim-colors'
 "Bundle 'Lokaltog/vim-easymotion'
 " vim-scripts repos
 Bundle 'taglist.vim'
 Bundle 'vimwiki'
 Bundle 'blackboard.vim'
 Bundle 'genutils'
 Bundle 'lookupfile'
 Bundle 'bufexplorer.zip'
 Bundle 'SuperTab'
 "Bundle 'minibufexpl.vim'
 "Bundle 'ZenCoding.vim'
 "Bundle 'c.vim'
 "Bundle 'Markdown'
 " non github repos
 " ...

 filetype plugin indent on     " required!
 "
 " Brief help
 " :BundleList          - list configured bundles
 " :BundleInstall(!)    - install(update) bundles
 " :BundleSearch(!) foo - search(or refresh cache first) for foo
 " :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
 "
 " see :h vundle for more details or wiki for FAQ
 " NOTE: comments after Bundle command are not allowed..

"""""""""""""
"  vimwiki  "
"'"""""""""""
let g:vimwiki_use_mouse = 1
let g:vimwiki_CJK_length = 1
let g:vimwiki_camel_case = 0
if g:iswindows==1
	let g:vimwiki_list = [{'path': 'E:/Dropbox/wiki/',
				\ 'path_html': 'D:/wamp/www/html/',
				\ 'html_header': 'D:/wamp/www/html/template/header.tpl',
				\ 'html_footer': 'D:/wamp/www/html/template/footer.tpl'}]
else
	let g:vimwiki_list = [{'path': '/media/storage/Dropbox/Wiki/'}]
endif

"""""""""""""""
" BufExplorer “
"""""""""""""""
let g:bufExplorerSplitVertSize = 30  " Split width
let g:bufExplorerSplitRight=0        " Split left.
let g:bufExplorerSortBy='mru'        " Sort by most recently used.

"""""""""""
" TagList "
"""""""""""
let Tlist_Exit_OnlyWindow = 1
"let Tlist_Show_One_File = 1
nmap <F6> :TlistToggle<CR>

""""""""""""
" NERDTree "
""""""""""""
"autocmd VimEnter * NERDTree
let NERDTreeWinPos = "right"
nmap <F7> :NERDTreeToggle<CR>

""""""""""""
" SuperTab "
""""""""""""
let g:SuperTabRetainCompletionType = 2
let g:SuperTabDefaultCompletionType = "<C-X><C-O>"

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

