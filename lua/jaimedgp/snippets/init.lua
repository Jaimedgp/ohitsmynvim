require("jaimedgp.snippets.python")
require("jaimedgp.snippets.markdown")
local ls = require("luasnip")

-- Expand or jump to the next placeholder
vim.keymap.set({ "i", "s" }, "<C-l>", function()
    if ls.expand_or_jumpable() then
        ls.expand_or_jump()
    end
end, { silent = true })

-- Jump to the previous placeholde
vim.keymap.set({ "i", "s" }, "<C-h>", function()
    if ls.jumpable(-1) then
        ls.jump(-1)
    end
end, { silent = true })

