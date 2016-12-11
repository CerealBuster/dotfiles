" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2011 Apr 15
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

"Plugins{{{

set nocompatible              " be iMproved, required
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"CTRL-P
Plugin 'kien/ctrlp.vim'

"Solaized theme
Plugin 'altercation/vim-colors-solarized'

"Pandoc
Plugin 'vim-pandoc/vim-pandoc'

"Pandoc syntax
Plugin 'vim-pandoc/vim-pandoc-syntax'

"Plant-UML syntax
Plugin 'aklt/plantuml-syntax'

"delimitMate
Plugin 'Raimondi/delimitMate'

"Vim-Airline
Plugin 'vim-airline/vim-airline'

"Vim-Airline-Theme
Plugin 'vim-airline/vim-airline-themes'

"Fugitive
Plugin 'tpope/vim-fugitive'

"indentLine
Plugin 'Yggdroot/indentLine'

"tabele Mode
Plugin 'dhruvasagar/vim-table-mode'

"Pythonmode
Plugin 'klen/python-mode'

"Vim-Pencil
Plugin 'reedes/vim-pencil'

"Syntastic {{{
Plugin 'vim-syntastic/syntastic'

"}}}
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
"}}}
"Default vim settings{{{
" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif
"}}}
"folding methods{{{
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END
"}}}
" Centralize SWAP and Backupfiles{{{
let $TMP=$HOME.'/.vim/SWAP/'
set directory=$TMP
set backup
let $Backup=$HOME.'/.vim/Backups/'
set backupdir=$Backup
"let Tlist_Ctags_Cmd = $HOME.'/vimfiles/ctags.exe'
"}}}


"personal file settings{{{
set ignorecase

set cursorcolumn

set cursorline 

set nu 

set textwidth=79
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
set shiftround
set autoindent
"}}}

"CodeSettings{{{
"only allow trailing whitespaces to be stripped if it is a code file
autocmd FileType c,cpp,java,php autocmd BufWritePre <buffer> :%s/\s\+$//e
let g:pymode = 1
let g:pymode_warnings = 1
let g:pymode_paths = []
let g:pymode_folding = 1
let g:pymode_python = 'python3'
let g:pymode_lint = 0
syntax enable
"}}}

"Appearance{{{

"enable 256 colors 
set t_Co=256
set background=dark
colorscheme solarized
"Fontsettings for gui
if has("gui_running")
  if has('gui_win32')
    set guifont=Consolas:h10:b
  else
    set guifont=Monospace\ 10
  endif
endif
"}}}

"Ctrlp settings{{{
let g:ctrlp_cache_dir = $HOME.'/.vim/chache'
nnoremap <silent> <M-F12> :CtrlPBuffer<CR>
"}}}

"Airline settings {{{
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline_detect_paste=1
let g:airline_theme='solarized'
let g:airline#extensions#branch#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#syntastic#enabled = 1
"}}}

"Vim-Pencil settings{{{

augroup pencil
  autocmd!
  let g:pencil#wrapModeDefault = 'hard'   " default is 'hard'
  let g:airline_section_x = '%{PencilMode()}'
  autocmd FileType markdown,mkd call pencil#init()
  autocmd FileType text         call pencil#init()
  setlocal spell
  set spelllang=de_ch
augroup END

"}}}
"Syntastic settings{{{
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"js checker
let g:syntastic_javascript_checkers = ['jshint']

"python checker
let g:syntastic_python_checkers = ['pylint']
"}}}

"Pandoc settings{{{
let g:pandoc#formatting#mode = 'hA'
"}}}

"Tablemode settings{{{
let g:table_mode_corner_corner="+"
let g:table_mode_header_fillchar="="
"}}}
