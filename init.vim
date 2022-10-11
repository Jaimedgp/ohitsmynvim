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
"                                                                       Jaimedgp    October 1, 2022


source $HOME/.config/nvim/plugins/init.vim          " VIM-PLUG CONFIGURATION

source $HOME/.config/nvim/config/options.vim        " GLOBAL NVIM OPTIONS

source $HOME/.config/nvim/config/commands.vim       " REMAP COMMANDS

source $HOME/.config/nvim/config/statusline.vim     " STATUSLINE

source $HOME/.config/nvim/syntax/init.vim           " SYNTAXIS

source $HOME/.config/nvim/plugins/config.vim        " PLUGINS CONFIGURATION

"  VIM CONFIGURATION
autocmd BufWritePre * %s/\s\+$//e

let g:loaded_python3_provider=0
let g:loaded_python_provider=0
let g:python_highlight_all=1
