local map=vim.keymap.set

-- Navigate buffers|tabs|quickfix|loclist
for k, v in pairs({
  b = { cmd = "b", desc = "buffer" },
  t = { cmd = "tab", desc = "tab" },
  -- q = { cmd = "c", desc = "quickfix" },
  -- l = { cmd = "l", desc = "location" },
}) do
  map("n", "[" .. k:lower(), "<cmd>" .. v.cmd .. "previous<CR>", { desc = "Previous " .. v.desc })
  map("n", "]" .. k:lower(), "<cmd>" .. v.cmd .. "next<CR>", { desc = "Next " .. v.desc })
  map("n", "[" .. k:upper(), "<cmd>" .. v.cmd .. "first<CR>", { desc = "First " .. v.desc })
  map("n", "]" .. k:upper(), "<cmd>" .. v.cmd .. "last<CR>", { desc = "Last " .. v.desc })
end

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
-- map("n", "<leader>i", ":lua vim.diagnostic.open_float(nil, {})<CR>", {})

-------------------------------------
-- LSP KEYMAPS
-------------------------------------

local opts = { noremap = true, silent = true }
local lsp = vim.lsp.buf

-- Go to Definition
map('n', 'gd',
    function()
        vim.cmd("vsplit")
        lsp.definition()
    end, opts
)
-- Go to References
map("n", "gr",
    function() require("telescope.builtin").lsp_references() end,
    vim.tbl_deep_extend("force", opts, { desc = "LSP Goto Reference" })
)

-- Go to Declaration
-- map('n', 'gD', lsp.declaration, opts)
-- Other useful LSP keymaps
-- map('n', 'K', lsp.hover, opts)          -- Show hover documentation
-- map('n', 'gi', lsp.implementation, opts) -- Go to Implementation(s)
