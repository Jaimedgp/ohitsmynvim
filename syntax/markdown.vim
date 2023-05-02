colorscheme seoul256-light

set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=150
set expandtab
set autoindent
set fileformat=unix

set foldmethod=indent
set foldnestmax=10
"set nofoldenable
set foldlevel=2
set conceallevel=2

set spell

"""""""""""""""""""""""""""""""
""  TABLE-MODE CONFIG
"""""""""""""""""""""""""""""""

let g:table_mode_corner='|'
let g:table_mode_corner_corner='|'
let g:table_mode_header_fillchar='-'


"""""""""""""""""""""""""""""""
""  MARKDOWN CONFIG
"""""""""""""""""""""""""""""""

let g:vim_markdown_folding_level = 2
let g:vim_markdown_math = 1
let g:vim_markdown_strikethrough = 1
let g:vim_markdown_edit_url_in = 'tab'

" source $HOME/.config/nvim/scripts/todo.vim

":COQsnips compile
"source $HOME/.config/nvim/scripts/emoji/emoji.vim

"set completefunc=emoji#complete

"source $HOME/.config/nvim/icons.vim

"augroup GetAbbrev
"    autocmd!
"    autocmd VimEnter * let s:abbrev_list = [] |
"                \ call substitute(join(readfile($MYVIMRC), "\n"), '\v%(^|\n)\s*i?%(nore)?ab%[brev]\s+%(%(\<expr\>|\<buffer\>)\s+){,2}(\k+)', '\=add(s:abbrev_list, submatch(1))', 'gn')
"augroup END
"
"function! CompleteAbbrev(findstart, base)
"    if a:findstart
"        return searchpos('\<\k', 'bcnW', line('.'))[1] - 1
"    else
"        return filter(copy(s:abbrev_list), 'v:val =~ "^" . a:base')
"    endif
"endfunction
"set completefunc=CompleteAbbrev
