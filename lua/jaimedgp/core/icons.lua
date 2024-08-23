vim.diagnostic.config({
    virtual_text = {
        prefix = '', -- Could be '●', '▎', 'x', '■'
        virt_text_pos = 'right_align',
        format = function(diagnostic)
            -- local lines = vim.split(diagnostic.message, '\n')
            -- return lines[1]
            return "---"
        end,
    },
    update_in_insert = false,
    underline = true,
    severity_sort = true,
    float = {
        focusable = false,
        style = "minimal",
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
    },
})

local signs = {
    Error = "",  -- "■", "", " ", "⠑"
    Warn  = "",  -- "■", "", " ", "⠺"", "⌬ "
    Hint  = "",  -- "■", "", " ", "⠓"
    Info  = "",  -- "■", "", " ", "⠊"
}

for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
    -- vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "Noice" })
end

