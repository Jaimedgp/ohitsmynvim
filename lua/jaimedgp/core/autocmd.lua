-- Function to ask for confirmation and format the file if confirmed
local function ask_and_format()
    local choice = vim.fn.confirm("Do you want to format this file?", "&Yes\n&No", 1)
    if choice == 1 then  -- User presses Yes
        -- Format the file (this works if LSP is enabled, for example)
        if vim.lsp.buf.formatting then
            vim.lsp.buf.formatting()
        elseif vim.lsp.buf.format then
            vim.lsp.buf.format()
        else
            print("No formatting function available.")
        end
    end
end

vim.api.nvim_create_autocmd({"BufWritePre"},{
    -- pattern = { "*" },
    command = [[%s/\s\+$//e]],
})

-- Autocommand: Trigger on file save
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.py",  -- Applies to all filetypes
    callback = ask_and_format,  -- Call the function on save
})

