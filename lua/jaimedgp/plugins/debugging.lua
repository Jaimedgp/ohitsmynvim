return {
    {
        "mfussenegger/nvim-dap",
        lazy = true,
        dependencies = {
            "rcarriga/nvim-dap-ui",
            "nvim-neotest/nvim-nio",
            "mfussenegger/nvim-dap-python",
        },
        keys = {
            { "<Leader>db", ":DapToggleBreakpoint<CR>", mode = "n" },
            { "<Leader>dc", ":DapContinue<CR>",         mode = "n" },
            { "<Leader>ds", ":DapTerminate<CR>",        mode = "n" },
        },
        config = function()
            local dap = require("dap")

            -- Dap-UI
            local dapui = require("dapui")
            dapui.setup()

            vim.api.nvim_set_hl(0, "DapBreakpointNumber", { ctermbg = 0, bg = "#F44B39"})
            vim.api.nvim_set_hl(0, "DapBreakpointIcon", { ctermbg = 0, bg = "#F44B39" })
            vim.api.nvim_set_hl(0, "DapBreakpointLine", { underline = true })
            vim.api.nvim_set_hl(0, "DapLogPoint", { ctermbg = 0, fg = "#61cfef" })
            vim.api.nvim_set_hl(0, "DapLogPointIcon", { ctermbg = 0, bg = "#61cfef" })
            vim.api.nvim_set_hl(0, "DapStopped", { ctermbg = 0, fg = "#98c379" })
            vim.api.nvim_set_hl(0, "DapStoppedIcon", { ctermbg = 0, bg = "#98c379" })

            vim.fn.sign_define(
                "DapBreakpoint",
                { text = "", texthl = "DapBreakpointIcon", linehl = "DapBreakpointLine", numhl = "DapBreakpointNumber" }
            )
            vim.fn.sign_define(
                "DapBreakpointCondition",
                { text = "󰟃", texthl = "DapBreakpointIcon", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
            )
            vim.fn.sign_define(
                "DapBreakpointRejected",
                { text = "", texthl = "DapBreakpointIcon", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
            )
            vim.fn.sign_define(
                "DapLogPoint",
                { text = "", texthl = "DapLogPointIcon", linehl = "DapLogPoint", numhl = "DapLogPoint" }
            )
            vim.fn.sign_define(
                "DapStopped",
                { text = "", texthl = "DapStoppedIcon", linehl = "DapStopped", numhl = "DapStopped" }
            )

            dap.listeners.before.attach.dapui_config = function()
                dapui.open()
            end
            dap.listeners.before.launch.dapui_config = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated.dapui_config = function()
                dapui.close()
            end
            dap.listeners.before.event_exited.dapui_config = function()
                dapui.close()
            end

            -- Python debugger
            local dappython = require("dap-python")

            dappython.setup("~/.config/.virtualenvs/debugpy/bin/python")
            dappython.test_runner = "pytest"
        end,
    },
}
