return {
    --'folke/tokyonight.nvim',
    'scottmckendry/cyberdream.nvim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    config = function()
      ---@diagnostic disable-next-line: missing-fields
      require('cyberdream').setup {
        styles = {
          comments = { italic = false }, -- Disable italics in comments
        },
        colors = {
          -- Override specific colors
          bg = '#0B0C13',
          green = '#00ff00',
          magenta = '#ff00ff',
        },
      }

      -- Load the colorscheme here.
      -- Like many other themes, this one has different styles, and you could load
      -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
      vim.cmd.colorscheme 'cyberdream'
    end,
}
