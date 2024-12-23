return {
    {
        "nvimtools/none-ls.nvim",
        config = function()
            local null_ls = require("null-ls")

            null_ls.setup({
                sources = {
                    null_ls.builtins.formatting.ruff,
                    null_ls.builtins.diagnostics.ruff,

                    null_ls.builtins.formatting.stylua,
                    null_ls.builtins.diagnostics.lua_ls,

                    null_ls.builtins.diagnostics.r_language_server,

                    null_ls.builtins.diagnostics.dockerls,
                    null_ls.builtins.diagnostics.docker_compose_language_service,

                    null_ls.builtins.diagnostics.bashls,
                    null_ls.builtins.diagnostics.html,
                    null_ls.builtins.diagnostics.cssls,
                }
            })

            vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, {})
        end,
    },
}
