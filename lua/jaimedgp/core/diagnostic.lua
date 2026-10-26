local virtual_lines_jaimedgp = {
    -- 1. Only show for the line I'm looking at
    current_line = true,
    -- 2. Only show for Errors and Warnings (ignore Hints/Info)
    severity = {
        min = vim.diagnostic.severity.HINT,
    },
    -- 3. Add a bit of padding so it's not glued to the left edge
    spacing = 4,
    -- 4. Add a prefix icon (requires a Nerd Font)
    -- prefix = " ",
    -- 5. Highlight group override (optional)
    -- highlight = "MyCustomLspLineHighlight",
}
local virtual_text_jaimedgp = {
    prefix = ' ', -- Could be '●', '▎', 'x', '■'
    virt_text_pos = 'eol',  -- 'right_align', 'eol', 'inline'
    virt_text_priority = 1000,
    current_line = true,
    -- severity = { min = vim.diagnostic.severity.WARN },
    spacing = 1,
    format = function(diagnostic)
        if diagnostic.severity > vim.diagnostic.severity.WARN then
            return ""
        else
            local lines = vim.split(diagnostic.message, '\n')
            return "-- "..lines[1]
        end
    end,
}

vim.diagnostic.config({
    signs = {
        active = true,
        priority = 70,
        text = {
            [vim.diagnostic.severity.ERROR] = '', --  , "■", "", " ", "⠑"
            [vim.diagnostic.severity.WARN]  = '', --  , "■", "", " ", "⠺"", "⌬ "
            [vim.diagnostic.severity.INFO]  = '', --  , "■", "", " ", "⠓"
            [vim.diagnostic.severity.HINT]  = '', --  , "■", "", " ", "⠊"
        }
    },
    update_in_insert = false,
    underline = true,
    severity_sort = true,
    virtual_lines = false,
    virtual_text = virtual_text_jaimedgp,
    float = false,
        -- {
        --     focusable = false,
        --     style = "minimal",
        --     border = "rounded",
        --     source = "always",
        --     header = "",
        --     prefix = "",
        -- },
})


local diagnostic_mode_enabled = false
vim.g.jaimedgp_toggle_diagnostics_mode = function()
    if diagnostic_mode_enabled then
        vim.diagnostic.config({
            virtual_lines = false,
            virtual_text = virtual_text_jaimedgp,
        })
        print("Less detail on diagnostic")
        diagnostic_mode_enabled = false
    else
        vim.diagnostic.config({
            virtual_lines = virtual_lines_jaimedgp,
            virtual_text = false,
        })
        print("More detail on diagnostic")
        diagnostic_mode_enabled = true
    end
end

