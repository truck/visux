" fix emacs mode.
set insertmode
set selectmode +=cmd

" autoindent stuff
set cindent
set smartindent
set autoindent
"set expandtab


" don't take my mouse cursor away!
set nomousehide


" fire up pathogen
call pathogen#infect()

"set the esc bit for meta.
" commented as ssh from other boxen don't need this.
"let g:VM_UnixConsoleRemapEsc=1

" font-lock mode
syntax on

" fix the look/feel
" osx
"set guifont=TopazPlus\ a600a1200a4000:h16
" X11+xft
set guifont=TopazPlus\ a600a1200a4000\ 12
set guioptions=cm
" no toolbar
"set go-=T
set ruler

"osx only
set transparency=5

" this is supposed to freaking change the colorset to a dark background.
set background=dark
set bg=dark
"colo tetragrammaton
colo solarized

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
" filetypes for various things
au BufReadPost *.asm set syntax=asm68k

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

" compile on f5
inoremap <F5> <c-o>:make<cr>

" try to get the freaking omnithing to work
" inoremap <F5> <c-x><c-o>

"Nerdtreestuff
let NERDChristmasTree=1
"set NERDTreeChDirMode=1
let NERDTreeShowHidden=1" toggle insert mode on/off on f12. I would just leave this
" but so many 'other buffers' are set up to do things in 'normal'
" mode that this is neccesary.
function! Itog()
  if g:modetoggle == 1
    set noinsertmode
    let g:modetoggle = 0
  else
    set insertmode
    let g:modetoggle = 1
  endif
endfunction
    
inoremap <F12> <c-o>:call Itog()<CR>

" git stuff
inoremap <F6> <c-o>:Gedit<cr>
inoremap <s-F6> <c-o>:Gstatus<cr>
inoremap <c-F6> <c-o>:Gsplit 
inoremap <a-F6> <c-o>:Gvsplit 


