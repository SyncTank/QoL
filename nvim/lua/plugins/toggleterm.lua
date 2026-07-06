return {
  'akinsho/toggleterm.nvim',
  version = "*",
  keys = {
    -- Lazy load when pressing <leader>t in normal mode
    { '<leader>t', '<cmd>ToggleTerm direction=float<cr>', desc = 'Toggle Terminal' },
  },
  opts = {
    -- Setting this to <leader>t allows it to work in terminal mode to close it
    open_mapping = [[<leader>t]], 
    direction = 'float',
    float_opts = {
      border = 'curved',
    },
  },
  config = function(_, opts)
    require('toggleterm').setup(opts)

    local ok, which_key = pcall(require, 'which-key')
    if ok then
      which_key.add({
        { '<leader>t', desc = '[T]oggle Terminal', mode = { 'n', 't' } },
      })
    end
  end,
}
