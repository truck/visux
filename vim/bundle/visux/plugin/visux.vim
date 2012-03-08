""""
" visux - emacs mappings (the ones I use) for vim.
" $version 0.02 - Feb 27 2012 -
" 
" --- OMG YOU KILLED KENNY YOU BASTARD
" Don't care what you think. Period. These are my mappings.
" They happen to piss off both vi users and gnu people.
" In my world, that means I rule.
"
"
" Some of this came from the brilliant vimacs, but, as I was
" having issues with various things I needed to get textmate
" like setups - well, here we are.
" vimacs is Copyright (C) 2002  Andre Pang <ozone@vimacs.cx>
" this is Copyright (C) 2012 by Sir Garbagetruck.
" oh, and this is covered by the WTFPL, the Do What the Fuck
" you want to public license. Yes, Gnu fuckwits, that means you
" can go fuck it over by applying Gnu shit to it. Go ahead.
"
" command mode first (sheesh modes... you need ONE.)
" but my mouse has 17 buttons!  Your mouse is _GAY._
" and by that I mean _fucks other mice in the ass._
" Some people like that. I use a trackball. Mice suck.
"
" the D-? mappings are for macvim, which for some reason sees
" alt not as meta, or alt, but D. Probably an osX keymap issue.
" As this fixes it, I'm not seeing why.

""" USAGE:
" you will set up basic modeless stuff in your .vimrc file like:
" set insertmode
" set selectmode += cmd

"""
" configuration setup to put us in sensible non-modal mode.
" and some other things. This is basically out of vimacs.

" wrapping
set whichwrap=b,s,<,>,h,l,[,],~
" turn off win/alt key menu bits
set winaltkeys=no
" backspace over everything
set backspace=indent,eol,start
" emacs has hidden buffers. I have no idea what this means in vi.
set hidden
" 2 line save message thing
set cmdheight=2

"control-a start of line
cmap <C-a> <Home>
imap <C-a> <Home>
vmap <C-a> <Home>

" control-b back char
" * alt-b not really used
cmap <C-b> <Left>
imap <C-b> <Left>
vmap <C-b> <Left>

cnoremap <M-b> <S-Left>
cnoremap <D-b> <S-Left>
inoremap <M-b> <S-Left>
inoremap <D-b> <S-Left>

" control-d forward delete
" * alt-d not really used
cmap <C-d> <Del>
imap <C-d> <Del>

" control-e end of line
cmap <C-e> <End>
imap <C-e> <End>
vmap <C-e> <End>

" control-f forward char
" * alt-f not really used
cmap <C-f> <Right>
imap <C-f> <Right>
vmap <C-f> <Right>

cnoremap <M-f> <S-Right>
cnoremap <D-f> <S-Right>
inoremap <M-f> <S-Right>
inoremap <D-f> <S-Right>

" control-g escape (in 'normal mode' - no escape please)
cnoremap <c-g> <esc>

"control-k kill-line
cnoremap <C-k> <C-f>d$<C-c><End>
inoremap <silent> <C-k> <C-r>=<SID>KillLine()<CR>
" attributed to vimacs.
" Thanks to Benji Fisher for helping me with getting <C-k> to work!

function! <SID>KillWord()
  if col('.') > strlen(getline('.'))
    return "\<Del>\<C-o>dw"
  else
    return "\<C-o>dw"
  endif
endfunction

function! <SID>KillLine()
  if col('.') > strlen(getline('.'))
    " At EOL; join with next line
    return "\<Del>"
  else
    " Not at EOL; kill until end of line
    return "\<C-o>d$"
  endif
endfunction


"control-l center
" * double: top  not really used, but may be nice
inoremap <C-l> <C-o>zz
inoremap <C-l><C-l> <C-o>zt
vnoremap <C-l> <C-o>zz
vnoremap <C-l><C-l> <C-o>zt
" 3 times puts you back where you were, but I'll do
" bottom.
inoremap <C-l><C-l><C-l> <C-o>zb
vnoremap <C-l><C-l><C-l> <C-o>zb

"control-n next line
imap <C-n> <Down>
vmap <C-n> <Down>
omap <C-n> <Down>
" as to why this is done this way I am unsure.
cmap <M-n> <Down>
cmap <D-n> <Down>

"control-p prev line
imap <C-p> <Up>
vmap <C-p> <Up>
omap <C-p> <Up>
" I do not really use alt-n or alt-p. We'll see how use goes.
cmap <M-p> <Up>
cmap <D-p> <Up>

"** control-u repeat (I don't use this much.)
" add later if useful, 

"control-y yank  (paste from kill ring)
cnoremap <C-y> <C-r><C-o>"
inoremap <C-y> <C-r><C-o>"
" don't think this would make sense in 'visual' mode 
" ... but I see no point in visual mode.

"control-_ undo (I always forget this) (mapping to something
" else may be good)
inoremap <C-_> <C-o>u
inoremap <C-x><C-u> <C-o>u


" This was there as well, I don't think I use it, but... it does work.
cnoremap <M-BS> <C-w>
cnoremap <c-BS> <C-w>

""" All the search parts (just using the vimacs stuff.
" it covers things fine, and appears to not have conflicts
" includes mappings for:
" control-g escape/cancel
" control-r reverse search
" control-s search

"
" Incremental Searching and Query Replace
"

inoremap <C-s> <C-o>:call <SID>StartSearch('/')<CR><C-o>/
inoremap <C-r> <C-o>:call <SID>StartSearch('?')<CR><C-o>?
inoremap <M-n> <C-o>:cnext<CR>
" <M-n> not in Emacs: next in QuickFix
inoremap <M-p> <C-o>:cprevious<CR>
" <M-p> not in Emacs: previous in QuickFix
inoremap <C-M-s> <C-o>:call <SID>StartSearch('/')<CR><C-o>/
inoremap <C-M-r> <C-o>:call <SID>StartSearch('?')<CR><C-o>?
inoremap <M-s> <C-o>:set invhls<CR>
inoremap <M-%> <C-o>:call <SID>QueryReplace()<CR>
inoremap <C-M-%> <C-o>:call <SID>QueryReplaceRegexp()<CR>
inoremap <C-D-%> <C-o>:call <SID>QueryReplaceRegexp()<CR>
cnoremap <C-r> <CR><C-o>?<Up>

command! QueryReplace :call <SID>QueryReplace()<CR>
command! QueryReplaceRegexp :call <SID>QueryReplaceRegexp()<CR>

"
" Function to mark a cursor position and restore it afterward -- used in a few
" functions, like FillParagraph().  Blatantly stolen from foo.vim by Benji
" Fisher :)
"

function! <SID>Mark(...)
  if a:0 == 0
    let mark = line(".") . "G" . virtcol(".") . "|"
    normal! H
    let mark = "normal!" . line(".") . "Gzt" . mark
    execute mark
    return mark
  elseif a:0 == 1
    return "normal!" . a:1 . "G1|"
  else
    return "normal!" . a:1 . "G" . a:2 . "|"
  endif
endfun

function! <SID>LetDefault(var_name, value)
  if !exists(a:var_name)
    execute 'let ' . a:var_name . '=' . a:value
  endif
endfunction

command! -nargs=+ LetDefault call s:LetDefault(<f-args>)

" Searching is a bit tricky because we have to emulate Emacs's behaviour of
" searching again when <C-s> or <C-r> is pressed _inside_ the search
" commandline.  Vim has no equivalent to this, so we must use a bit of
" on-the-fly remap trickery (popular in Quake-style games) to provide
" different functionality for <C-s>, depending on whether you're in 'search
" mode' or not.
"
" We must map <C-g> and <CR> because we have to undo the map trickery that we
" set up when we abort/finish the search.  All in all, it's not too complex
" when you actually look at what the code does.
"
" Note that <C-c> in Emacs is functionally the same as <CR>.

LetDefault g:VM_SearchRepeatHighlight 0

function! <SID>StartSearch(search_dir)
  let s:incsearch_status = &incsearch
  let s:lazyredraw_status = &lazyredraw
  set incsearch
  set lazyredraw
  cmap <C-c> <CR>
  cnoremap <C-s> <C-c><C-o>:call <SID>SearchAgain()<CR><C-o>/<Up>
  cnoremap <C-r> <C-c><C-o>:call <SID>SearchAgain()<CR><C-o>?<Up>
  cnoremap <silent> <CR> <CR><C-o>:call <SID>StopSearch()<CR>
  cnoremap <silent> <C-g> <C-c><C-o>:call <SID>AbortSearch()<CR>
  cnoremap <silent> <Esc> <C-c><C-o>:call <SID>AbortSearch()<CR>
  if a:search_dir == '/'
    cnoremap <M-s> <CR><C-o>:set invhls<CR><Left><C-o>/<Up>
  else
    cnoremap <M-s> <CR><C-o>:set invhls<CR><Left><C-o>?<Up>
  endif
  let s:before_search_mark = <SID>Mark()
endfunction

function! <SID>StopSearch()
  cunmap <C-c>
  cunmap <C-s>
  cunmap <C-r>
  cunmap <CR>
  cunmap <C-g>
  cnoremap <C-g> <C-c>
  if exists("s:incsearch_status")
    let &incsearch = s:incsearch_status
    unlet s:incsearch_status
  endif
  if g:VM_SearchRepeatHighlight == 1
    if exists("s:hls_status")
      let &hls = s:hls_status
      unlet s:hls_status
    endif
  endif
endfunction

function! <SID>AbortSearch()
  call <SID>StopSearch()
  if exists("s:before_search_mark")
    execute s:before_search_mark
    unlet s:before_search_mark
  endif
endfunction

function! <SID>SearchAgain()
  if (winline() <= 2)
    normal zb
  elseif (( winheight(0) - winline() ) <= 2)
    normal zt
  endif
  cnoremap <C-s> <CR><C-o>:call <SID>SearchAgain()<CR><C-o>/<Up>
  cnoremap <C-r> <CR><C-o>:call <SID>SearchAgain()<CR><C-o>?<Up>
  if g:VM_SearchRepeatHighlight == 1
    if !exists("s:hls_status")
      let s:hls_status = &hls
    endif
    set hls
  endif
endfunction

" Emacs' `query-replace' functions

function! <SID>QueryReplace()
  let magic_status = &magic
  set nomagic
  let searchtext = input("Query replace: ")
  if searchtext == ""
    echo "(no text entered): exiting to Insert mode"
    return
  endif
  let replacetext = input("Query replace " . searchtext . " with: ")
  let searchtext_esc = escape(searchtext,'/\^$')
  let replacetext_esc = escape(replacetext,'/\')
  execute ".,$s/" . searchtext_esc . "/" . replacetext_esc . "/cg"
  let &magic = magic_status
endfunction

function! <SID>QueryReplaceRegexp()
  let searchtext = input("Query replace regexp: ")
  if searchtext == ""
    echo "(no text entered): exiting to Insert mode"
    return
  endif
  let replacetext = input("Query replace regexp " . searchtext . " with: ")
  let searchtext_esc = escape(searchtext,'/')
  let replacetext_esc = escape(replacetext,'/')
  execute ".,$s/" . searchtext_esc . "/" . replacetext_esc . "/cg"
endfunction


" the control-x parts: "menu" key.
" the % query replace was covered above.

"cx-cf  find (open)
inoremap <C-x><C-f> <C-o>:hide edit<Space>

"cx-i   Insert file
inoremap <C-x>i <C-o>:read<Space>

"cx-cs  save
inoremap <C-x>s <C-o>:wall<CR>
inoremap <C-x><C-s> <C-o>:update<CR>

"cx-cw write new file
inoremap <C-x><C-w> <C-o>:write<Space>

"cx-cc  quit
" we seem to need to redefine control-c to make this work.
" very possibly due to the modeless bits.
map <c-c> <esc><esc>
inoremap <C-x><C-c> <C-o>:confirm qall<CR>
"inoremap <c-x><c-c> <c-o>:q!<cr>

"""
" Buffer stuff - threw out the function in vimacs.

"cx-cb  buffer list
inoremap <C-x><C-b> <C-o>:buffers<CR>

"cx-b   other buffer
inoremap <c-x>b <C-o>:buffer<Space>

" and also delete buffer is in here which I always forget.
"cx-k
inoremap <C-x>k <C-o>:bdelete<Space>

"""
" window/pane stuff

" close window/pane
inoremap <C-x>0 <C-o><C-w>c

"cx-1	1 pane
inoremap <C-x>1 <C-o><C-w>o

"cx-o	other pane
inoremap <c-x>o <c-w><c-w>
vnoremap <c-x>o <c-w><c-w>

"cx-2	split horizontal
inoremap <C-x>2 <C-o><C-w>s

"cx-3	split vertical
inoremap <C-x>3 <C-o><C-w>v

"cx-4   do something in another window, I don't use this
"cx-5   open new window (we'll use tab) with file (sorta (: )
inoremap <c-x>5f <esc>:new<cr><c-w>T<C-o>:hide edit<Space>
inoremap <c-x>5b <esc>:new<cr><c-w>T<C-o>:buffer<Space>
inoremap <c-x>5h <esc>:new<cr><c-w>T<C-o>:help<Space>

" I do think alt-x (run stuff) should be mapped to 'switch to normal mode'
inoremap <m-x> <c-o>:
inoremap <D-x> <c-o>:

"""""
" and we're loaded, so...
" 
echo "Visux 0.02 (C) Sir Garbagetruck 2012\n"

