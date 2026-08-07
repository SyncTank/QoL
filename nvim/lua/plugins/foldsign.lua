return {
  'yaocccc/nvim-foldsign',
  -- It relies on tree-sitter or cursor holds, so we load it when opening a file
  event = { 'BufReadPost', 'BufNewFile' },
  --dependencies = { 'nvim-treesitter/nvim-treesitter' },

  -- Wire the toggle function cleanly into which-key
  keys = {
    {
      '<leader>tf',
      function()
        require('nvim-foldsign').toggle_foldsign()
      end,
      desc = '[T]oggle [F]oldsign indicators',
    },
  },

  -- Use opts to store and automatically push your custom style options
  opts = {
    offset = -2,
    foldsigns = {
      open = '▼', -- mark the beginning of an open fold (Default is '-')
      close = '▶', -- show a closed fold (Default is '+')
      seps = { '│', '┃' }, -- open fold middle vertical markers
    },
    enabled = true,
  },

  -- This tells lazy.nvim to unpack your opts table and execute the plugin setup
  config = function(_, opts)
    require('nvim-foldsign').setup(opts)
  end,
}
