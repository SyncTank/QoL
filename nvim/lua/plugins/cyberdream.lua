return {
	"scottmckendry/cyberdream.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("cyberdream").setup({
			transparent = false, -- Enable transparent background
			italic_comments = false, -- Enable italics for comments
			hide_fillchars = false, -- Replace all fillchars with ' ' for a clean look
			borderless_telescope = true, -- Modern borderless telescope theme
			terminal_colors = true, -- Set terminal colors used in `:terminal`
			theme = {
				variant = "default",
				highlights = {
					Comment = { fg = "#696969", bg = "NONE", italic = true },
				},
				overrides = function(colors)
					return {
						Comment = { fg = colors.green, bg = "NONE", italic = true },
						["@property"] = { fg = colors.magenta, bold = true },
					}
				end,
				colors = {
					-- Override specific colors
					bg = "#0B0C13",
					green = "#00ff00",
					magenta = "#ff00ff",
				},
			},
		})
		vim.cmd("colorscheme cyberdream")
	end,
}
