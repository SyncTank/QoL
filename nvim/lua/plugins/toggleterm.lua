return {
  'akinsho/toggleterm.nvim',
  version = "*",
  keys = {
    -- Opens in normal mode
    { '<leader>t', '<cmd>ToggleTerm direction=float<cr>', desc = 'Toggle Terminal', mode = 'n' },
    -- Closes in terminal mode
    { '<leader>t', '<cmd>ToggleTerm<cr>', desc = 'Toggle Terminal', mode = 't' },
  },
  opts = {
    -- REMOVED open_mapping so it doesn't hijack insert mode!
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
