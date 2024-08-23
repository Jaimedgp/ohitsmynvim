return {
    "ellisonleao/gruvbox.nvim",
    -- event = { "BufEnter *.py", },
    priority = 500,
    config = true,
    opts = {
        terminal_colors = true, -- add neovim terminal colors
        undercurl = true,
        underline = true,
        bold = true,
        italic = {
            strings = false,
            emphasis = false,
            comments = false,
            operators = false,
            folds = false,
        },
        -- strikethrough = true,
        -- invert_selection = false,
        -- invert_signs = false,
        -- invert_tabline = false,
        -- invert_intend_guides = false,
        -- inverse = true, -- invert background for search, diffs, statuslines and errors
        contrast = "hard", -- can be "hard", "soft" or empty string
        -- palette_overrides = {
        -- }
        overrides = {
            -- SignColumn = {fg = ""},  -- line numbers column background
            NormalNC     = {                 bg = "#443F39" },  -- Inactive window
            LineNr       = { fg = "#62605f", bg = "#443F39" }, -- line numbers column foreground
            -- LineNr       = { fg = "#62605f", bg = "#443F39" }, -- line numbers column foreground
            CursorLineNr = { fg = "#FE9C3A", bg = "#524B45" }, -- line numbers column foreground

            Visual   = {                 bg = "#524B45" },  -- VISUAL Background color, default: #665C54
            Comment  = { fg = "#A79A8C",                },  -- comments, defaults: #928374
            Function = { fg = "#90C5CF",                },  -- function name, defaults: #B8BB26

            TabLineFill = { bg = "#90C5CF" },
                -- fg = colors.bg4,   bg = colors.bg1, reverse = config.invert_tabline },
            TabLineSel  = { bg = "#FFFFFF"},  -- { fg = colors.green, bg = colors.bg1, reverse = config.invert_tabline },
            TabLine     = { bg = "#FFFFFF" },  -- { link = "TabLineFill" },

            -- GruvboxBg2 = { bg = "" },  -- Background of bottom no lines
        },
        dim_inactive = true,
        transparent_mode = true,
    },
}
