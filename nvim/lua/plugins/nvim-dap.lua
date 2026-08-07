return {
    "mfussenegger/nvim-dap",
    event = "VeryLazy",
    dependencies = {
        "rcarriga/nvim-dap-ui",
        "nvim-neotest/nvim-nio",
        "jay-babu/mason-nvim-dap.nvim",
        "theHamsta/nvim-dap-virtual-text",
        "folke/which-key.nvim",
    },
    config = function()
        local mason_dap = require("mason-nvim-dap")
        local dap = require("dap")
        local ui = require("dapui")
        local dap_virtual_text = require("nvim-dap-virtual-text")
        local wk = require("which-key")

        -- Dap Virtual Text
        dap_virtual_text.setup()

        -- Mason DAP Setup
        mason_dap.setup({
            -- Added debuggers for Go (delve) and JS (js-debug-adapter)
            -- Odin doesn't have a Mason-specific adapter package, it uses lldb/cppdbg!
            ensure_installed = { "cppdbg", "delve", "js-debug-adapter" },
            automatic_installation = true,
            handlers = {
                function(config)
                    require("mason-nvim-dap").default_setup(config)
                end,
            },
        })

        -- Configurations
        dap.configurations = {
            -- C & C++
            c = {
                {
                    name = "Launch file",
                    type = "cppdbg",
                    request = "launch",
                    program = function()
                        return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
                    end,
                    cwd = "${workspaceFolder}",
                    stopAtEntry = false,
                    MIMode = "lldb",
                },
            },
            -- GO (Uses Delve via mason-nvim-dap automatically)
            go = {
                {
                    type = "delve",
                    name = "Debug",
                    request = "launch",
                    program = "${file}",
                },
                {
                    type = "delve",
                    name = "Debug test",
                    request = "launch",
                    mode = "test",
                    program = "${file}",
                },
            },

            -- JAVASCRIPT / TYPESCRIPT
            javascript = {
                {
                    type = "pwa-node",
                    request = "launch",
                    name = "Launch file",
                    program = "${file}",
                    cwd = "${workspaceFolder}",
                },
            },
        }

        -- Aliasing configurations for language variants
        dap.configurations.cpp = dap.configurations.c
        dap.configurations.typescript = dap.configurations.javascript
        -- ODIN: Odin outputs native binaries and works perfectly with the C/C++ debugger (lldb/cppdbg)
        dap.configurations.odin = {
            {
                name = "Launch Odin Binary",
                type = "cppdbg",
                request = "launch",
                program = function()
                    -- Suggests standard target directory out folder if you use it, or lets you pick
                    return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
                end,
                cwd = "${workspaceFolder}",
                stopAtEntry = false,
                MIMode = "lldb",
            }
        }

        -- Dap UI
        ui.setup()

        vim.fn.sign_define("DapBreakpoint", { text = "🐞" })

        dap.listeners.before.attach.dapui_config = function() ui.open() end
        dap.listeners.before.launch.dapui_config = function() ui.open() end
        dap.listeners.before.event_terminated.dapui_config = function() ui.close() end
        dap.listeners.before.event_exited.dapui_config = function() ui.close() end

        -- WhichKey Keymaps 
        wk.add({
            { "<leader>d", group = "Debugger", nowait = true, remap = false },
            { "<leader>dt", function() require("dap").toggle_breakpoint() end, desc = "Toggle Breakpoint", nowait = true, remap = false },
            { "<leader>dc", function() require("dap").continue() end, desc = "Continue", nowait = true, remap = false },
            { "<leader>di", function() require("dap").step_into() end, desc = "Step Into", nowait = true, remap = false },
            { "<leader>do", function() require("dap").step_over() end, desc = "Step Over", nowait = true, remap = false },
            { "<leader>du", function() require("dap").step_out() end, desc = "Step Out", nowait = true, remap = false },
            { "<leader>dr", function() require("dap").repl.open() end, desc = "Open REPL", nowait = true, remap = false },
            { "<leader>dl", function() require("dap").run_last() end, desc = "Run Last", nowait = true, remap = false },
            { "<leader>dq", function()
                require("dap").terminate()
                require("dapui").close()
                require("nvim-dap-virtual-text").toggle()
            end, desc = "Terminate", nowait = true, remap = false },
            { "<leader>db", function() require("dap").list_breakpoints() end, desc = "List Breakpoints", nowait = true, remap = false },
            { "<leader>de", function() require("dap").set_exception_breakpoints({ "all" }) end, desc = "Set Exception Breakpoints", nowait = true, remap = false },
        })
    end,
}
