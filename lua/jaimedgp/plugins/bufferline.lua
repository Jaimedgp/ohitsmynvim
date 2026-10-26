return {
    "akinsho/bufferline.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    enabled = true,
    lazy = false,
    version = "*",
    config = function ()
        local jaimedgp_colors = {
            TabLineFill = vim.api.nvim_get_hl(0, { name = "TabLineFill" }),
            TabLine     = vim.api.nvim_get_hl(0, { name = "TabLine" }),
            TabLineSel  = vim.api.nvim_get_hl(0, { name = "TabLineSel" }),
        }

        require('bufferline').setup({
            options = {
                mode = "tab",
                separator_style = "thin", --slant
                -- themable = true,
                always_show_bufferline = false,
                show_buffer_close_icons = false,
            },
            highlights = {
                fill               = { bg = "#4B4A4A", },
                background         = { fg = "#928374", bg = "#443F39", },
                buffer_selected    = { bg = "#62605f", bold = true, italic = false, },
                indicator_selected = { fg = "NONE"   , bg = "#62605f", },
                separator          = { fg = "#4B4A4A", bg = "#4B4A4A", },
                separator_selected = { fg = "#4B4A4A", bg = "#62605f", },
                modified           = { fg = "#fb4934", bg = "#443F39", },
                modified_selected  = { fg = "#fb4934", bg = "#62605f", },
            }
        })
    end
}
