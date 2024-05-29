return {
    "rcarriga/nvim-notify",
    config = function ()
        require("notify").setup({
            background_colour = "#000000",
            max_width = 100,
            max_height = 250,
            render = "wrapped-compact",
        })
        vim.notify = require("notify")
    end
}
