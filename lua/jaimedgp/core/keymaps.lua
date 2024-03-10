local map=vim.keymap.set

-------------------------------------
-- WINDOWS NAVIGATION
-------------------------------------
map("n", '<C-y>', '10<C-y>')
map("n", '<C-e>', '10<C-e>')
map("n", '<C-h>', '<C-W><C-h>')
map("n", '<C-j>', '<C-W><C-j>')
map("n", '<C-k>', '<C-W><C-k>')
map("n", '<C-l>', '<C-W><C-l>')

-------------------------------------
-- RESIZE WINDOWS
-------------------------------------
map("n", '<C-Right>', ':vertical resize +5<CR>')
map("n", '<C-Left>',  ':vertical resize -5<CR>')
map("n", '<C-Up>',    ':resize +5<CR>')
map("n", '<C-Down>',  ':resize -5<CR>')

-------------------------------------
-- ADD BLANK LINES
-------------------------------------
map("n", '<Enter>', 'o<ESC>')
map("n", '<M-Enter>', 'O<ESC>')

-------------------------------------
-- SEARCH
-------------------------------------
-- Center search results
map("n", "n", "nzz", default_opts)
map("n", "N", "Nzz", default_opts)

-- Cancel search highlighting with ESC
map("n", "<ESC>", ":nohlsearch<Bar>:echo<CR>", default_opts)

-- Show diagnostics
map("n", "<leader>i", ":lua vim.diagnostic.open_float(nil, {focus=false, scope='cursor'})<CR>", default_opts)
