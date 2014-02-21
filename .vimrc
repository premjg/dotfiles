set nocompatible           " get rid of Vi compatibility mode. SET FIRST!
set laststatus=2           " last window always has a statusline
set nohlsearch             " Don't continue to highlight searched phrases.
set incsearch              " But do highlight as you type your search.
set ignorecase             " Make searches case-insensitive.
set ruler                  " Always show info along bottom.
set autoindent             " auto-indent
set tabstop=2              " tab spacing
set softtabstop=2          " unify
set shiftwidth=2           " indent/outdent by 4 columns
set shiftround             " always indent/outdent to the nearest tabstop
set expandtab              " use spaces instead of tabs
set smarttab               " use tabs at the start of a line, spaces elsewhere
set nowrap                 " don't wrap text
set nu
set ttimeoutlen=10         "wait for 10ms after escape
set hidden                 "Hide the buffers
set tags=./tags            "Where to find ctags

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

let mapleader = ";" "set the leader key to ';' (easy to type)
nnoremap <silent> <C-l> :nohl<CR><C-l>
" <Ctrl-l> redraws the screen and removes any search highlighting.

"Enable Matchit
runtime macros/matchit.vim

Bundle 'gmarik/vundle'
Bundle 'kien/ctrlp.vim'
Bundle 'flazz/vim-colorschemes'
Bundle 'scrooloose/nerdtree'
Bundle 'vim-scripts/tComment'
Bundle 'msanders/snipmate.vim'
Bundle 'tpope/vim-surround'
Bundle 'bronson/vim-trailing-whitespace'
Bundle 'ervandew/supertab'
Bundle 'mileszs/ack.vim'
Bundle 'rking/ag.vim'
Bundle 'tpope/vim-rails'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'garbas/vim-snipmate'
Bundle 'othree/html5.vim'
Bundle 'wavded/vim-stylus'
Bundle 'kchmck/vim-coffee-script'
Bundle 'mattn/emmet-vim'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'kana/vim-textobj-user'
Bundle 'nelstrom/vim-textobj-rubyblock'
Bundle 'wookiehangover/jshint.vim'
Bundle 'mhinz/vim-signify'
Bundle 'tpope/vim-fugitive'
Bundle 'ags/tslime.vim'
Bundle 'benmills/vimux'
Bundle 'SirVer/ultisnips'
" Bundle 'Valloric/YouCompleteMe'
Bundle 'scrooloose/syntastic'


autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1

" Look and Feel
set background=dark
" colorscheme molokai
colorscheme solarized
set cursorline " Highlight the current line
" set cuc cul " Highlight active column
set number
set ruler
set eol " force blank lines at end of file
syntax on
filetype off
filetype plugin indent on
set scrolloff=3
set encoding=utf-8
set fileencodings=utf-8
set t_Co=256               " enable 256-color mode.
syntax enable              " enable syntax highlighting (previously syntax on).
set term=screen-256color

" if !exists('g:airline_symbols')
"   let g:airline_symbols = {}
" endif

" let g:airline_powerline_fonts=1
" let g:airline_detect_paste=1
" let g:airline#extensions#tabline#enabled = 1
" let g:airline_theme='luna'
" let g:airline_powerline_fonts=1
" let g:airline_left_alt_sep = '▶'
" let g:airline_left_sep = '▶'
" let g:airline_right_alt_sep = '◀'
" let g:airline_right_sep = '◀'
" let g:airline_symbols.linenr = '␊'
" let g:airline_symbols.linenr = '␤'
" let g:airline_symbols.linenr = '¶'
" let g:airline_symbols.branch = '⎇'
" let g:airline_symbols.paste = 'ρ'
" let g:airline_symbols.paste = 'Þ'
" let g:airline_symbols.paste = '∥'
" let g:airline_symbols.whitespace = 'Ξ'

if has('gui_running')
  set guifont=Inconsolata:h18
endif


" Open Nerdtree
map <C-n> :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.swp$','.DS_Store', '.git[[dir]]', '.sass-cache[[dir]]']

" Fix multiple cursors key mapping
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-f>'
let g:multi_cursor_prev_key='<C-d>'
let g:multi_cursor_skip_key='<C-g>'
let g:multi_cursor_quit_key='<Esc>'

" Tabs
map <C-t> :tabnew<CR>
map <C-S-Right> gt
map <C-S-Left> gT

let NERDTreeShowHidden=1

" Coffeescript Support
hi link coffeeReservedError NONE
hi link coffeeSemicolonError NONE
hi link coffeeSpaceError NONE

" No swp files
set noswapfile

" Set the status line powered by fugitive
" set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

" Set up syntaxes
au BufRead,BufNewFile *.rabl setf ruby

" Mouse for scrolling etc in console.
set mouse=a
"
" " Resize split panes with mouse within tmux.
" " Also get live-updated text selection with mouse drag.
set ttymouse=xterm2

map <Leader>V :e $MYVIMRC<CR> " Open Vimrc on a whim
map <Leader>p :set paste!<CR> " Paste stuff like a boss
map <Leader>\ :botright vnew<CR> " Open a split window on the right
map <Leader>- :botright new<CR> " Open a split window bottom
map <Leader>w <C-w>w " Cycle between windows
map <Leader>q :q<CR> " Quit a Window
map <Leader>f :NERDTreeFind<CR> " Show the current file in Nerdtree

" Some Linux distributions set filetype in /etc/vimrc.
" Clear filetype flags before changing runtimepath to force Vim to reload them.
filetype off
filetype plugin indent off
set runtimepath+=/usr/local/go/misc/vim
filetype plugin indent on
syntax on

"Run Rspec Files
nnoremap <leader>r :w\|:call VimuxRunCommand("clear && zeus rspec --format documentation ". bufname("%") . ":" . line("."))<CR>

"Git Blame
nnoremap <leader>gb :call VimuxRunCommand("git log -20 --pretty='%h %C(yellow)%an %Creset %cr: %s ' " . bufname("%") )<CR>

"Update Ctags
nnoremap <Leader>ct :!sudo bash ~/.dotfiles/ctags-auto.sh<CR>

" Aggressive autosaving
  " autocmd InsertLeave * silent! update
  " autocmd CursorMoved * silent! update
  " autocmd BufLeave,FocusLost * silent! wall

" Dim inactive windows using 'colorcolumn' setting
" This tends to slow down redrawing, but is very useful.
" Based on https://groups.google.com/d/msg/vim_use/IJU-Vk-QLJE/xz4hjPjCRBUJ
" XXX: this will only work with lines containing text (i.e. not '~')
function! s:DimInactiveWindows()
  for i in range(1, tabpagewinnr(tabpagenr(), '$'))
    let l:range = ""
    if i != winnr()
      if &wrap
        " HACK: when wrapping lines is enabled, we use the maximum number
        " of columns getting highlighted. This might get calculated by
        " looking for the longest visible line and using a multiple of
        " winwidth().
        let l:width=256 " max
      else
        let l:width=winwidth(i)
      endif
      let l:range = join(range(1, l:width), ',')
    endif
    call setwinvar(i, '&colorcolumn', l:range)
  endfor
endfunction
augroup DimInactiveWindows
  au!
  au WinEnter * call s:DimInactiveWindows()
  au WinEnter * set cursorline
  au WinLeave * set nocursorline
augroup END

" Fix Ctrlp root finding problem
let ctrlp_working_path_mode=''


noremap <silent> <C-s> :update<CR>
vnoremap <silent> <C-s> <C-C>:update<CR>
inoremap <silent> <C-s> <C-O>:update<CR>
