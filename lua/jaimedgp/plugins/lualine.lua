return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons", "SmiteshP/nvim-navic" },
    priority = 1000,
    config = function()
        local lualine = require("lualine")
        local lazy_status = require("lazy.status") -- to configure lazy pending updates count
        local gps = require("nvim-navic")

        -- Define custom mode names
        local mode_names = {
            ["n"] = "N",    -- NORMAL
            ["i"] = "I",    -- INSERT
            ["v"] = "V",    -- VISUAL
            ["V"] = "VL",   -- V-LINE
            [""] = "VB",  -- V-BLOCK
            ["R"] = "R",    -- REPLACE
            ["c"] = "C",    -- COMMAND-LINE
            ["t"] = "T",    -- TERMINAL
        }

        -- First Colorscheme
        local jaime = {
            -- TMUX               -- NEOVIM
            r_ed    = '#FC3939',  -- r_ed    = '#EA8A8A',
            o_range = '#FE9C3A',  -- o_range = '#EAB48A',
            y_ellow = '#FBF885',
            g_reen  = '#65FF4C',  -- g_reen  = '#90EA8A',
            c_ian   = '#56C6FD',  -- c_ian   = '#8AE6EA',
            b_lue   = '#8A8DEA',  -- b_lue   = '#8A8DEA',
            p_urple = '#DD96FF',  -- p_urple = '#CE8AEA',
            p_ink   = '#fF5BFF',  -- p_ink   = '#EA8AE3',

            w_hite  = '#FFFFFF',
            g_ray25 = '#C0C0C0',
            g_ray50 = '#808080',
            g_ray75 = '#404040',
            b_lack  = '#000000',
        }

        local jaimedgp_themes = {

            -- NORMAL
            normal = {
                a = { fg = jaime.g_ray75, bg = jaime.o_range },
                b = { fg = jaime.g_ray75, bg = jaime.c_ian },
                c = { fg = jaime.g_ray25, bg = 'default' },
            },

            insert  = { a = { fg = jaime.g_ray75, bg = jaime.g_reen } },
            visual  = { a = { fg = jaime.g_ray75, bg = jaime.b_lue } },
            replace = { a = { fg = jaime.g_ray75, bg = jaime.y_ellow } },

            inactive = {
                c = { fg = jaime.g_ray25, bg = "default" },
                x = { fg = jaime.g_ray25, bg = "default" },
            },
        }
        require("lualine").setup {
            options = {
                icons_enabled = true,
                theme = jaimedgp_themes,
                component_separators = { left = "|", right = "|" },
                section_separators = { left = "", right = "" },
                -- component_separators = { left = "", right = "" },
                -- section_separators = { left = "", right = "" },
                disabled_filetypes = {},
                always_divide_middle = false,
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = { "branch", "filename" },
                lualine_x = { "location" },
                lualine_y = {},
                lualine_z = {},
            },
            sections = {
                lualine_a = { function ()
                    return mode_names[vim.api.nvim_get_mode().mode] or "__" 
                end},
                lualine_b = { 
                    {
                        "filename",
                        file_status = true,      -- Displays file status (readonly status, modified status)
                        newfile_status = false,  -- Display new file status (new file means no write after created)
                        path = 0,                -- 0: Just the filename
                                                -- 1: Relative path
                                                -- 2: Absolute path
                                                -- 3: Absolute path, with tilde as the home directory
                                                -- 4: Filename and parent dir, with tilde as the home directory

                        shorting_target = 40,    -- Shortens path to leave 40 spaces in the window
                                                -- for other components. (terrible name, any suggestions?)
                        symbols = {
                            modified = '+',      -- Text to show when the file is modified.
                            readonly = '-',      -- Text to show when the file is non-modifiable or readonly.
                            unnamed = '...',     -- Text to show for unnamed buffers.
                            newfile = '*',       -- Text to show for newly created file before first write, "filetype" 
                        },
                    },
                    "branch" 
                },
                lualine_c = { "diff", },
                lualine_x = { "filetype", },
                lualine_y = { {
                    'diagnostics',

                    -- Table of diagnostic sources, available sources are:
                    --   'nvim_lsp', 'nvim_diagnostic', 'nvim_workspace_diagnostic', 'coc', 'ale', 'vim_lsp'.
                    -- or a function that returns a table as such:
                    --   { error=error_cnt, warn=warn_cnt, info=info_cnt, hint=hint_cnt }
                    sources = { 'nvim_diagnostic', 'coc' },

                    -- Displays diagnostics for the defined severity types
                    sections = { 'error', 'warn', 'info', 'hint' },

                    diagnostics_color = {
                        -- Same values as the general color option can be used here.
                        error = 'DiagnosticError', -- Changes diagnostics' error color.
                        warn  = 'DiagnosticWarn',  -- Changes diagnostics' warn color.
                        info  = 'DiagnosticInfo',  -- Changes diagnostics' info color.
                        hint  = 'DiagnosticHint',  -- Changes diagnostics' hint color.
                    },
                    symbols = {error = '', warn = '', info = '', hint = '󰌵'},
                    colored = false,           -- Displays diagnostics status in color if set to true.
                    update_in_insert = false,  -- Update diagnostics in insert mode.
                    always_visible = false,    -- Show diagnostics even if there are none.
                    } },
                lualine_z = { "progress", "location" },
            },
            tabline = {},
            extensions = {
            },
        }
    end,
}
