set number
"colorscheme default
"set background=dark
"call pathogen#infect()

set ts=3
set sw=3
set sts=3

autocmd BufReadPre,BufNewFile *.xml map _x Yp:s/</<\//<CR>:let @/=""<CR>ko<ESC>i<TAB><ESC>
autocmd BufReadPre,BufNewFile *.xml map _s Yp:s/</<\//<CR>kJ:let @/ = ""<CR>h 

filetype plugin indent on
set foldmethod=syntax
let g:xml_syntax_folding=1
let g:EclimDisabled=1
set nofoldenable
set cursorline
syntax on

" An interesting set of netrw settings from netrw docs.
let g:netrw_preview   = 1
let g:netrw_liststyle = 3
let g:netrw_winsize   = 30
"	In case want ot use reverse, but it's really pretty annoying
"highlight CursorLine term=reverse cterm=reverse

let @n=':set nowrap'
let @w=':set wrap'

" See https://stackoverflow.com/questions/1050640/how-to-stop-vim-from-adding-a-newline-at-end-of-file
set nofixeol
set nofixendofline
