vim.diagnostic.config({
    virtual_text = {
        prefix = '', -- Could be '●', '▎', 'x', '■'
        virt_text_pos = 'right_align',
        format = function(diagnostic)
            -- local lines = vim.split(diagnostic.message, '\n')
            -- return "-- "..lines[1]
            return "---"
        end,
    },
    signs = true,
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

vim.api.nvim_create_autocmd({"CursorHold","CursorHoldI"}, {
    callback = function()
        vim.diagnostic.open_float(nil, {})
    end,
})

