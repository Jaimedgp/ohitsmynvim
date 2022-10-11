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

let g:airline_powerline_fonts = 0
let g:airline_theme='bubblegum'
"let g:airline_theme='murmur'
let g:airline_skip_empty_sections = 1
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_left_alt_sep = '|'
let g:airline_right_alt_sep = '|'

let g:airline#extensions#tabline#enable = 1
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''

let g:airline_section_a = airline#section#create(["mode"])
let g:airline_section_b = airline#section#create_left(["%f", "%M"])
let g:airline_section_c = ""

let g:airline_section_x = ""
let g:airline_section_y = airline#section#create_right(["filetype"])
let g:airline_section_z = airline#section#create_right(["%L", "%p%%", "%l:%c"])

let g:airline_section_error = ""
let g:airline_section_warning = ""

" Hide the Nerdtree status line to avoid clutter
let g:NERDTreeStatusline = ''

" Disable vim-airline in preview mode
let g:airline_exclude_preview = 1
