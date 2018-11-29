" All system-wide defaults are set in $VIMRUNTIME/archlinux.vim (usually just
" /usr/share/vim/vimfiles/archlinux.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vimrc), since archlinux.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing archlinux.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages.
runtime! archlinux.vim

" If you prefer the old-style vim functionalty, add 'runtime! vimrc_example.vim'
" Or better yet, read /usr/share/vim/vim80/vimrc_example.vim or the vim manual
" and configure vim to your own liking!

" do not load defaults if ~/.vimrc is missing
"let skip_defaults_vim=1
"
set nocompatible
syntax enable
filetype plugin on
set path+=**

set mouse=a " enables mouse support for (a)ll modes
set ttymouse=xterm2 " for better mouse support in screen
set nofoldenable
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set autoindent
"set splitbelow
set splitright
highlight LineNr ctermfg=grey
syntax on
set autochdir " automatically switch to dir of open file
set cryptmethod=blowfish2
set clipboard=unnamedplus " always use system clipboard for yanking 
set wildmenu " menu above commandline
set number relativenumber " combine relative and absolute line numbers 
set hlsearch " highlight the search while typing 

" spellchecking enable
"set spell


""" Keymaps
"map <c-b> :term nim c -r %:t<cr> 
map <c-b> :w<cr> :term nim c -r %:p<cr> 
"map <f6> :!nim c -r %:p<cr> 
map <f6> :w<cr> :!xterm -e "nim c -r %:p; read" 2> /dev/null  &<cr> 
map <f10> :source $MYVIMRC<cr>
map <f12> :!git gui &<cr> 
map <c-s> :w<cr> 
map ö :
map <leader>id :put =strftime('%c')<cr>:put =\"\n\"<cr>

" repeat last used macro with ,
:map , @@

" Notepad like date insert
nnoremap <F5> "=strftime("%c")<CR>P
inoremap <F5> <C-R>=strftime("%c")<CR>


" move lines with ctrl
" http://vim.wikia.com/wiki/Moving_lines_up_or_down
nnoremap <c-j> :m .+1<CR>==
nnoremap <c-k> :m .-2<CR>==
inoremap <c-j> <Esc>:m .+1<CR>==gi
inoremap <c-k> <Esc>:m .-2<CR>==gi
vnoremap <c-j> :m '>+1<CR>gv=gv
vnoremap <c-k> :m '<-2<CR>gv=gv

call plug#begin('~/.vim/plugged')
Plug 'https://github.com/khogeland/nvim-nim.git'
"Plug 'https://github.com/jceb/vim-orgmode.git'
Plug 'https://github.com/scrooloose/nerdtree.git'
Plug 'https://github.com/vimwiki/vimwiki.git'
Plug 'https://github.com/itchyny/calendar.vim.git'


" Plugin for commeting
" \cc \cu
Plug 'scrooloose/nerdcommenter'
" Initialize plugin system
call plug#end()

"let g:org_agenda_files=['~/journal.org'] ", '~/projects/todo-list.org']

