
"
" A (not so) minimal vimrc.
"

" You want Vim, not vi. When Vim finds a vimrc, 'nocompatible' is set anyway.
" We set it explicitely to make our position clear!
set nocompatible

filetype plugin indent on  " Load plugins according to detected filetype.
syntax on                  " Enable syntax highlighting.

set autoindent             " Indent according to previous line.
set expandtab              " Use spaces instead of tabs.
set softtabstop =4         " Tab key indents by 4 spaces.
set shiftwidth  =4         " >> indents by 4 spaces.
set shiftround             " >> indents to next multiple of 'shiftwidth'.

set backspace   =indent,eol,start  " Make backspace work as you would expect.
set hidden                 " Switch between buffers without having to save first.
set laststatus  =2         " Always show statusline.
set display     =lastline  " Show as much as possible of the last line.

set showmode               " Show current mode in command-line.
set showcmd                " Show already typed keys when more are expected.

set incsearch              " Highlight while searching with / or ?.
set hlsearch               " Keep matches highlighted.

set ttyfast                " Faster redrawing.
set lazyredraw             " Only redraw when necessary.

set splitbelow             " Open new windows below the current window.
set splitright             " Open new windows right of the current window.

set cursorline             " Find the current line quickly.
set wrapscan               " Searches wrap around end-of-file.
set report      =0         " Always report changed lines.
set synmaxcol   =200       " Only highlight the first 200 columns.
set number                 " Show number lines

set list                   " Show non-printable characters.
if has('multi_byte') && &encoding ==# 'utf-8'
  let &listchars = 'tab:▸ ,extends:❯,precedes:❮,nbsp:±'
else
  let &listchars = 'tab:> ,extends:>,precedes:<,nbsp:.'
endif

" The fish shell is not very compatible to other shells and unexpectedly
" breaks things that use 'shell'.
if &shell =~# 'fish$'
  set shell=/bin/bash
endif


set mouse=a
nnoremap <C-N> :bnext<CR>
nnoremap <C-P> :bprev<CR>
nnoremap <C-S-Right> :bnext<CR>
nnoremap <C-S-Up> :bprev<CR>
"Tab management"
nnoremap <F7> :tabprevious<CR>
nnoremap <F8> :tabnext<CR>
" Split pane management"
nnoremap <C-Up> <C-W><C-K>
nnoremap <C-Down> <C-W><C-J>
nnoremap <C-Right> <C-W><C-L>
nnoremap <C-Left> <C-W><C-H>

nnoremap <C-S-w> <A-L>:w<CR>


:map <ScrollWheelUp> 6<C-Y>
:map <ScrollWheelDown> 6<C-E>
filetype plugin indent on

set ignorecase
set showmode

"F2"
set pastetoggle=<F2>
"F3"
map <F3> :set invnumber<CR>
"F4"
map <F4> :so ~/.vimrc <CR>
"F5"
map <C-F5> :mksession! ~/vim_session <cr>
map <F5> :source ~/vim_session <cr>

"F2"
set pastetoggle=<F2>
"F3"
map <F3> :set invnumber<CR>
"F4"
map <F4> :so ~/.vimrc <CR>
"F5"
map <F5> :source ~/vim_session <cr>
"F7 controls splits
map <C-F7> :split<CR>
map <F7> :vsplit<CR>map

