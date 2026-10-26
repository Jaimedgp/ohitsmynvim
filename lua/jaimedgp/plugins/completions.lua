return {
    { "hrsh7th/cmp-nvim-lsp", },
    { "saadparwaiz1/cmp_luasnip" },
    {
        "L3MON4D3/LuaSnip",
        dependencies = { "saadparwaiz1/cmp_luasnip", },
    },
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
        },
        config = function()
            -- Set up nvim-cmp.
            local cmp = require('cmp')

            cmp.setup({
                experimental = {
                    ghost_text = true,
                },
                snippet = {
                    -- REQUIRED - you must specify a snippet engine
                    expand = function(args)
                        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                    end,
                },
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                sorting = {
                    comparators = {
                        cmp.config.compare.recently_used,
                        cmp.config.compare.locality,
                        cmp.config.compare.score,
                        cmp.config.compare.offset,
                        cmp.config.compare.exact,
                        cmp.config.compare.kind,
                        cmp.config.compare.length,
                    },
                },
                formatting = {
                    format = function(entry, vim_item)
                        -- Definimos un nombre amigable para cada fuente
                        local menu_icon = {
                            nvim_lsp = '[LSP]',
                            luasnip  = '[Snip]',
                            buffer   = '[Buf]',
                            path     = '[Path]',
                        }

                        -- Asignamos el nombre a la parte de la derecha (menu)
                        vim_item.menu = menu_icon[entry.source.name]

                        return vim_item
                    end,
                    duplicates = {
                        nvim_lsp = 0,
                        luasnip = 0,
                        buffer = 0,
                        path = 0,
                    }
                },
                mapping = cmp.mapping.preset.insert({
                    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-d>'] = cmp.mapping.scroll_docs(4),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    -- ['<C-e>'] = cmp.mapping.abort(),
                    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                }),
                sources = cmp.config.sources({
                    { name = 'path',     priority = 100 },
                    { name = 'luasnip',  priority = 90 }, -- For luasnip users.
                    {
                    name = 'nvim_lsp',
                    priority = 80,
                    entry_filter = function (entry, ctx)
                        return require('cmp.types').lsp.CompletionItemKind[entry:get_kind()] ~= 'Text'
                    end
                    },
                    { name = 'buffer',   priority = 70 },
                })
            })
        end,
    },
}
