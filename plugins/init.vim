" Check if vim-plug is installed and install if it is not
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent execute "!curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
    autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

" set the runtime path to include Vim-Plug and initialize
filetype off
call plug#begin('~/.config/nvim/plugins/')

"" APPERANCE PLUGINS
Plug 'vim-airline/vim-airline'                                                      " Status Bar
Plug 'vim-airline/vim-airline-themes'                                               " Status Bar Themes

"" COLORSCHEMES
Plug 'flazz/vim-colorschemes'                                                       " Every colorscheme I'll need ever
Plug 'dracula/vim', { 'name': 'dracula' }                                           " Colorscheme for js

"" FILE NAVIGATIONS
Plug 'preservim/nerdtree', { 'on': 'NERDTreeTabsToggle' }                           " Show folders as tree
Plug 'jistr/vim-nerdtree-tabs', { 'on': 'NERDTreeTabsToggle'}                       " Show folders as tree
Plug 'tiagofumo/vim-nerdtree-syntax-highlight', { 'on': 'NERDTreeTabsToggle'}       " NerdTree highlight
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeTabsToggle'}                   " Git in NerdTree
Plug 'ryanoasis/vim-devicons', { 'on': 'NERDTreeTabsToggle'}                        " Show NerdTree icons

Plug 'junegunn/fzf.vim'                                                             " FUZZY FINDER PLUGIN
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }                                 " FUZZY FINDER

"" NOTES PLUGINS
Plug 'preservim/vim-markdown', {'for': ['markdown']}
Plug 'dhruvasagar/vim-table-mode'                                                   " Make table apperance
Plug 'junegunn/goyo.vim', {'for': ['wiki','tex','ipynb', 'markdown']}               " Center all code

"" UTILITIES PLUGINS
Plug 'airblade/vim-gitgutter'                                                       " Show +/-/~ git diff lines
Plug 'terryma/vim-multiple-cursors'                                                 " Multiple cursor
Plug 'tpope/vim-surround'                                                           " Envolve exclamation (), {}, [], ...

Plug 'Yggdroot/indentLine'
Plug 'godlygeek/tabular'

Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }                           " Show colors from hex

"" PYTHON PLUGINS
Plug 'vim-syntastic/syntastic', {'for': 'python'}                                   " Check your syntax on each save
Plug 'nvie/vim-flake8', {'for': 'python'}                                           " PEP 8 checking
Plug 'vim-python/python-syntax', {'for': 'python'}                                  " Syntax highlighting
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"" OTHER LANGUAGES' PLUGINS
Plug 'jalvesaq/Nvim-R', {'for': 'R'}                                                " R compile
Plug 'lervag/vimtex', {'for': 'tex'}                                                " LaTex compile
Plug 'tmux-plugins/vim-tmux', { 'for': 'tmux' }                                     " Tmux highlight

"" DEPRECATED
"Plug 'szymonmaszke/vimpyter', {'for': ['ipynb']}                                    " Display notebook using custom syntax
"Plug 'ap/vim-css-color'
"Plug 'ctrlpvim/ctrlp.vim'
"Plug 'vimwiki/vimwiki', {'for': ['wiki']}                                           " Wiki Editor to link projects
"Plug 'irrationalistic/vim-tasks', {'for': ['todo']}                                 " Tasks plugin
"Plug 'tmhedberg/SimpylFold', {'for': 'python'}                                      " Fold by python syntax
"Plug 'ycm-core/YouCompleteMe', {'for': ['python', 'cpp']}                           " Python Auto-Complete

call plug#end()
filetype plugin indent on   " required
