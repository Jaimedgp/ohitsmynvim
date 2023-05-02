function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! Folder()
    return fnamemodify(expand('%:p:h'), ':~:.')
endfunction

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?''.l:branchname.'':''
endfunction

"set laststatus=2
"set statusline=
"set statusline+=%1*%{GetStatusLineMode1()}%*
"" %n\ %#StatusLineY#%m%*\%#StatusLineR#%r%*\ %t\ [%o\ %l/%L(%p%%)\ %c\ \]
""set statusline+=\ %{mode()}
""set statusline+=\ %#Jaime#
"set statusline+=\ %f " Relative path
"set statusline+=\ %M "Modifications (e.r.: +)
"
"set statusline+=%= "Right status bar
"set statusline+=\ %y "File type
"set statusline+=\ %L "algo
"set statusline+=\ %p%% " Percentage of the file
"set statusline+=\ %l:%c " line:column
"
"
"""""""""""""""""""""""""""""""
""  AIRLINE CONF
"""""""""""""""""""""""""""""""

let g:airline_mode_map = {
      \ '__' : '-',
      \ 'n' : 'NOR',
      \ 'i' : 'INS',
      \ 'R' : 'REP',
      \ 'c' : 'COP',
      \ 'v' : 'VIS',
      \ 'V' : 'VIL',
      \ 's' : 'SEL',
      \ 'S' : 'SLI',
      \ }

let g:airline_powerline_fonts = 0
let g:airline_theme='bubblegum'
"let g:airline_theme='murmur'
let g:airline_skip_empty_sections = 1
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_left_alt_sep = '|'
let g:airline_right_alt_sep = '|'

let g:airline_extensions = ['hunks', 'branch', 'tabline']
"let g:airline#extensions#hunks#enable = 1
"let g:airline#extensions#branch#enable = 1
"let g:airline#extensions#tabline#enable = 1

let g:airline#extensions#tabline#enable = 1
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''

let g:airline_section_a = airline#section#create(["mode"])
let g:airline_section_b = airline#section#create_left(["folder", "%t"])
let g:airline_section_c = airline#section#create(["%M", "%R"])

let g:airline_section_x = airline#section#create_right(["%L", "%p%%", "%l:%c"])
let g:airline_section_y = airline#section#create(["%{StatuslineGit()}"])
let g:airline_section_z = airline#section#create_right(["filetype"])

let g:airline_section_error = ""
let g:airline_section_warning = ""

" Hide the Nerdtree status line to avoid clutter
let g:NERDTreeStatusline = ''

" Disable vim-airline in preview mode
let g:airline_exclude_preview = 1
