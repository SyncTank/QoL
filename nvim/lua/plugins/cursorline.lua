return {
  'ya2s/nvim-cursorline',
  event = { 'BufReadPost', 'BufNewFile' }, -- Optional: Lazy loads the plugin when you open a file
  config = function()
    require('nvim-cursorline').setup {
      disable_filetypes = {},
      disable_buftypes = {},
      cursorline = {
        enable = true,
        timeout = 1000,
        number = false,
      },
      cursorword = {
        enable = true,
        min_length = 3,
        hl = { underline = true },
      },
    }
  end,
}

