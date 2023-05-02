syntax on

set termguicolors           " Activa true colors en la terminal

set noshowmode              " Don't show mode
set ttimeoutlen=10          " faster timeout for escape key and others
set fileformat=unix
set mouse=n

"" IDENTATION OPTIONS
set autoindent              " New lines inherit the indentation of previous lines
set smartindent             " Even better autoindent
set expandtab               " Convert tabs to spaces
set shiftround              " Round the indentation to the nearest multiple of shiftwidth
set smarttab                " Insert “tabstop” number of spaces when the “tab” key is pressed.
set shiftwidth=4            " When shifting, indent using four spaces.
set tabstop=4               " Indent using four spaces.

"" TEXT RENDERING OPTIONS
set encoding=utf-8          " Use an encoding that supports unicode.
set linebreak               " Avoid wrapping a line in the middle of a word.
set spelllang=en_gb,es      " Set spell-checker language to EN-UK, ES-ES


"" CODE FOLDING OPTIONS
set foldmethod=indent       " Fold based on indention levels.
set foldnestmax=3           " Only fold up to three nested levels.
set foldlevel=1             " Just fold up to  level
set nofoldenable             Disable folding by default.

"" RULER NUMERS
set laststatus=0            " Always display the status bar.
set number                  " Show line numbers on the sidebar. Set current line absolute number
set ruler                   " Always show cursor position.
set relativenumber          " Show line number on the current line and relative numbers on all other lines.
set cursorline              " Highlight the line currently under cursor.
set colorcolumn=0           " Disable colorcolumn by default


"" MISCELLANEOUS OPTIONS
set formatoptions+=j        " Delete comment characters when joining lines.
set history=1000            " Increase the undo limit.
set wildignore+=.pyc,.swp   " Ignore files matching these patterns when opening files based on a glob pattern.
set clipboard=unnamed       " Use system clipboard
set splitbelow              " Horizontal split below
set splitright              " Vertical split right
