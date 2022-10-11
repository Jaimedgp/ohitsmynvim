"         v              m
"       vvvvv            mmm
"     nvvvvvvvv          mmmmm
"    nnnnnvvvvvvv        mmmmmm
"    nnnnnnvvvvvvvv      mmmmmm
"    nnnnnn  vvvvvvvv    mmmmmm
"    nnnnnn    vvvvvvvv  mmmmmm    eeeeeee       ooooooo  vvvvv   vvvvv iiiii mmmmm mmmmm  mmmmmm
"    nnnnnn      vvvvvvv mmmmmm   eee   eee     ooo   ooo   vvv     vvv   iii   mmmm    mmmm    mmm
"    nnnnnn        vvvvvvmmmmmm  eee     eee   ooo     ooo  vvv     vvv   iii   mmm     mmm     mmm
"    nnnnnn          vvvvmmmmmm eeeeeeeeeeeee ooo       ooo vvv     vvv   iii   mmm     mmm     mmm
"     nnnnn            vvmmmmm   eee           ooo     ooo  vvv    vvv    iii   mmm     mmm     mmm
"       nnn             vmmm      eee   eee     ooo   ooo   vvv   vvv     iii   mmm     mmm     mmm
"         n              m         eeeeeee       ooooooo    vvvvvvv       iii   mmm     mmm     mmm
"
"                                                                           Jaimedgp    May 1, 2020
"


"""""""""""""""""""""""""""""""
""  VIM-PLUG CONFIGURATION
"""""""""""""""""""""""""""""""

source $HOME/.config/nvim/plugins/init.vim


"""""""""""""""""""""""""""""""
""  GLOBAL NVIM OPTIONS
"""""""""""""""""""""""""""""""

let g:loaded_python3_provider=0
let g:loaded_python_provider=0
let g:python_highlight_all=1

"""""""""""""""""""""""""""""""
""  GLOBAL NVIM OPTIONS
"""""""""""""""""""""""""""""""
source $HOME/.config/nvim/config/options.vim

source $HOME/.config/nvim/config/commands.vim

"""""""""""""""""""""""""""""""
""  COLORSCHEMES
"""""""""""""""""""""""""""""""

"" COLORSCHEMES
"autocmd BufEnter *  colorscheme spring-night, crayon, quantum, quantum, molokai, monokai
autocmd BufEnter * colorscheme tender
autocmd BufEnter *.cpp colorscheme nova
autocmd BufEnter *.sql colorscheme solarized8_dark_low
autocmd BufEnter *.vim colorscheme blackdust
autocmd BufEnter *.R colorscheme blackdust "crayon
autocmd BufEnter *.ipynb colorscheme bubblegum-256-light
autocmd BufEnter *.sh colorscheme quantum
autocmd BufRead,BufEnter NERD_tree_* colorscheme nord

autocmd BufEnter *.js colorscheme dracula
autocmd BufEnter *.html colorscheme neodark
autocmd BufRead,BufEnter *.css colorscheme nordisk

" EXTENSION SYNTAX
autocmd BufEnter *.py source $HOME/.config/nvim/syntax/python.vim
autocmd BufEnter *.todo source $HOME/.config/nvim/syntax/todo.vim

autocmd BufEnter *.wiki source $HOME/.config/nvim/syntax/readme.vim
autocmd BufEnter *.tex source $HOME/.config/nvim/syntax/latex.vim
autocmd BufEnter *.md source $HOME/.config/nvim/syntax/readme.vim


"""""""""""""""""""""""""""""""
""  VIM CONFIGURATION
"""""""""""""""""""""""""""""""

autocmd BufWritePre * %s/\s\+$//e

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
""  STATUSLINE
"""""""""""""""""""""""""""""""
source $HOME/.config/nvim/config/statusline.vim

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
