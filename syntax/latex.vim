colorscheme solarized8_light_low

let &rtp  = '~/.config/nvim/plugged/vimtex,' . &rtp
let &rtp .= ',~/.config/nvim/plugged/vimtex/after'

set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=100

set foldmethod=indent
set foldnestmax=10
"set nofoldenable
set foldlevel=2

let g:tex_flavor='latex'
"let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=2
let g:tex_conceal='abdmg'
