return {
    "ellisonleao/gruvbox.nvim",
    -- event = { "BufEnter *.py", },
    priority = 500,
    config = true,
    opts = {
        terminal_colors = false, -- add neovim terminal colors
        undercurl = true,
        underline = true,
        bold = true,
        italic = {
            comments = true,
            emphasis = true,
            strings = false,
            operators = false,
            folds = false,
        },
        strikethrough = true,
        -- invert_selection = false,
        -- invert_signs = false,
        -- invert_tabline = true,
        -- invert_intend_guides = false,
        -- inverse = true, -- invert background for search, diffs, statuslines and errors
        contrast = "soft", -- can be "hard", "soft" or empty string
        palette_overrides = {
        },
        overrides = {

            -- General
            -- -------------------------------------------------
            -- SignColumn  = {fg = ""                         },  -- line numbers column background
            -- LineNr      = { fg = "#62605f", bg = "#443F39" }, -- line numbers column foreground
            -- Visual      = {                 bg = "#524B45" },  -- VISUAL Background color, default: #665C54
            NormalNC       = { bg = "#443F39" },  -- Inactive window
            LineNr         = { fg = "#62605f", bg = "#443F39" }, -- line numbers column foreground
            CursorLineNr   = { fg = "#FE9C3A", bg = "#524B45" }, -- line numbers column foreground
            Visual         = { bg = "#787869" },  -- VISUAL Background color, default: #665C54
            Comment        = { fg = "#A79A8C", italic = true },  -- comments, defaults: #928374
            Function       = { fg = "#90C5CF", },  -- function name, defaults: #B8BB26
            TabLineFill    = { bg = "#90C5CF" },
            TabLineSel     = { bg = "#FFFFFF" },
            TabLine        = { bg = "#FFFFFF" },
            MiniTabLineCurrent = { bg = "#FFFFFF" },


            -- Diagnostic Underlines
            -- -------------------------------------------------
            DiagnosticUnderlineError    = { underline = true, undercurl = false },
            DiagnosticSignError         = { fg = "#F77979", bg = nil, bold = false, italic = true },  -- Sign in number column
            DiagnosticFloatingError     = { fg = "#F77979", bg = nil, bold = false, italic = true },  -- Floating window
            DiagnosticVirtualLinesError = { fg = "#F77979", bg = nil, bold = false, italic = true },
            DiagnosticVirtualTextError  = { fg = "#F77979", bg = nil, bold = false, italic = true },  -- Virtual text

            -- DiagnosticUnderlineWarn  = { underline = true, undercurl = false },
            DiagnosticUnderlineWarn    = { bold = true, underline = false, undercurl = false },
            DiagnosticSignWarn         = { fg = "#FFBE59", bg = nil, bold = false, italic = true },
            DiagnosticFloatingWarn     = { fg = "#FFBE59", bg = nil, bold = false, italic = true },
            DiagnosticVirtualLinesWarn = { fg = "#FFBE59", bg = nil, bold = false, italic = true },
            DiagnosticVirtualTextWarn  = { fg = "#FFBE59", bg = nil, bold = false, italic = true },

            DiagnosticUnderlineInfo    = { underline = true, undercurl = false },
            DiagnosticSignInfo         = { fg = "#90C5CF", bg = nil, bold = false, italic = true },
            DiagnosticFloatingInfo     = { fg = "#90C5CF", bg = nil, bold = false, italic = true },
            DiagnosticVirtualLinesInfo = { fg = "#90C5CF", bg = nil, bold = false, italic = true },
            DiagnosticVirtualTextInfo  = { fg = "#90C5CF", bg = nil, bold = false, italic = true },

            DiagnosticUnderlineHint    = { underline = true, undercurl = false },
            DiagnosticSignHint         = { fg = "#A79A8C", bg = nil, bold = false, italic = true },
            DiagnosticFloatingHint     = { fg = "#A79A8C", bg = nil, bold = false, italic = true },
            DiagnosticVirtualLinesHint = { fg = "#A79A8C", bg = nil, bold = false, italic = true },
            DiagnosticVirtualTextHint  = { fg = "#A79A8C", bg = nil, bold = false, italic = true },


            -- Markdown
            -- -------------------------------------------------

            -- Headers
            markdownH1 = { fg = "#FF7800", bg = nil, bold = true, underline = true },
            markdownH2 = { fg = "#ffa351", bg = nil, bold = true, underline = true },
            markdownH3 = { fg = "#feb97b", bg = nil, bold = true, underline = true },
            markdownH4 = { fg = "#fbcda4", bg = nil, bold = true, underline = true },
            markdownH5 = { fg = "#ffe0c5", bg = nil, bold = true, underline = true },
            markdownH6 = { fg = "#ffe0c5", bg = nil, bold = true, underline = true },

            markdownCode      = { fg = "#bdae93", bg = "#524B45" },
            markdownCodeBlock = { fg = nil,       bg = "#524B45", bold = true },
            markdownRule      = { fg = "#A79A8C", bg = nil       },

            markdownTableHead = { fg = "#90C5CF", bg = nil, bold = true },
            Title = { fg = "#90C5CF", bg = nil, bold = true },
            -- markdownTableRow = { },

            -- markdownItalic = { italic = true },
            -- markdownBold = { bold = true },
            -- markdownBoldItalic = { bold = true, italic = true },
            -- markdownCodeDelimiter = { link = "GruvboxAqua" },
            -- markdownBlockquote = { link = "GruvboxGray" },
            -- markdownListMarker = { link = "GruvboxGray" },
            -- markdownOrderedListMarker = { link = "GruvboxGray" },
            -- markdownHeadingRule = { link = "GruvboxGray" },
            -- markdownUrlDelimiter = { link = "GruvboxFg3" },
            -- markdownLinkDelimiter = { link = "GruvboxFg3" },
            -- markdownLinkTextDelimiter = { link = "GruvboxFg3" },
            -- markdownHeadingDelimiter = { link = "GruvboxOrange" },
            -- markdownUrl = { link = "GruvboxPurple" },
            -- markdownUrlTitleDelimiter = { link = "GruvboxGreen" },
            -- markdownLinkText = { underline = true },
            -- markdownIdDeclaration = { link = "markdownLinkText" },
            --
            --
            --

            -- GruvboxBg2 = { bg = "" },  -- Background of bottom no lines
        },
        dim_inactive = false,
        transparent_mode = true,
    },
}
