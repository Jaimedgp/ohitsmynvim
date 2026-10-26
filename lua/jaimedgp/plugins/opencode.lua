return {
    {
    "nickjvandyke/opencode.nvim",
    version = "*",
    dependencies = {
        {
        "folke/snacks.nvim",
        optional = true,
        opts = {
            -- (Tu configuración de snacks se mantiene igual...)
            picker = {
            actions = {
                opencode_send = function(...) return require("opencode").snacks_picker_send(...) end,
            },
            win = {
                input = {
                keys = {
                    ["<a-a>"] = { "opencode_send", mode = { "n", "i" } },
                },
                },
            },
            },
        },
        },
    },
    config = function()
        vim.g.opencode_opts = {
        -- Your configuration, if any; goto definition on the type for details
            server = {
                url = nil,
                username = "secret", -- Same env vars and defaults as OpenCode
                password = "secret",
                start = function()
                vim.cmd("vsplit term://0.0.0.0:4096 | wincmd p")
                end,
            },
        }

        vim.o.autoread = true

        -- Mapeos de teclas (Tus mapeos originales...)
        local opencode = require("opencode")
        vim.keymap.set({ "n", "x" }, "<leader>a", function() opencode.ask("@this: ", { submit = true }) end, { desc = "Ask opencode…" })
        vim.keymap.set({ "n", "x" }, "<leader>x", function() opencode.select() end, { desc = "Execute opencode action…" })
        vim.keymap.set({ "n", "t" }, "<leader>.", function() opencode.toggle() end, { desc = "Toggle opencode" })

        -- Operadores y Scroll
        vim.keymap.set({ "n", "x" }, "go",  function() return opencode.operator("@this ") end, { desc = "Add range", expr = true })
        vim.keymap.set("n", "goo", function() return opencode.operator("@this ") .. "_" end, { desc = "Add line", expr = true })
        vim.keymap.set("n", "<S-C-u>", function() opencode.command("session.half.page.up") end, { desc = "Scroll up" })
        vim.keymap.set("n", "<S-C-d>", function() opencode.command("session.half.page.down") end, { desc = "Scroll down" })

        -- Fix para increment/decrement
        vim.keymap.set("n", "+", "<C-a>", { desc = "Increment", noremap = true })
        vim.keymap.set("n", "-", "<C-x>", { desc = "Decrement", noremap = true })
    end,
    }
}
