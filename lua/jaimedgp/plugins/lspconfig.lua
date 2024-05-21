return {
    {
        "williamboman/mason-lspconfig.nvim",
        lazy = true,
        config = function()
            require("mason-lspconfig").setup()
        end,
    },
    {
        "neovim/nvim-lspconfig",
        lazy = true,
        config = function()
            local lspconfig = require("lspconfig")

            vim.diagnostic.config({
                virtual_text = {
                   prefix = '●', -- Could be '■', '▎', 'x'
                },
                update_in_insert = false,
                underline = false,
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
                Error = "⠑",  -- " ", "■"
                Warn  = "⠺",  -- " ", "■"", "⌬ "
                Hint  = "⠓",  -- " ", "■"
                Info  = "⠊",  -- " ", "■"
            }
            for type, icon in pairs(signs) do
                local hl = "DiagnosticSign" .. type
                vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
            end

            -- Show line diagnostics automatically in hover window
            -- vim.o.updatetime = 250
            -- vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]

            -- Configure `ruff-lsp`.
            local configs = require 'lspconfig.configs'
            if not configs.ruff_lsp then
                configs.ruff_lsp = {
                    default_config = {
                        cmd = { 'ruff-lsp' },
                        filetypes = { 'python' },
                        root_dir = lspconfig.util.find_git_ancestor,
                        init_options = {
                            settings = {
                                args = {}
                            }
                        }
                    }
                }
            end
            local on_attach = function(client, bufnr)
                local bufopts = { noremap=true, silent=true, buffer=bufnr }
            end

            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            lspconfig.ruff_lsp.setup({
                on_attach = on_attach,
                capabilites = capabilities,
            })
            lspconfig.pyright.setup({
                capabilites = capabilities,
            })
            lspconfig.lua_ls.setup({
                capabilites = capabilities,
            })
            -- lspconfig.r_language_server.setup({
            -- capabilites = capabilities,
            -- })
            lspconfig.dockerls.setup({
                capabilites = capabilities,
            })
            lspconfig.docker_compose_language_service.setup({
                capabilites = capabilities,
            })
            lspconfig.bashls.setup({
                capabilites = capabilities,
            })
            lspconfig.html.setup({
                capabilites = capabilities,
            })
        end,
    },
}
