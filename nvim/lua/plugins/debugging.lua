return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")

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

		vim.keymap.set("n", "<leader>bp", dap.toggle_breakpoint, { desc = " [B]reak [P]oint" })
		vim.keymap.set("n", "<leader>bc", dap.continue, { desc = " [B]reak [C]ontinue" })
		vim.keymap.set("n", "<F7>", dap.step_into, { desc = " Step [F7]" })
	end,
}
