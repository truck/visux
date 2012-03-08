" fix emacs mode.
set insertmode
set selectmode +=cmd

" fire up pathogen
call pathogen#infect()

"set the esc bit for meta.
" commented as ssh from other boxen don't need this.
"let g:VM_UnixConsoleRemapEsc=1

" font-lock mode
syntax on

" fix the look/feel
set guifont=TopazPlus\ a600a1200a4000:h16
set guioptions=c
" no toolbar
set go-=T
set ruler

set transparency=5

" this is supposed to freaking change the colorset to a dark background.
set background=dark
set bg=dark
colo tetragrammaton

" this sets the :a and 'e and so on bits.
set keymap=accents

" 4 spaces indent, replace tabs smart;
set sw=4 sts=4 et

"omnicomplete on, and additional stuff for python
"autocmd FileType python set omnifunc=pythoncomplete#Complete


" Enable omni completion.
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown set omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python set omnifunc=pythoncomplete#CompleOBte
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags

"snipMate needs this to be on or snippets won't work.
:filetype plugin on

"taglist ctags thing
let Tlist_Ctags_Cmd="/usr/local/bin/ctags"

"put nerdtree on f3
" hit escape twice to go to normal mode, run toggle
" esc afterward (even multiples) don't seem to trigger normal mode
let g:modetoggle = 1

function! NTtog()
  if g:modetoggle == 1
    set noinsertmode
    let g:modetoggle = 0
    NERDTreeToggle
    return
  else
    let g:modetoggle = 1
    set insertmode
    NERDTreeToggle
    return
  endif
endfunction

inoremap <F3> <Esc><Esc>:call NTtog()<CR>
nnoremap <F3> <Esc><Esc>:call NTtog()<CR>

"similarly with taglist on f4?
inoremap <F4> <Esc><Esc>:TlistToggle<CR>

" try to get the freaking omnithing to work
" inoremap <F5> <c-x><c-o>

"Nerdtreestuff
let NERDChristmasTree=1
"set NERDTreeChDirMode=1
let NERDTreeShowHidden=1

