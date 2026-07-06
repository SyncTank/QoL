return {
  'hedyhli/outline.nvim',
  event = { 'BufReadPost', 'BufNewFile' },
  lazy = true,
  cmd = { 'Outline', 'OutlineOpen' },
  keys = { -- Example mapping to toggle outline
    { '<leader>o', '<cmd>Outline<CR>', desc = 'T[o]ggle outline' },
  },
  opts = {
    outline_items = {
      -- Hides variables, blocks, and constants to keep just the structures
      show_symbol_details = false,
    },
    symbols = {
      filter = { 'Class', 'Function', 'Method', 'Struct', 'Interface', 'Constructor' },
    },
  },
}
