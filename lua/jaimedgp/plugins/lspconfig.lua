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

            lspconfig.ruff_lsp.setup({})
            lspconfig.markdown_oxide.setup({
                filetypes = { "markdown" },
                root_dir = lspconfig.util.root_pattern(".git", "."),
                settings = {
                    markdown = {
                        lint = true,      -- Enable linting
                        format = true,    -- Enable formatting
                        validate = true,  -- Enable validation/syntax checking
                    },
                },
            })
            lspconfig.pyright.setup({})
            lspconfig.lua_ls.setup({})
            -- lspconfig.r_language_server.setup({})
            lspconfig.dockerls.setup({})
            lspconfig.docker_compose_language_service.setup({})
            lspconfig.bashls.setup({})
            lspconfig.html.setup({})

            -- Show line diagnostics automatically in hover window
            vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]
        end,
    },
    {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v2.x",
        dependencies = {
            -- LSP Support
            { "neovim/nvim-lspconfig" }, -- Required
            -- Autocompletion
            { "hrsh7th/nvim-cmp" }, -- Required
            { "hrsh7th/cmp-nvim-lsp" }, -- Required
            { "L3MON4D3/LuaSnip" }, -- Required
        },
        config = function()
            local lsp = require("lsp-zero")

            lsp.on_attach(function(client, bufnr)
                local opts = { buffer = bufnr, remap = false }

                -- vim.keymap.set(
                --     "n", "gr",
                --     function() vim.lsp.buf.references() end,
                --     vim.tbl_deep_extend("force", opts, { desc = "LSP Goto Reference" })
                -- )
                vim.keymap.set(
                    "n", "gr",
                    function() require("telescope.builtin").lsp_references() end,
                    vim.tbl_deep_extend("force", opts, { desc = "LSP Goto Reference" })
                )
                vim.keymap.set(
                    "n", "gD",
                    function() vim.lsp.buf.definition() end,
                    vim.tbl_deep_extend("force", opts, { desc = "LSP Goto Definition" })
                )
                vim.keymap.set(
                    "n", "gd",
                    function()
                        vim.cmd("vsplit")
                        vim.lsp.buf.definition()
                    end,
                    vim.tbl_deep_extend("force", opts, { desc = "LSP Goto Definition" })
                )
                -- vim.keymap.set(
                --     "n", "K",
                --     function() vim.lsp.buf.hover() end,
                --     vim.tbl_deep_extend("force", opts, { desc = "LSP Hover" })
                -- )
                -- vim.keymap.set(
                --     "n", "<leader>vws",
                --     function() vim.lsp.buf.workspace_symbol() end,
                --     vim.tbl_deep_extend("force", opts, { desc = "LSP Workspace Symbol" })
                -- )
                -- vim.keymap.set(
                --     "n", "<leader>vd",
                --     function() vim.diagnostic.setloclist() end,
                --     vim.tbl_deep_extend("force", opts, { desc = "LSP Show Diagnostics" })
                -- )
                vim.keymap.set(
                    "n", "[d",
                    function() vim.diagnostic.goto_next() end,
                    vim.tbl_deep_extend("force", opts, { desc = "Next Diagnostic" })
                )
                vim.keymap.set("n"
                    , "]d",
                    function() vim.diagnostic.goto_prev() end,
                    vim.tbl_deep_extend("force", opts, { desc = "Previous Diagnostic" })
                )
                -- vim.keymap.set("n"
                --     , "<leader>vca",
                --     function() vim.lsp.buf.code_action() end,
                --     vim.tbl_deep_extend("force", opts, { desc = "LSP Code Action" })
                -- )
                -- vim.keymap.set("n"
                --     , "<leader>vrr",
                --     function() vim.lsp.buf.references() end,
                --     vim.tbl_deep_extend("force", opts, { desc = "LSP References" })
                -- )
                -- vim.keymap.set(
                --     "n", "<leader>vrn",
                --     function() vim.lsp.buf.rename() end,
                --     vim.tbl_deep_extend("force", opts, { desc = "LSP Rename" })
                -- )
                -- vim.keymap.set(
                --     "i", "<C-h>",
                --     function() vim.lsp.buf.signature_help() end,
                --     vim.tbl_deep_extend("force", opts, { desc = "LSP Signature Help" })
                -- )
            end)

            handlers = {
                lsp.default_setup,
                lua_ls = function()
                    local lua_opts = lsp.nvim_lua_ls()
                    require("lspconfig").lua_ls.setup(lua_opts)
                end,
            }
        end,
    }
}
