return {
    "lukas-reineke/indent-blankline.nvim",
    config = function ()
        local highlight = {
            "Rainbow01",
            "Rainbow02",
            "Rainbow03",
            "Rainbow04",
            "Rainbow05",
            "Rainbow06",
            "Rainbow07",
        }

        local hooks = require "ibl.hooks"
        hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
            vim.api.nvim_set_hl(0, "Rainbow01", { fg = "#565451" })
            vim.api.nvim_set_hl(0, "Rainbow02", { fg = "#62605f" })
            vim.api.nvim_set_hl(0, "Rainbow03", { fg = "#6d6c64" })
            vim.api.nvim_set_hl(0, "Rainbow04", { fg = "#787869" })
            vim.api.nvim_set_hl(0, "Rainbow05", { fg = "#848270" })
            vim.api.nvim_set_hl(0, "Rainbow06", { fg = "#8f8f75" })
            vim.api.nvim_set_hl(0, "Rainbow07", { fg = "#9b9b7b" })
        end)
        require('ibl').setup({
            indent = {
                char = ".",
                tab_char = "*",
                highlight = highlight,
            },
            scope = { enabled = false },
            exclude = {
                filetypes = {
                    "help",
                    "alpha",
                    "dashboard",
                    "neo-tree",
                    "Trouble",
                    "trouble",
                    "lazy",
                    "mason",
                    "notify",
                    "toggleterm",
                    "lazyterm",
                },
            },
        })
    end,
    main = "ibl",
}
