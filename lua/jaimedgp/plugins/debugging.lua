return {
    {
        "mfussenegger/nvim-dap",
        lazy = false,
        dependencies = {
            "rcarriga/nvim-dap-ui",
            "nvim-neotest/nvim-nio",
            "mfussenegger/nvim-dap-python",
        },
        config = function()
            local dap = require("dap")
            local dapui = require("dapui")
            local dap_python = require("dap-python")
            local mason_path = vim.fn.glob(vim.fn.stdpath("data") .. "/mason/")
            dap_python.setup(mason_path .. "packages/debugpy/venv/bin/python")
            table.insert(require('dap').configurations.python, {
                type = 'python',
                request = 'launch',
                name = 'Launch file with arguments',
                program = '${file}',
                args = function()
                    local args_string = vim.fn.input('Arguments: ')
                    return vim.split(args_string, " +")
                end,
            })
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
                { text = "", texthl = "DapBreakpointIcon", linehl = "DapBreakpointLine", numhl = "DapBreakpointNumber" })
            vim.fn.sign_define(
                "DapBreakpointCondition",
                { text = "󰟃", texthl = "DapBreakpointIcon", linehl = "DapBreakpoint", numhl = "DapBreakpoint" })
            vim.fn.sign_define(
                "DapBreakpointRejected",
                { text = "", texthl = "DapBreakpointIcon", linehl = "DapBreakpoint", numhl = "DapBreakpoint" })
            vim.fn.sign_define(
                "DapLogPoint",
                { text = "", texthl = "DapLogPointIcon", linehl = "DapLogPoint", numhl = "DapLogPoint" })
            vim.fn.sign_define(
                "DapStopped",
                { text = "", texthl = "DapStoppedIcon", linehl = "DapStopped", numhl = "DapStopped" })

            dap.listeners.before.attach.dapui_config = function()
                dapui.open()
            end
            dap.listeners.before.launch.dapui_config = function()
                dapui.open()
            end
            -- dap.listeners.before.event_terminated.dapui_config = function()
            --     dapui.close()
            -- end
            -- dap.listeners.before.event_exited.dapui_config = function()
            --     dapui.close()
            -- end

            dap_python.setup("python")
            -- dap_python.setup("~/.config/.virtualenvs/debugpy/bin/python")
            dap_python.test_runner = "pytest"

            vim.keymap.set("n", "<leader>dc", function() dap.continue() end, { desc = "Debug Continue" })
            vim.keymap.set("n", "<leader>ds", function() dap.close() end, { desc = "Debug Continue" })
            vim.keymap.set("n", "<leader>db", function() dap.toggle_breakpoint() end, { desc = "Toggle Breakpoint" })

            vim.keymap.set("n", "<Leader>du", function() dapui.toggle() end, { desc = "Toggle DAP UI" })

            vim.keymap.set("n", "<leader>df", function() dap_python.test_method() end, { desc = "Debug Continue" })
            vim.keymap.set("n", "<leader>dC", function() dap_python.test_class() end, { desc = "Debug Continue" })
            vim.keymap.set("n", "<leader>do", function() dap.step_over() end, { desc = "Step Over" })
            vim.keymap.set("n", "<leader>di", function() dap.step_into() end, { desc = "Step Into" })
            vim.keymap.set("n", "<leader>dO", function() dap.step_out() end, { desc = "Step Out" })
        end,
    },
}
