" You want Vim, not vi. When Vim finds a vimrc, 'nocompatible' is set anyway.

" We set it explicitely to make our position clear!
set nocompatible

filetype plugin indent on  " Load plugins according to detected filetype.
syntax on                  " Enable syntax highlighting.
set autoindent             " Indent according to previous line.
"#set expandtab              " Use spaces instead of tabs.
set softtabstop =4         " Tab key indents by 4 spaces.

set laststatus  =2         " Always show statusline.
set display     =lastline  " Show as much as possible of the last line.

set showmode               " Show current mode in command-line.
set showcmd                " Show already typed keys when more are expected.

set incsearch              " Highlight while searching with / or ?.
set hlsearch               " Keep matches highlighted.

set splitbelow             " Open new windows below the current window.
set splitright             " Open new windows right of the current window.

set cursorline             " Find the current line quickly.
set wrapscan               " Searches wrap around end-of-file.
set number                 " Show number lines

set list                   " Show non-printable characters.
if has('multi_byte') && &encoding ==# 'utf-8'
  let &listchars = 'tab:▸ ,extends:❯,precedes:❮,nbsp:±'
else
  let &listchars = 'tab:> ,extends:>,precedes:<,nbsp:.'
endif

set mouse=a

" Split pane management"
nnoremap <C-k> <C-W><C-K>
nnoremap <C-j> <C-W><C-J>
nnoremap <C-h> <C-W><C-L>
nnoremap <C-l> <C-W><C-H>

inoremap <C-S> <Esc>:update<cr>gi
noremap <C-S> :update<cr>

set ignorecase
set showmode

"F2"
set pastetoggle=<F2>
"F3"
map <F3> :set invnumber<CR>
"F4"
map <F4> :so ~/.vimrc <CR>
"F5"

set pastetoggle=<F2>
map <C-F7> :split<CR>
map <F7> :vsplit<CR>map

