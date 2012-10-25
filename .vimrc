""""""""""""""""""""""""""""""""""
" Desc1984's vimrc
"
" Version
"   1.2
" Update Time
"   2012.10.25
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

" System
if(has("win32") || has("win95") || has("win64") || has("win16"))
    let g:iswindows=1
else
    let g:iswindows=0
endif

"""""""""""""""""""""""
"  VIM user interface "
"""""""""""""""""""""""
" set 7 lines to the cursor - when moving vertically using j/k
set so=7

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

"close gui
set go=

" color theme darkblue
"colorscheme blackboard
if g:iswindows==1
	colorscheme ir_black
else
	colorscheme blackboard
endif

" Enable search highlight
set hlsearch

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions+=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

set foldmethod=manual

"set encoding=utf-8
set guifont=Courier_New:h12:w7
set guifontwide=NSimSun-18030,NSimSun

set encoding=utf-8
if g:iswindows==1
	set termencoding=GBK
else
	set termencoding=utf-8
endif
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set langmenu=zh_CN.utf-8
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
language messages zh_CN.utf-8

""""""""""""""""""""""""""""""""""
"  Text, tab and indent related  "
""""""""""""""""""""""""""""""""""
" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

""""""""""""""""""""""""""""""""""""""""""""""
"  Moving around, tabs, windows and buffers  "
""""""""""""""""""""""""""""""""""""""""""""""
" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <c-space> ?

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

"一键编译
map <F5> :call Do_OneFileMake()<CR>

"一键执行
"map <F6> :call Do_make()<CR>
"map <c-F6> :silent make clean<CR>

"""""""""""""""""
"  Status line  " 
"""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l

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
"let g:vimwiki_folding = 1

"""""""""""
" TagList "
"""""""""""
let Tlist_Exit_OnlyWindow = 1
"let Tlist_Show_One_File = 1
nmap <F6> :TlistToggle<CR>

"""""""""""""""
" BufExplorer "
"""""""""""""""
let g:bufExplorerDefaultHelp = 0
let g:bufExplorerShowRelativePath = 1
let g:bufExplorerSortBy = 'mru'
"nmap <silent> <F5> :BufExplorerHorizontalSplit<CR>

""""""""""""
" NERDTree "
""""""""""""
"autocmd VimEnter * NERDTree
let NERDTreeWinPos = "right"
nmap <F7> :NERDTreeToggle<CR>

""""""""""
" cscope "
""""""""""
if has("cscope")
	set cscopequickfix=s-,c-,d-,i-,t-,e-
	" add any database in current directory 
	if filereadable("cscope.out") 
		cs add cscope.out 
	" else add database pointed to by environment  
	elseif $CSCOPE_DB != ""  
	    cs add $CSCOPE_DB  
	endif
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
 Bundle 'myusuf3/numbers.vim'
 "Bundle 'spf13/PIV'
 Bundle 'spf13/vim-colors'
 "Bundle 'Lokaltog/vim-easymotion'
 " vim-scripts repos
 Bundle 'taglist.vim'
 Bundle 'vimwiki'
 "Bundle 'SuperTab'
 Bundle 'Markdown'
 Bundle 'c.vim'
 Bundle 'blackboard.vim'
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


""""""""""""""
"  Functions "
""""""""""""""

"单个文件编译
function! Do_OneFileMake()
    if expand("%:p:h")!=getcwd()
        echohl WarningMsg | echo "Fail to make! This file is not in the current dir! Press <F7> to redirect to the dir of this file." | echohl None
        return
    endif
    let sourcefileename=expand("%:t")
    if (sourcefileename=="" || (&filetype!="cpp" && &filetype!="c"))
        echohl WarningMsg | echo "Fail to make! Please select the right file!" | echohl None
        return
    endif
    let deletedspacefilename=substitute(sourcefileename,' ','','g')
    if strlen(deletedspacefilename)!=strlen(sourcefileename)
        echohl WarningMsg | echo "Fail to make! Please delete the spaces in the filename!" | echohl None
        return
    endif
    if &filetype=="c"
        if g:iswindows==1
            set makeprg=gcc\ -o\ %<.exe\ %
        else
            set makeprg=gcc\ -o\ %<\ %
        endif
    elseif &filetype=="cpp"
        if g:iswindows==1
            set makeprg=g++\ -o\ %<.exe\ %
        else
            set makeprg=g++\ -o\ %<\ %
        endif
        "elseif &filetype=="cs"
        "set makeprg=csc\ \/nologo\ \/out:%<.exe\ %
    endif
    if(g:iswindows==1)
        let outfilename=substitute(sourcefileename,'\(\.[^.]*\)' ,'.exe','g')
        let toexename=outfilename
    else
        let outfilename=substitute(sourcefileename,'\(\.[^.]*\)' ,'','g')
        let toexename=outfilename
    endif
    if filereadable(outfilename)
        if(g:iswindows==1)
            let outdeletedsuccess=delete(getcwd()."\\".outfilename)
        else
            let outdeletedsuccess=delete("./".outfilename)
        endif
        if(outdeletedsuccess!=0)
            set makeprg=make
            echohl WarningMsg | echo "Fail to make! I cannot delete the ".outfilename | echohl None
            return
        endif
    endif
    execute "silent make"
    set makeprg=make
    execute "normal :"
    if filereadable(outfilename)
        if(g:iswindows==1)
            execute "!".toexename
        else
            execute "!./".toexename
        endif
    endif
    execute "copen"
endfunction
"进行make的设置
function! Do_make()
    set makeprg=make
    execute "silent make"
    execute "copen"
endfunction

" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction

