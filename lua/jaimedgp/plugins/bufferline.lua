return {
    "akinsho/bufferline.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = true,
    version = "*",
    opts = {
        options = {
            mode = "tabs",
            separator_style = "slant",
            themable = true,
            always_show_bufferline = false,
        },
    },
}
