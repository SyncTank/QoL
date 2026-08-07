return {
  "nvim-treesitter/nvim-treesitter",
  branch = "master",
  build = ":TSUpdate",
  config = function()
    local ok, ts = pcall(require, "nvim-treesitter.configs")
    if not ok then
      return
    end

    ts.setup({
      ensure_installed = { "lua", "vim", "vimdoc", "odin", "c", "zig", "go", "sql", "python" },
      highlight = { enable = true },
    })
  end,
}
