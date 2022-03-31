set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim' " Vundle Plugin
Plugin 'dracula/vim', {'name': 'dracula'} " Dracula colorscheme
Plugin 'sheerun/vim-polyglot' " Polyglot language syntax Plugin
Plugin 'jiangmiao/auto-pairs' " Bracket matching Plugin
Plugin 'preservim/nerdtree' " Directory Tree Plugin
Plugin 'quattor/pan', {'rtp': 'pan-vim/'}
Plugin 'zeek/vim-zeek' " zeek syntax plugin

" All of your Plugins must be added before the following line
call vundle#end()            " required

" file type specific settings
filetype on " enable file type detection
filetype plugin on " load the plugins for specific file types
filetype indent on " automaatically indent code

" display settings
set encoding=utf-8 " encoding for displaying file
set ruler " show cursor position all the time
set showmatch " highlight matching braces
set showmode " show insert/replace/visual mode
set nu " Set show numbers
set splitbelow " always split below
set mouse=a " enable mouse drag on window splits

"write settings
set confirm " confirm :q in case of unsaved changes
set fileencoding=utf-8 " encoding when saving file

" edit settings
set backspace=indent,eol,start " backspaicing over everything in insert mode
set expandtab " fill tabs with spaces
set nojoinspaces " no extra space after '.' when joining lines
set shiftwidth=2 " set indentation depth to 4 columns
set softtabstop=2
set textwidth=80 " wrap lines automatically at 80th column

" search settings
set hlsearch " highlight search results
set ignorecase " do case insensitive search...
set incsearch " do incremental search
set smartcase " ...unless captial letters are used

" syntax highlighting
colorscheme dracula
set background=dark " dark background for console
syntax enable " enable syntax highlighting

" charachters for displaying non-printable characters
" set listchars=eol:$,tab:>-,trail:.,nbsp:_,extends:+,precedes:+

" gvim
if has('gui_running')
    set background=light " light background for GUI
    set columns=84 lines=48 " GUI window geometry
    set guifont=Monospace\ 12 " font for GUI window
    set number " show line numbers
endif

" Make shift-insert work like in Xterm

map <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>

" automatic commands
if has('autocmd')
    " file type specific automatic commands
    " tuning textwidth for Java code
    autocmd FileType java setlocal textwidth=132
    if has('gui_running')
        autocmd FileType java setlocal columns=136
    endif

    " don't replace Tabs with spaces when editing makefiles
    autocmd Filetype makefile setlocal noexpandtab

    " disable automatic code indentation when editing TeX and XML files
    autocmd FileType tex,xml setlocal indentexpr=

    " delete empty or whitespaces-only lines at the end of file
    autocmd BufWritePre * :%s/\(\s*\n\)\+\%$//ge

    " replace groups of empty or whitespaces-only lines with one empty line
    autocmd BufWritePre * :%s/\(\s*\n\)\{3,}/\r\r/ge

    " delete any trailing whitespaces
    autocmd BufWritePre * :%s/\s\+$//ge
endif

" general key mappings
" center view on search result
noremap n nzz
noremap N Nzz

" press F2 to open cheatsheet
noremap <F2> :tabnew ~/Documents/tmp/cheatsheets/vim_cheatsheet.txt<CR>

" press F4 to fix indentation in whole file
noremap <F4> mqggVg=`qzz
inoremap <F4> <Esc>mqggVG=`qzza

" press F5 to sort selection or paragraph
vnoremap <F5> :sort i<CR>
nnoremap <F5> Vip:sort i<CR>

" press F8 to turn the search results highlights off
noremap <F8> :nohl<CR>
inoremap <F8> <Esc>:nohl<CR>a

" press F12 to toggle showing the non-printable charactes
noremap <F12> :set list!<CR>
inoremap <F12> <Esc>:set list!<CR>a
vnoremap <C-c> "*y

:set spell spelllang=en_gb
set clipboard=unnamedplus
