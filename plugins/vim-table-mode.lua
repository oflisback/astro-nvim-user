return {
  "dhruvasagar/vim-table-mode",
  config = function()
    vim.g.table_mode_corner = "|"
    vim.g.table_mode_separator = "|"
  end,
  lazy = true,
  ft = { "markdown" },
  cmd = {
    "TableModeEnable",
    "TableModeDisable",
  },
}
