 return {
    {
        "mason-org/mason.nvim",
        opts = {}
    },
    {
        "williamboman/mason-lspconfig.nvim",
        lazy = false,
        enable = true,
        dependencies = {"mason-org/mason.nvim"},
        config = function()
            require("mason-lspconfig").setup()
        end,
    },
    {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        config = function()
            require("mason-tool-installer").setup({
                ensure_installed = {
                    -- LUA
                    "lua_ls", -- LSP
                    "stylua", -- formatting

                    -- Python
                    "pyright", -- LSP
                    "ruff", -- diagnostic
                    "debugpy",

                    -- R
                    "r_language_server", -- LSP
                    -- -- "format_r",  -- formatting
                    -- -- "styler",  -- formatting

                    -- Docker
                    "dockerls", -- LSP
                    "docker_compose_language_service", -- LSP

                    -- Terminal
                    "bashls", -- LSP

                    -- -- Web Development
                    "html", -- LSP
                    "cssls", -- LSP
                }
            })
        end,
    },
}
