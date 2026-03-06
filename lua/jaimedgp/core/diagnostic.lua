local virtual_lines_jaimedgp = {
    -- 1. Only show for the line I'm looking at
    current_line = true,
    -- 2. Only show for Errors and Warnings (ignore Hints/Info)
    severity = {
        min = vim.diagnostic.severity.WARN,
    },
    -- 3. Add a bit of padding so it's not glued to the left edge
    spacing = 2,
    -- 4. Add a prefix icon (requires a Nerd Font)
    -- prefix = " ",
    -- 5. Highlight group override (optional)
    -- highlight = "MyCustomLspLineHighlight",
}
local virtual_text_jaimedgp = {
    prefix = ' ', -- Could be '●', '▎', 'x', '■'
    virt_text_pos = 'eol',  -- 'right_align', 'eol', 'inline'
    current_line = true,
    format = function(diagnostic)
        local lines = vim.split(diagnostic.message, '\n')
        return "-- "..lines[1]
        -- return "---"
    end,
}

local diagnostic_mode_enabled = false


vim.diagnostic.config({
    virtual_lines = false,
    virtual_text = virtual_text_jaimedgp,
    signs = {
        active = true,
        text = {
            [vim.diagnostic.severity.ERROR] = '', -- 
            [vim.diagnostic.severity.WARN] = '', -- 
            [vim.diagnostic.severity.INFO] = '', -- 
            [vim.diagnostic.severity.HINT] = '', -- 
        }
    },
    update_in_insert = false,
    underline = true,
    severity_sort = true,
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

vim.g.jaimedgp_toggle_diagnostics_mode = function()
    if diagnostic_mode_enabled then
        vim.diagnostic.config({
            virtual_lines = virtual_lines_jaimedgp,
            virtual_text = false,
        })
        print("Virtual Lines: ON")
        diagnostic_mode_enabled = false
    else
        vim.diagnostic.config({
            virtual_lines = false,
            virtual_text = virtual_text_jaimedgp,
        })
        print("Virtual Lines: OFF")
        diagnostic_mode_enabled = true
    end
end

