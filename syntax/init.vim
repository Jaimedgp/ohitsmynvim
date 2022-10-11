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
