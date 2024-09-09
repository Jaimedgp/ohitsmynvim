return {
    {
        "williamboman/mason-lspconfig.nvim",
        lazy = false,
        config = function()
            require("mason-lspconfig").setup()
        end,
    },
    {
        "neovim/nvim-lspconfig",
        lazy = true,
        opts = {
            servers = {
                ruff_lsp = {
                    -- default_config = {
                    --     cmd = { 'ruff-lsp' },
                    --     filetypes = { 'python' },
                    --     root_dir = lspconfig.util.find_git_ancestor,
                    --     init_options = {
                    --         settings = {
                    --             args = {}
                    --         }
                    --     }
                    -- }
                },
                pyright = {
                    settings = {
                        python = {
                            analysis = {
                                autoImportCompletions = true,
                                typeCheckingMode = "on",
                                autoSearchPaths = true,
                                useLibraryCodeForTypes = true,
                                diagnosticMode = "workspace", -- "openFilesOnly",
                            },
                        },
                    },
                },
            },
            setup = {
                pyright = function(_, _)
                    local lsp_utils = require "base.lsp.utils"
                    lsp_utils.on_attach(function(client, bufnr)
                        local map = function(mode, lhs, rhs, desc)
                            if desc then
                                desc = desc
                            end
                            vim.keymap.set(mode, lhs, rhs, { silent = true, desc = desc, buffer = bufnr, noremap = true })
                        end
                        -- stylua: ignore
                        if client.name == "pyright" then
                            map("n", "<leader>lo", "<cmd>PyrightOrganizeImports<cr>",  "Organize Imports" )
                            map("n", "<leader>lC", function() require("dap-python").test_class() end,  "Debug Class" )
                            map("n", "<leader>lM", function() require("dap-python").test_method() end,  "Debug Method" )
                            map("v", "<leader>lE", function() require("dap-python").debug_selection() end, "Debug Selection" )
                        end
                    end)
                end,
            },
        },
        config = function(_, opts)
            local lspconfig = require("lspconfig")

            -- Show line diagnostics automatically in hover window
            vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]

            -- Configure `ruff-lsp`.
            -- local configs = require 'lspconfig.configs'
            -- if not configs.ruff_lsp then
            --     configs.ruff_lsp = {
            --     }
            -- end
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


-- {
--     "neovim/nvim-lspconfig",
--   },
