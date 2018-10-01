set number
set hidden
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
" Nerd tree "
"autocmd vimenter * NERDTree
autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <C-m><C-m> :NERDTreeToggle<CR>

filetype plugin on
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDCommentEmptyLines = 1

hi CursorLine   cterm=NONE ctermbg=black

augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END
set mouse=a
:map <ScrollWheelUp> 6<C-Y>
:map <ScrollWheelDown> 6<C-E>
filetype plugin indent on
set ignorecase

set t_Co=256
let s:lightmode=0
syntax on


function! ToggleSolarized()
    if s:lightmode == 1
       let g:solarized_termcolors=256
        syntax enable
        let s:lightmode=2
        set background=dark
        colorscheme solarized
        let g:solarized_contrast="normal"
    elseif s:lightmode == 0
      let g:solarized_termcolors=256
        syntax enable
        let s:lightmode=1
        set background=light
        colorscheme solarized
        let g:solarized_contrast="high"
    else  
        syntax on
        let s:lightmode=0
        set background=dark

    endif
endfunction

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:tagbar_type_go = {
  \ 'ctagstype' : 'go',
    \ 'kinds'     : [  
    \ 'p:package',
    \ 'i:imports:1',
    \ 'c:constants',
    \ 'v:variables',
    \ 't:types',
    \ 'n:interfaces',
    \ 'w:fields',
    \ 'e:embedded',
    \ 'm:methods',
    \ 'r:constructor',
    \ 'f:functions'
  \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
      \ 't' : 'ctype',
      \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
      \ 'ctype' : 't',
      \ 'ntype' : 'n'
    \ },
  \ 'ctagsbin'  : 'gotags',
  \ 'ctagsargs' : '-sort -silent'
\ }
let g:EasyGrepWindowPosition="rightbelow"

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
"F6"
map <F6> :call ToggleSolarized()<cr>
"F7 controls splits
map <C-F7> :split<CR>
map <F7> :vsplit<CR>map
"F8 ---- NONE"

"F9"
map <F9> :TagbarToggle<CR>
map <C-F9> :TagbarTogglePause<CR>
let g:tagbar_map_togglefold = "<space>"
"F"
