"""""""""""""""""""""""""""""""
""  INDENT LINE
"""""""""""""""""""""""""""""""
"let g:indentLine_setColors = 0
let g:indentLine_defaultGroup = 'Comment'
let g:indentLine_color_term = 59
let g:indentLine_char = '·'

"""""""""""""""""""""""""""""""
""  GOYO
"""""""""""""""""""""""""""""""
let g:goyo_width=150
let g:goyo_height=90

"""""""""""""""""""""""""""""""
""  TABLE-MODE CONFIG
"""""""""""""""""""""""""""""""
let g:table_mode_corner='+'
let g:table_mode_corner_corner='+'
let g:table_mode_header_fillchar='='

function! s:isAtStartOfLine(mapping)
    let text_before_cursor = getline('.')[0 : col('.')-1]
    let mapping_pattern = '\V' . escape(a:mapping, '\')
    let comment_pattern = '\V' . escape(substitute(&l:commentstring, '%s.*$', '', ''), '\')

    return (text_before_cursor =~? '^' . ('\v(' . comment_pattern . '\v)?') . '\s*\v' . mapping_pattern . '\v$')
endfunction

inoreabbrev <expr> <bar><bar>
        \ <SID>isAtStartOfLine('\|\|') ?
    \ '<c-o>:TableModeEnable<cr><bar><space><bar><left><left>' : '<bar><bar>'
inoreabbrev <expr> __
            \ <SID>isAtStartOfLine('__') ?
            \ '<c-o>:silent! TableModeDisable<cr>' : '__'

"""""""""""""""""""""""""""""""
""  NERDTREE CONFIG
"""""""""""""""""""""""""""""""
"" Change NERDTree open command
map <C-f> :NERDTreeTabsToggle<CR>
"" Ignore files in NERDTree
let NERDTreeIgnore=['\.pyc$', '\~$']
"" How can I close vim if the only window left open is a NERDTree?
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
nmap <Leader>r :NERDTreeFocus<cr>R<c-w><c-p>

"""""""""""""""""""""""""""""""
""  COQ
"""""""""""""""""""""""""""""""
let g:coc_global_extensions = ['coc-pyright', 'coc-json']


" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

"""""""""""""""""""""""""""""""
""  HEXOKINASE COLORS
"""""""""""""""""""""""""""""""
let g:Hexokinase_highlighters = [ 'virtual' ]
