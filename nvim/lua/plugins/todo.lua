return {
  'folke/todo-comments.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' }, -- Required for searching
  event = { 'BufReadPost', 'BufNewFile' }, -- Lazy load when opening a file

  -- This sets up the default keymaps and hooks them cleanly into which-key
  keys = {
    {
      ']t',
      function()
        require('todo-comments').jump_next()
      end,
      desc = 'Next TODO comment',
    },
    {
      '[t',
      function()
        require('todo-comments').jump_prev()
      end,
      desc = 'Previous TODO comment',
    },
    {
      '<leader>st',
      '<cmd>TodoTelescope<cr>',
      desc = '[S]earch [T]odo comments (Telescope)',
    },
    {
      '<leader>xt',
      '<cmd>TodoTrouble<cr>',
      desc = 'Todo comments (Trouble)',
    },
  },

  -- opts can be left completely empty {} to use the defaults,
  opts = {
    keywords = {
      FIX = { icon = ' ', color = 'error', alt = { 'FIXME', 'BUG', 'FIXIT', 'ISSUE' } },
      TODO = { icon = ' ', color = 'info' },
      HACK = { icon = ' ', color = 'warning' },
      WARN = { icon = ' ', color = 'warning', alt = { 'WARNING', 'XXX' } },
      PERF = { icon = ' ', color = 'default', alt = { 'OPTIM', 'PERFORMANCE', 'OPTIMIZE' } },
      NOTE = { icon = ' ', color = 'hint', alt = { 'INFO' } },
    },
  },
}
