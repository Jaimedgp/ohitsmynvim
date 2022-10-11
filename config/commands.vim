"""""""""""""""""""""""""""""""
""  REMAP NVIM COMMANDS
"""""""""""""""""""""""""""""""

"" FOLDING
"" Enable folding with the spacebar
"nnoremap <space> za


"" SPLIT NAVIGATIONS
nnoremap <C-y> 10<C-y>
nnoremap <C-e> 10<C-e>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"" RESIZE SPLITS
nnoremap <C-Right> :exe "vertical resize +5"<CR>
nnoremap <C-Left> :exe "vertical resize -5"<CR>
nnoremap <C-Up> :exe "resize +5"<CR>
nnoremap <C-Down> :exe "resize -5"<CR>

"" ADD BLANK LINE
nnoremap <M-Enter> O<ESC>
nnoremap <Enter> o<ESC>

