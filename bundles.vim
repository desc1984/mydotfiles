""""""""""
" Vundle "
""""""""""
 set rtp+=~/.vim/bundle/vundle/
 call vundle#rc()

 " let Vundle manage Vundle
 " required! 
 Bundle 'gmarik/vundle'

 " original repos on github
 Bundle 'scrooloose/nerdtree'
 Bundle 'Shougo/neocomplcache'
 Bundle 'garbas/vim-snipmate'
 Bundle 'honza/snipmate-snippets'
 Bundle 'ervandew/supertab'
 " snipmate dependencies
 Bundle 'MarcWeber/vim-addon-mw-utils'
 Bundle 'tomtom/tlib_vim'

 Bundle 'myusuf3/numbers.vim'
 Bundle 'Lokaltog/vim-powerline'

 Bundle 'scrooloose/syntastic'

 "Bundle 'humiaozuzu/TabBar'
 " color theme
 Bundle 'tpope/vim-vividchalk'
 Bundle 'spf13/vim-colors'
 Bundle 'rickharris/vim-blackboard'
 Bundle 'chriskempson/vim-tomorrow-theme'

 "Bundle 'spf13/PIV'
 "Bundle 'Lokaltog/vim-easymotion'
 " vim-scripts repos
 Bundle 'taglist.vim'
 Bundle 'vimwiki'
 Bundle 'matrix.vim'
 Bundle 'ShowMarks'
 Bundle 'matchit.zip'
 "Bundle 'minibufexpl.vim'
 "Bundle 'genutils'
 "Bundle 'lookupfile'
 "Bundle 'bufexplorer.zip'
 "Bundle 'ZenCoding.vim'
 "Bundle 'c.vim'
 "Bundle 'Markdown'
 " non github repos
 " ...

 filetype plugin indent on     " required!

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

"""""""""""""""""
" neocomplcache "
"""""""""""""""""
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_disable_auto_complete=1
let g:neocomplcache_min_syntax_length=3
set completeopt-=preview

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
let NERDTreeChDirMode=2
let NERDTreeWinSize=30
let NERDTreeWinPos = "right"
let NERDTreeIgnore=['\.vim$', '\~$', '\.pyc$', '\.swp$']
let NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$',  '\~$']
nmap <F7> :NERDTreeToggle<CR>

""""""""""""
" SuperTab "
""""""""""""
let g:SuperTabRetainCompletiontype = 2
let g:supertabdefaultcompletionType = "<C-X><C-U>"
