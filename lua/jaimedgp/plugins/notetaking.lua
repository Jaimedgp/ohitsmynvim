return {
    {
        'MeanderingProgrammer/render-markdown.nvim',
        -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
        -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
        dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
        ---@module 'render-markdown'
        ---@type render.md.UserConfig
        ft = {'markdown'},
        opts = {
            heading = {
                signs = { '󰎤 ', '󰎧 ', '󰎪 ', '󰎭 ', '󰎱 ', '󰎳 ', '󰎶 ', '󰎹 ', '󰎼 ', '󰎿 ' },
                icons = { '󰎤 ', '󰎧 ', '󰎪 ', '󰎭 ', '󰎱 ', '󰎳 ', '󰎶 ', '󰎹 ', '󰎼 ', '󰎿 ' },
                position = 'inline',
                border = false,
                border_virtual = false,
                width = 'block',
                min_width = 40,
                left_margin = 0,
                left_pad = {1, 2, 3, 4, 5, 6, 7, 8, 9},
                backgrounds = {
                    "markdownH1", "markdownH2", "markdownH3", "markdownH4", "markdownH5", "markdownH6",
                },
                foregrounds = {
                    "markdownH1", "markdownH2", "markdownH3", "markdownH4", "markdownH5", "markdownH6",
                },
            },
            indent = { enabled = false },
            dash = {
                width = 80,
                min_width = 80,
                highlight = 'markdownRule',
            },
            bullet = { left_pad = 0.5 },
            quote = {
                repeat_linebreak = true,
                highlight = 'markdownBlockquote',
                win_options = {
                    breakindent = { default = false, rendered = true}
                }
            },
            code = {
                sign = true,
                language_pad = 1,
                width = 'block',
                min_width = 80,
                left_pad = 4,
                right_pad = 4,
                left_margin = 6,
                highlight = 'markdownCodeBlock',
                highlight_inline = 'markdownCode',
                highlight_language = nil,
            },
            paragraph = {
                left_margin = 2,
                min_width = 0,
            },
            link = {
                custom = {
                    python = { pattern = '%.py$', icon = '󰌠 ', highlight = 'RenderMarkdownLink' },
                    markdown = { pattern = '%.md$', icon = ' ', highlight = 'RenderMarkdownLink' },
                    gitlab = { pattern = '.*gitlab.*', icon = ' ', highlight = 'RenderMarkdownLink' },
                    docker = { pattern = '.*Dockerfile.*', icon = ' ', highlight = 'RenderMarkdownLink' },
                    web = { pattern = '^http[s]?://', icon = '󰖟 ', highlight = 'RenderMarkdownLink' },
                },
            },
            pipe_table = {
                style = 'normal',
                head = 'markdownTableHead',
                -- row = 'markdownTableRow',
            },
            checkbox = {
                enabled = true,
                position = 'overlay',
                left_margin = 0.5,
                unchecked = {
                    icon = '󰄰 ',
                    highlight = 'RenderMarkdownUnchecked',
                    scope_highlight = nil,
                },
                checked = {
                    icon = '󰄳 ',
                    highlight = 'RenderMarkdownChecked',
                    scope_highlight = nil,
                },
                custom = {
                    -- todo    = { raw = '[ ]', rendered = ' ', highlight = 'RenderMarkdownTodo', scope_highlight = nil },
                    -- done    = { raw = '[x]', rendered = '󰄯 ', highlight = 'RenderMarkdownTodo', scope_highlight = nil },
                    in_prog = { raw = '[/]', rendered = '󱎖 ', highlight = 'RenderMarkdownTodo', scope_highlight = nil },
                    canc    = { raw = '[-]', rendered = ' ', highlight = 'RenderMarkdownTodo', scope_highlight = nil },
                    posp    = { raw = '[~]', rendered = '󰥔 ', highlight = 'RenderMarkdownTodo', scope_highlight = nil },
                },
            },
        },
    },
    {
        "epwalsh/obsidian.nvim",
        version = "*", -- recommended, use latest release instead of latest commit
        lazy = false,
        -- ft = "markdown",
        -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
        -- event = {
        --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
        --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
        --   "BufReadPre path/to/my-vault/**.md",
        --   "BufNewFile path/to/my-vault/**.md",
        -- },
        dependencies = {
            -- Required.
            "nvim-lua/plenary.nvim",

            -- see below for full list of optional dependencies 👇
        },
        keys = {
            { "<leader>o"  , ":ObsidianNew<CR>", "n" },
            { "<leader>od" , ":ObsidianToday<CR>", "n" },
            { "<leader>ot" , ":ObsidianTomorrow<CR>", "n" },
            { "<leader>oy" , ":ObsidianYesterday<CR>", "n" },
            { "<leader>of" , ":ObsidianQuickSwitch<CR>", "n" },
            { "<leader>otg", ":ObsidianTag<CR>", "n" },
            { "<leader>or" , ":ObsidianBackLinks<CR>", "n" },
        },
        config = function()
            require("obsidian").setup({
                ui = { enable = false },
                workspaces = {
                    { name = "work", path = "~/Documents/Obsidian/Predictia" },
                },
                daily_notes = {
                    -- Optional, if you keep daily notes in a separate directory.
                    folder = "Agenda/daily/",
                    -- Optional, if you want to change the date format for the ID of daily notes.
                    date_format = "%Y-%m-%d",
                    -- Optional, if you want to change the date format of the default alias of daily notes.
                    alias_format = "%Y-%m-%d",
                    -- Optional, if you want to automatically insert a template from your template directory like 'daily.md'
                    template = "YYYY-MM-DD.md",
                },
                -- Optional, for templates (see below).
                templates = {
                    subdir = "~/Documents/Obsidian/Predictia/Templates/",
                    date_format = "%Y-%m-%d",
                    time_format = "%H:%M",
                    -- A map for custom variables, the key should be the variable and the value a function
                    substitutions = {},
                },
                open_notes_in = "vsplit", -- current | vsplit | hsplit
                -- Optional, completion of wiki links, local markdown links, and tags using nvim-cmp.
                completion = {
                    -- Set to false to disable completion.
                    nvim_cmp = true,
                    -- Trigger completion at 2 chars.
                    min_chars = 2,
                },
                mapping = {
                -- -- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
                -- ["og"] = {
                --     action = function()
                --         return require("obsidian").util.gf_passthrough()
                --     end,
                --     opts = { noremap = false, expr = true, buffer = true },
                -- },
                -- -- Toggle check-boxes.
                -- ["<leader>ch"] = {
                --     action = function()
                --         return require("obsidian").util.toggle_checkbox()
                --     end,
                --     opts = { buffer = true },
                -- },
                },
            })
        end,
    },
}
